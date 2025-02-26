part of '../pokemon_list_page.dart';

class _PokemonListView extends StatelessWidget {
  final PokemonListCubit cubit;
  final PokemonListViewModel viewModel;

  const _PokemonListView({required this.cubit, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(),
          SizedBox(height: 15),
          _Pokemons(cubit: cubit, viewModel: viewModel),
        ],
      ),
    );
  }
}
