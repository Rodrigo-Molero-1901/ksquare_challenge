part of '../pokemon_details_page.dart';

class _ImageToggler extends StatefulWidget {
  final PokemonDetailsViewModel viewModel;

  const _ImageToggler({required this.viewModel});

  @override
  State<_ImageToggler> createState() => _ImageTogglerState();
}

class _ImageTogglerState extends State<_ImageToggler> {
  late String _currentImageUrl;
  bool _isShiny = false;

  @override
  void initState() {
    super.initState();
    _currentImageUrl = widget.viewModel.imageUrl;
  }

  void _toggleImage() {
    setState(() {
      _isShiny = !_isShiny;
      _currentImageUrl =
          _isShiny ? widget.viewModel.shinyImageUrl : widget.viewModel.imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 150,
        width: 125,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: _currentImageUrl,
                fit: BoxFit.contain,
                fadeInDuration: const Duration(milliseconds: 150),
                fadeOutDuration: const Duration(milliseconds: 150),
                errorWidget: (_, __, ___) => const Icon(Icons.warning),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: _toggleImage,
                child: Assets.icons.shinyIcon.svg(
                  height: 25,
                  width: 25,
                  colorFilter:
                      _isShiny
                          ? ColorFilter.mode(Colors.yellow, BlendMode.srcIn)
                          : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
