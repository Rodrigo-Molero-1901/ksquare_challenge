// ignore_for_file: use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/widgets/shimmer/shimmer_container.dart';
import '../../../../router/routes.dart';
import '../../../common/presentation/view/error_view.dart';
import '../bloc/pokemon_list_cubit.dart';
import '../bloc/viewmodels/pokemon_list_view_model.dart';
import '../bloc/viewmodels/pokemon_row_view_model.dart';

part 'components/header.dart';
part 'components/loading_view.dart';
part 'components/navigation.dart';
part 'components/pokemon/pokemon_row.dart';
part 'components/pokemon/pokemons.dart';
part 'components/view.dart';

@injectable
class PokemonListPage extends StatefulWidget {
  final PokemonListCubit _cubit;

  const PokemonListPage({required PokemonListCubit cubit}) : _cubit = cubit;

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
          }
        },
        builder: (context, state) {
          return switch (state) {
            PokemonListError(:final internetError) => ErrorView(
              internetError: internetError,
              onRetry: _cubit.onRetry,
            ),
            PokemonListLoading() => const _PokemonListLoadingView(),
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
