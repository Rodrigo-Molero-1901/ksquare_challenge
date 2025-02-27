import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ksquare_challenge/src/core/api_client/api_manager/api_manager.dart';
import 'package:ksquare_challenge/src/core/api_client/error/api_error.dart';
import 'package:ksquare_challenge/src/core/api_client/utils/connectivity.dart';
import 'package:ksquare_challenge/src/features/common/data/models/pokemon_details.dart';
import 'package:ksquare_challenge/src/features/common/domain/repositories/pokemon_repository.dart';
import 'package:ksquare_challenge/src/features/pokemon_details/presentation/bloc/pokemon_details_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'pokemon_details_cubit_test.mocks.dart';

@GenerateMocks([Connectivity, PokemonRepository, ApiManager, ApiError])
void main() {
  const pokemonId = 'id';
  const pokemonName = 'Ditto';
  const errorCode = '500';

  provideDummy<Either<ApiError, PokemonDetailsModel>>(
    Right(PokemonDetailsModel(name: pokemonName)),
  );

  provideDummy<Either<ApiError, PokemonDetailsModel>>(
    Left(ApiError(errorCode: errorCode)),
  );

  TestWidgetsFlutterBinding.ensureInitialized();

  late MockConnectivity mockConnectivity;
  late MockPokemonRepository mockPokemonRepository;
  late PokemonDetailsCubit mockPokemonDetailsCubit;

  setUp(() {
    mockConnectivity = MockConnectivity();
    mockPokemonRepository = MockPokemonRepository();
    mockPokemonDetailsCubit = PokemonDetailsCubit(
      pokemonRepository: mockPokemonRepository,
      connectivity: mockConnectivity,
    );
  });

  group('Pokemon Details Cubit tests', () {
    group('initialize() method tests', () {
      blocTest<PokemonDetailsCubit, PokemonDetailsState>(
        'GIVEN PokemonDetailsPage\'s starts '
        'THEN a PokemonDetailsState should exist',
        build: () => mockPokemonDetailsCubit,
        expect: () => [],
      );

      blocTest<PokemonDetailsCubit, PokemonDetailsState>(
        'GIVEN PokemonDetailsPage\'s starts and internet is available '
        'WHEN initialize() is called and API returns data'
        'THEN [PokemonDetailsLoading, PokemonDetailsMain] are emitted',
        build: () {
          when(
            mockConnectivity.hasInternetAccess(),
          ).thenAnswer((_) async => true);

          when(
            mockPokemonRepository.getPokemonDetails(id: pokemonId),
          ).thenAnswer(
            (_) async => Right(PokemonDetailsModel(name: pokemonName)),
          );

          return mockPokemonDetailsCubit;
        },
        act: (_) async {
          await mockPokemonDetailsCubit.initialize(pokemonId: pokemonId);
        },
        expect:
            () => [
              isA<PokemonDetailsLoading>(),
              isA<PokemonDetailsMain>().having(
                (state) {
                  return state.viewModel.name;
                },
                'The name attribute of the Main state\'s viewModel should be \'Ditto\'',
                equals(pokemonName),
              ),
            ],
        verify: (_) {
          verify(
            mockPokemonRepository.getPokemonDetails(id: pokemonId),
          ).called(1);
          verifyNoMoreInteractions(mockPokemonRepository);
        },
      );

      blocTest<PokemonDetailsCubit, PokemonDetailsState>(
        'GIVEN PokemonDetailsPage\'s starts and internet is available '
        'WHEN initialize() is called and API returns error '
        'THEN [PokemonDetailsLoading, PokemonDetailsError] are emitted',
        build: () {
          when(
            mockConnectivity.hasInternetAccess(),
          ).thenAnswer((_) async => true);

          when(
            mockPokemonRepository.getPokemonDetails(id: pokemonId),
          ).thenAnswer((_) async => Left(ApiError(errorCode: errorCode)));

          return mockPokemonDetailsCubit;
        },
        act: (_) async {
          await mockPokemonDetailsCubit.initialize(pokemonId: pokemonId);
        },
        expect:
            () => [
              isA<PokemonDetailsLoading>(),
              isA<PokemonDetailsError>().having(
                (state) {
                  return state.internetError;
                },
                'The internetError attribute of the Error state should be false',
                equals(false),
              ),
            ],
        verify: (_) {
          verify(
            mockPokemonRepository.getPokemonDetails(id: pokemonId),
          ).called(1);
          verifyNoMoreInteractions(mockPokemonRepository);
        },
      );

      blocTest<PokemonDetailsCubit, PokemonDetailsState>(
        'GIVEN PokemonDetailsPage\'s starts and internet is not available '
        'WHEN initialize() is called '
        'THEN [PokemonDetailsError] is emitted',
        build: () {
          when(
            mockConnectivity.hasInternetAccess(),
          ).thenAnswer((_) async => false);

          return mockPokemonDetailsCubit;
        },
        act: (_) async {
          await mockPokemonDetailsCubit.initialize(pokemonId: pokemonId);
        },
        expect:
            () => [
              isA<PokemonDetailsError>().having(
                (state) {
                  return state.internetError;
                },
                'The internetError attribute of the Error state should be true',
                equals(true),
              ),
            ],
        verify: (_) {
          verifyNever(mockPokemonRepository.getPokemonDetails(id: pokemonId));
          verifyNoMoreInteractions(mockPokemonRepository);
        },
      );
    });
  });
}
