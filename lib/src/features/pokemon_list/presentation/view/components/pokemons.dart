part of '../pokemon_list_page.dart';

class _Pokemons extends StatelessWidget {
  final PokemonListCubit cubit;
  final PokemonListViewModel viewModel;

  const _Pokemons({required this.cubit, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => Container(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Elemento en posición: $index'),
          onTap: () => cubit.onPokemonTapped(pos: index),
        );
      },
    );
  }
}
