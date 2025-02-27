part of '../../pokemon_list_page.dart';

class _PokemonRow extends StatelessWidget {
  final PokemonRowViewModel rowViewModel;
  final Function() onTap;

  const _PokemonRow({required this.rowViewModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: rowViewModel.imageUrl,
        fit: BoxFit.cover,
        height: 75,
        width: 55,
        fadeInDuration: const Duration(milliseconds: 150),
        fadeOutDuration: const Duration(milliseconds: 150),
        errorWidget: (_, __, ___) => const Icon(Icons.warning),
      ),
      title: Text(rowViewModel.name),
      onTap: onTap,
    );
  }
}
