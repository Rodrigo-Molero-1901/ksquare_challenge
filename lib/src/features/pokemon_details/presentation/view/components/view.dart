part of '../pokemon_details_page.dart';

class _PokemonDetailsView extends StatelessWidget {
  final PokemonDetailsCubit cubit;
  final PokemonDetailsViewModel viewModel;

  const _PokemonDetailsView({
    required this.cubit,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
