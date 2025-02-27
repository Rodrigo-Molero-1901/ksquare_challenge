import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../../../core/api_client/utils/connectivity.dart';
import '../../../common/data/models/pokemon_details.dart';
import '../../../common/domain/repositories/pokemon_repository.dart';
import 'viewmodels/pokemon_details_view_model.dart';

part 'pokemon_details_state.dart';

@injectable
class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  final PokemonRepository _pokemonRepository;
  final Connectivity _connectivity;

  PokemonDetailsCubit({
    required PokemonRepository pokemonRepository,
    required Connectivity connectivity,
  }) : _pokemonRepository = pokemonRepository,
       _connectivity = connectivity,
       super(PokemonDetailsInitial());

  late String _pokemonId;

  var _pokemonDetailsStatus = PokemonDetailsStatus.initial;
  late PokemonDetailsModel _pokemon;

  Future<void> initialize({String? pokemonId}) async {
    if (pokemonId.isNull) {
      _emitError();
      return;
    }

    _pokemonId = pokemonId!;

    if (!await _connectivity.hasInternetAccess()) {
      _emitError(internetError: true);
      return;
    }

    _emitLoading();
    await _getPokemonData();
    _pokemonDetailsStatus == PokemonDetailsStatus.success
        ? _emitMain()
        : _emitError();
  }

  Future<void> _getPokemonData() async {
    final result = await _pokemonRepository.getPokemonDetails(id: _pokemonId);
    result.fold(
      (error) {
        _pokemonDetailsStatus = PokemonDetailsStatus.error;
      },
      (pokemon) {
        _pokemonDetailsStatus = PokemonDetailsStatus.success;
        _pokemon = pokemon;
      },
    );
  }

  void _emitError({bool internetError = false}) {
    emit(PokemonDetailsError(internetError: internetError));
  }

  void _emitLoading() {
    emit(PokemonDetailsLoading());
  }

  void _emitMain() {
    emit(
      PokemonDetailsMain(
        viewModel: PokemonDetailsViewModel.fromSuccessState(
          pokemonDetailsStatus: _pokemonDetailsStatus,
          pokemon: _pokemon,
        ),
      ),
    );
  }

  Future<void> onRetry() async {
    _pokemonDetailsStatus = PokemonDetailsStatus.initial;
    await initialize();
  }
}
