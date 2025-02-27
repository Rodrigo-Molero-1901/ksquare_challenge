import 'package:safe_extensions/safe_extensions.dart';

class PokemonRowResponseModel {
  String? id;
  String? name;
  String? url;

  PokemonRowResponseModel({this.name, this.url}) {
    id = _idFromUrl;
  }

  String get _idFromUrl {
    final regex = RegExp(r'(\d+)/$');
    final match = regex.firstMatch(url.safeValue);
    return (match?.group(1)).safeValue;
  }

  factory PokemonRowResponseModel.fromJson(Map<String, dynamic>? json) {
    return PokemonRowResponseModel(name: json?['name'], url: json?['url']);
  }
}
