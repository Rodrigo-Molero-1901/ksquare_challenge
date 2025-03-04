part of '../pokemon_list_page.dart';

extension _NavigationExtension on PokemonListNavigation {
  void navigate(BuildContext context) {
    switch (this) {
      case DetailsNavigation(:final pokemonId):
        context.pushNamed(
          AppRoutes.namePokemonDetails,
          pathParameters: {'id': pokemonId},
        );
    }
  }
}
