import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'viewmodels/pokemon_list_view_model.dart';

part 'pokemon_list_state.dart';

@injectable
class PokemonListCubit extends Cubit<PokemonListState> {
  PokemonListCubit() : super(PokemonListInitial());

  Future<void> initialize() async {
    _emitMain();
  }

  void _emitMain({
    PokemonListNavigation? navigation,
    PokemonListOverlay? overlay,
  }) {
    emit(
      PokemonListMain(
        viewModel: PokemonListViewModel.fromSuccessState(
          navigation: navigation,
          overlay: overlay,
        ),
      ),
    );
  }
}
