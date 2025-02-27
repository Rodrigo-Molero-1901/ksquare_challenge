// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/gen/assets.gen.dart';
import '../../../../core/shared/widgets/shimmer/shimmer_container.dart';
import '../../../common/presentation/view/error_view.dart';
import '../bloc/pokemon_details_cubit.dart';
import '../bloc/viewmodels/pokemon_details_view_model.dart';

part 'components/image_toggler.dart';
part 'components/loading_view.dart';
part 'components/view.dart';
part 'pokemon_details_page_params.dart';

@injectable
class PokemonDetailsPage extends StatefulWidget {
  final PokemonDetailsPageParams params;
  final PokemonDetailsCubit _cubit;

  const PokemonDetailsPage({
    required PokemonDetailsCubit cubit,
    @factoryParam required this.params,
  }) : _cubit = cubit;

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  late PokemonDetailsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize(pokemonId: widget.params.pokemonId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
        bloc: _cubit,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(icon: Icon(Icons.arrow_back), onPressed: context.pop),
              switch (state) {
                PokemonDetailsInitial() => const SizedBox.shrink(),
                PokemonDetailsError(:final internetError) => ErrorView(
                  internetError: internetError,
                  onRetry: _cubit.onRetry,
                ),
                PokemonDetailsLoading() => const _PokemonDetailsLoadingView(),
                PokemonDetailsMain(:final viewModel) => _PokemonDetailsView(
                  viewModel: viewModel,
                ),
              },
            ],
          );
        },
      ),
    );
  }
}
