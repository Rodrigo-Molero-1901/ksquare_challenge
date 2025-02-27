part of '../pokemon_list_page.dart';

class _PokemonListView extends StatefulWidget {
  final PokemonListCubit cubit;
  final PokemonListViewModel viewModel;

  const _PokemonListView({required this.cubit, required this.viewModel});

  @override
  State<_PokemonListView> createState() => _PokemonListViewState();
}

class _PokemonListViewState extends State<_PokemonListView> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      final position = _scrollController.position;
      final isAtBottom = position.pixels == position.maxScrollExtent;
      if (isAtBottom) {
        widget.cubit.onLoadMorePokemons();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.cubit.onRetry,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _Header(),
            const SizedBox(height: 16.0),
            _Pokemons(cubit: widget.cubit, viewModel: widget.viewModel),
            const SizedBox(height: 8.0),
            if (widget.viewModel.loadingIndicatorStatus.isVisible)
              Center(child: const CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
