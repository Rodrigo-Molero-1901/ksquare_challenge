part of '../pokemon_details_page.dart';

class _PokemonDetailsLoadingView extends StatelessWidget {
  const _PokemonDetailsLoadingView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12.0,
          children: [
            Center(child: ShimmerContainer(height: 24, width: 150)),
            Center(child: ShimmerContainer(height: 154, width: 125)),
            ...List.generate(
              10,
              (_) => ShimmerContainer(height: 14, width: 150),
            ),
          ],
        ),
      ),
    );
  }
}
