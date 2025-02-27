class PokemonDetailsResponseModel {
  String? name;
  int? orderNumber;
  int? baseExp;
  int? height;
  int? weight;
  PokemonSpriteResponseModel? sprites;
  List<PokemonStatResponseModel>? stats;

  PokemonDetailsResponseModel({
    this.name,
    this.orderNumber,
    this.baseExp,
    this.height,
    this.weight,
    this.sprites,
    this.stats,
  });

  factory PokemonDetailsResponseModel.fromJson(Map<String, dynamic>? json) {
    return PokemonDetailsResponseModel(
      name: json?['name'],
      orderNumber: json?['order'],
      baseExp: json?['base_experience'],
      height: json?['height'],
      weight: json?['weight'],
      sprites: PokemonSpriteResponseModel.fromJson(json?['sprites']),
      stats:
          (json?['stats'] as List<dynamic>)
              .map((e) => PokemonStatResponseModel.fromJson(e))
              .toList(),
    );
  }
}

class PokemonSpriteResponseModel {
  String? imageUrl;
  String? shinyImageUrl;

  PokemonSpriteResponseModel({this.imageUrl, this.shinyImageUrl});

  factory PokemonSpriteResponseModel.fromJson(Map<String, dynamic>? json) {
    return PokemonSpriteResponseModel(
      imageUrl: json?['front_default'],
      shinyImageUrl: json?['front_shiny'],
    );
  }
}

class PokemonStatResponseModel {
  int? value;
  String? name;

  PokemonStatResponseModel({this.value, this.name});

  factory PokemonStatResponseModel.fromJson(Map<String, dynamic>? json) {
    return PokemonStatResponseModel(
      value: json?['base_stat'],
      name: json?['stat']['name'],
    );
  }
}
