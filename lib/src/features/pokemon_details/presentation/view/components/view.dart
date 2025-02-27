part of '../pokemon_details_page.dart';

class _PokemonDetailsView extends StatelessWidget {
  final PokemonDetailsViewModel viewModel;

  const _PokemonDetailsView({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6.0,
          children: [
            if (viewModel.name.isNotEmpty)
              Center(
                child: Text(
                  viewModel.name,
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
                ),
              ),
            if (viewModel.shouldShowPokemonImage)
              _ImageToggler(viewModel: viewModel),
            if (viewModel.orderNumber.isNotEmpty)
              Text('Número de orden: ${viewModel.orderNumber}'),
            if (viewModel.baseExp.isNotEmpty)
              Text('Experiencia base: ${viewModel.baseExp}'),
            if (viewModel.height.isNotEmpty)
              Text('Altura: ${viewModel.height} m'),
            if (viewModel.weight.isNotEmpty)
              Text('Masa: ${viewModel.weight} kg'),
            if (viewModel.statRowViewModels.isNotEmpty)
              ...viewModel.statRowViewModels.map(
                (rowViewModel) => Row(
                  spacing: 6.0,
                  children: [
                    Text(rowViewModel.name),
                    Icon(Icons.arrow_forward, size: 12),
                    Text(rowViewModel.value),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
