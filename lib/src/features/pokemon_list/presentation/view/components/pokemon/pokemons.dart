part of '../../pokemon_list_page.dart';

class _Pokemons extends StatelessWidget {
  final PokemonListCubit cubit;
  final PokemonListViewModel viewModel;

  const _Pokemons({required this.cubit, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    if (viewModel.pokemonRowViewModels.isEmpty) {
      return const Text('No hay pokemones... ¿Qué pasó? o.O');
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: viewModel.pokemonRowViewModels.length,
      separatorBuilder: (_, __) => SizedBox(height: 10.0),
      itemBuilder: (context, index) {
        final rowViewModel = viewModel.pokemonRowViewModels[index];
        return _PokemonRow(
          rowViewModel: rowViewModel,
          onTap: () => cubit.onPokemonTapped(pos: index),
        );
      },
    );
  }
}
