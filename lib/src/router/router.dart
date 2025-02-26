import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:safe_extensions/safe_extensions.dart';

import '../di/injection.dart';
import '../features/common/presentation/view/root_scaffold.dart';
import '../features/common/presentation/view/search_scaffold.dart';
import '../features/pokemon_details/presentation/view/pokemon_details_page.dart';
import '../features/pokemon_list/presentation/view/pokemon_list_page.dart';
import 'routes.dart';

abstract final class AppRouter {
  static GoRouter get router => _router;

  static final _router = GoRouter(
    initialLocation: AppRoutes.pathPokemonList,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return RootScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.pathPokemonList,
                name: AppRoutes.namePokemonList,
                builder: (context, state) {
                  return injector<PokemonListPage>();
                },
                routes: [
                  GoRoute(
                    path: AppRoutes.pathPokemonDetails,
                    name: AppRoutes.namePokemonDetails,
                    builder: (context, state) {
                      final pokemonId = state.pathParameters['id'];
                      final pokemonName = state.extra as String?;

                      final params = PokemonDetailsPageParams(
                        pokemonId: pokemonId,
                        pokemonName: pokemonName.safe('Undefined'),
                      );

                      return injector<PokemonDetailsPage>(param1: params);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) {
                  return SearchScaffold(navigationShell: navigationShell);
                },
                branches: [
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: AppRoutes.pathSearchByName,
                        name: AppRoutes.nameSearchByName,
                        builder:
                            (context, state) =>
                                Center(child: Text('BUSCAR POR NOMBRE')),
                      ),
                    ],
                  ),
                  StatefulShellBranch(
                    routes: [
                      GoRoute(
                        path: AppRoutes.pathSearchByAbility,
                        name: AppRoutes.nameSearchByAbility,
                        builder:
                            (context, state) =>
                                Center(child: Text('BUSCAR POR HABILIDAD')),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
