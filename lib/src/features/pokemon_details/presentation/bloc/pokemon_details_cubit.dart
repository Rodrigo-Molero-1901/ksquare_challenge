import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'viewmodels/pokemon_details_view_model.dart';

part 'pokemon_details_state.dart';

@injectable
class PokemonDetailsCubit extends Cubit<PokemonDetailsState> {
  PokemonDetailsCubit() : super(PokemonDetailsInitial());

  Future<void> initialize() async {
    _emitMain();
  }

  void _emitMain({
    PokemonDetailsNavigation? navigation,
    PokemonDetailsOverlay? overlay,
  }) {
    emit(
      PokemonDetailsMain(
        viewModel: PokemonDetailsViewModel.fromSuccessState(
          navigation: navigation,
          overlay: overlay,
        ),
      ),
    );
  }
}
