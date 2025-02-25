part of '../pokemon_details_page.dart';

extension _NavigationExtension on PokemonDetailsNavigation {
  void navigate(BuildContext context) {
    switch (this) {
      case ExitNavigation():
        context.pop();
    }
  }
}
