import 'package:ksquare_challenge/src/core/shared/utils/extensions/string_ext.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../../../../common/data/models/pokemon_details.dart';

class PokemonStatRowViewModel {
  final String value;
  final String name;

  PokemonStatRowViewModel.fromModel(PokemonStatModel model)
    : value = model.value.safeValue.toString(),
      name = model.name.safeValue.capitalize();
}
