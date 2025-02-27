import 'package:ksquare_challenge/src/core/shared/utils/extensions/string_ext.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../../../common/data/models/pokemon_row.dart';

class PokemonRowViewModel {
  final String _id;
  final String name;

  PokemonRowViewModel.fromModel(PokemonRowModel model)
    : _id = model.id.safeValue,
      name = model.name.safeValue.capitalize();

  String get imageUrl {
    const baseUrl = 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/';
    const fileExt = '.png';
    final id = _id.padLeft(3, '0');
    return '$baseUrl$id$fileExt';
  }
}
