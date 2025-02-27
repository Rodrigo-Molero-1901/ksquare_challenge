class PokemonDetailsModel {
  String? name;
  int? orderNumber;
  int? baseExp;
  double? height;
  double? weight;
  String? imageUrl;
  String? shinyImageUrl;
  List<PokemonStatModel>? stats;

  PokemonDetailsModel({
    this.name,
    this.orderNumber,
    this.baseExp,
    this.height,
    this.weight,
    this.imageUrl,
    this.shinyImageUrl,
    this.stats,
  });
}

class PokemonStatModel {
  int? value;
  String? name;

  PokemonStatModel({this.value, this.name});
}
