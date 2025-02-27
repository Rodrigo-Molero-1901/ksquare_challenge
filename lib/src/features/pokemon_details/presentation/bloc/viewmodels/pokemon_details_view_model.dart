import 'package:ksquare_challenge/src/core/shared/utils/extensions/string_ext.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../../../common/data/models/pokemon_details.dart';
import 'pokemon_stat_row_view_model.dart';

enum PokemonDetailsStatus { loading, error, success }

class PokemonDetailsViewModel {
  final PokemonDetailsStatus pokemonDetailsStatus;
  final String name;
  final String orderNumber;
  final String baseExp;
  final String height;
  final String weight;
  final String imageUrl;
  final String shinyImageUrl;
  final List<PokemonStatRowViewModel> statRowViewModels;

  PokemonDetailsViewModel.fromSuccessState({
    required this.pokemonDetailsStatus,
    required PokemonDetailsModel pokemon,
  }) : name = pokemon.name.safeValue.capitalize(),
       orderNumber = pokemon.orderNumber.safeValue.toString(),
       baseExp = pokemon.baseExp.safeValue.toString(),
       height = pokemon.height.safeValue.toString(),
       weight = pokemon.weight.safeValue.toString(),
       imageUrl = pokemon.imageUrl.safeValue,
       shinyImageUrl = pokemon.shinyImageUrl.safeValue,
       statRowViewModels =
           pokemon.stats.safeValue
               .map(PokemonStatRowViewModel.fromModel)
               .toList();
}
