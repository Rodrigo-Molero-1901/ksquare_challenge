// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../bloc/pokemon_details_cubit.dart';
import '../bloc/viewmodels/pokemon_details_view_model.dart';

part 'components/pokemon_details_view.dart';
part 'components/navigation.dart';
part 'components/overlay.dart';
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
    _cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PokemonDetailsCubit, PokemonDetailsState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state case PokemonDetailsMain(:final viewModel)) {
            if (viewModel.navigation != null) {
              viewModel.navigation!.navigate(context);
            }

            if (viewModel.overlay != null) {
              viewModel.overlay!.showOverlay(context);
            }
          }
        },
        builder: (context, state) {
          return switch (state) {
            PokemonDetailsInitial() => const SizedBox.shrink(),
            PokemonDetailsMain(:final viewModel) => _PokemonDetailsView(
                cubit: _cubit,
                viewModel: viewModel,
              ),
          };
        },
      ),
    );
  }
}
