import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../../../core/api_client/utils/connectivity.dart';
import '../../../common/data/models/pokemon_row.dart';
import '../../../common/domain/repositories/pokemon_repository.dart';
import 'viewmodels/pokemon_list_view_model.dart';

part 'pokemon_list_state.dart';

@injectable
class PokemonListCubit extends Cubit<PokemonListState> {
  final PokemonRepository _pokemonRepository;

  PokemonListCubit({required PokemonRepository pokemonRepository})
    : _pokemonRepository = pokemonRepository,
      super(PokemonListLoading());

  static const _initialOffset = 0;
  static const _increment = 20;
  var _offset = _initialOffset;

  var _pokemonListStatus = PokemonListStatus.loading;
  var _pokemons = <PokemonRowModel>[];

  var _loadingIndicatorStatus = LoadingIndicatorStatus.invisible;

  Future<void> initialize() async {
    if (!await Connectivity.hasInternetAccess) {
      _emitError(internetError: true);
      return;
    }

    await _getPokemons();
    _pokemonListStatus == PokemonListStatus.success
        ? _emitMain()
        : _emitError();
  }

  Future<void> _getPokemons() async {
    final result = await _pokemonRepository.getAllPokemons(offset: _offset);
    result.fold(
      (error) {
        _pokemonListStatus = PokemonListStatus.error;
      },
      (pokemons) {
        _pokemonListStatus = PokemonListStatus.success;
        _pokemons.addAll(pokemons);
      },
    );
  }

  void _emitError({bool internetError = false}) {
    emit(PokemonListError(internetError: internetError));
  }

  void _emitMain({PokemonListNavigation? navigation}) {
    emit(
      PokemonListMain(
        viewModel: PokemonListViewModel.fromSuccessState(
          pokemonListStatus: _pokemonListStatus,
          pokemons: _pokemons,
          loadingIndicatorStatus: _loadingIndicatorStatus,
          navigation: navigation,
        ),
      ),
    );
  }

  Future<void> onLoadMorePokemons() async {
    _loadingIndicatorStatus = LoadingIndicatorStatus.visible;
    _emitMain();

    _offset += _increment;
    await _getPokemons();
    _loadingIndicatorStatus = LoadingIndicatorStatus.invisible;
    _emitMain();
  }

  void onPokemonTapped({required int pos}) {
    _emitMain(
      navigation: DetailsNavigation(pokemonId: _pokemons[pos].id.safeValue),
    );
  }

  Future<void> onRetry() async {
    emit(PokemonListLoading());
    _offset = _initialOffset;
    _pokemonListStatus = PokemonListStatus.loading;
    await initialize();
  }
}
