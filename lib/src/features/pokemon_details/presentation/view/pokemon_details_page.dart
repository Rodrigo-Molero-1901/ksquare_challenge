// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../bloc/pokemon_details_cubit.dart';
import '../bloc/viewmodels/pokemon_details_view_model.dart';

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
    _cubit.initialize(
      pokemonId: widget.params.pokemonId,
      pokemonName: widget.params.pokemonName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonDetailsCubit, PokemonDetailsState>(
        bloc: _cubit,
        builder: (context, state) {
          return switch (state) {
            PokemonDetailsLoading() => const SizedBox.shrink(),
            PokemonDetailsError() => const SizedBox.shrink(),
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
