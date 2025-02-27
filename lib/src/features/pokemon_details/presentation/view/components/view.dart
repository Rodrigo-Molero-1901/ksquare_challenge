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
            Center(
              child: Text(
                viewModel.name,
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w700),
              ),
            ),
            _ImageToggler(viewModel: viewModel),
            Text('Número de orden: ${viewModel.orderNumber}'),
            Text('Experiencia base: ${viewModel.baseExp}'),
            Text('Altura: ${viewModel.height} m'),
            Text('Masa: ${viewModel.weight} kg'),
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
