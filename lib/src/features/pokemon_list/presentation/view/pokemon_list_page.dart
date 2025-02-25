// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../bloc/pokemon_list_cubit.dart';
import '../bloc/viewmodels/pokemon_list_view_model.dart';

part 'components/pokemon_list_view.dart';
part 'components/navigation.dart';
part 'components/overlay.dart';
part 'pokemon_list_page_params.dart';

@injectable
class PokemonListPage extends StatefulWidget {
  final PokemonListPageParams params;
  final PokemonListCubit _cubit;

  const PokemonListPage({
    required PokemonListCubit cubit,
    @factoryParam required this.params,
  }) : _cubit = cubit;

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late PokemonListCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = widget._cubit;
    _cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PokemonListCubit, PokemonListState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state case PokemonListMain(:final viewModel)) {
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
            PokemonListInitial() => const SizedBox.shrink(),
            PokemonListMain(:final viewModel) => _PokemonListView(
                cubit: _cubit,
                viewModel: viewModel,
              ),
          };
        },
      ),
    );
  }
}
