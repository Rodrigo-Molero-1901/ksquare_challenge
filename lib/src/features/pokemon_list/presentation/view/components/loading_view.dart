part of '../pokemon_list_page.dart';

class _PokemonListLoadingView extends StatelessWidget {
  const _PokemonListLoadingView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(height: 14.0, width: 150.0),
          const SizedBox(height: 16.0),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (_, __) => SizedBox(height: 10.0),
            itemBuilder: (context, index) {
              return ShimmerContainer(
                height: 75.0,
                width: MediaQuery.sizeOf(context).width,
              );
            },
          ),
        ],
      ),
    );
  }
}
