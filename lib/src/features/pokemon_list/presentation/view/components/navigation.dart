part of '../pokemon_list_page.dart';

extension _NavigationExtension on PokemonListNavigation {
  void navigate(BuildContext context) {
    switch (this) {
      case ExitNavigation():
        context.pop();
    }
  }
}
