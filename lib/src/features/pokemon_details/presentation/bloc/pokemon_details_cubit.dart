import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../../../core/api_client/utils/connectivity.dart';
import 'viewmodels/pokemon_details_view_model.dart';

part 'pokemon_details_state.dart';

@injectable
class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(PokemonDetailsLoading());

  late String _pokemonName;

  Future<void> initialize({
    String? pokemonId,
    required String pokemonName,
  }) async {
    _pokemonName = pokemonName;

    if (pokemonId.isNull) {
      _emitError();
      return;
    }

    if (!await Connectivity.hasInternetAccess) {
      _emitError(internetError: true);
      return;
    }

    _emitMain();
  }

  void _emitError({bool internetError = false}) {
    emit(PokemonDetailsError(internetError: internetError));
  }

  void _emitMain() {
    emit(
      PokemonDetailsMain(
        viewModel: PokemonDetailsViewModel.fromSuccessState(
          pokemonName: _pokemonName,
        ),
      ),
    );
  }
}
