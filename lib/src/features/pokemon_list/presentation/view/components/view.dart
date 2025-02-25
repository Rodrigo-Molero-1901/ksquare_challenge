part of '../pokemon_list_page.dart';

class _PokemonListView extends StatelessWidget {
  final PokemonListCubit cubit;
  final PokemonListViewModel viewModel;

  const _PokemonListView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
