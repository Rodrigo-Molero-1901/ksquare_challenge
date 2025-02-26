class PokemonRowResponseModel {
  String? id;
  String? name;
  String? url;

  PokemonRowResponseModel({this.name, this.url}) : id = url;

  factory PokemonRowResponseModel.fromJson(Map<String, dynamic>? json) {
    return PokemonRowResponseModel(name: json?['name'], url: json?['url']);
  }
}
