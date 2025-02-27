// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api_client/api_manager/api_manager.dart' as _i71;
import '../features/common/data/repositories/pokemon_repository_impl.dart'
    as _i944;
import '../features/common/domain/repositories/pokemon_repository.dart'
    as _i908;
import '../features/pokemon_details/presentation/bloc/pokemon_details_cubit.dart'
    as _i965;
import '../features/pokemon_details/presentation/view/pokemon_details_page.dart'
    as _i323;
import '../features/pokemon_list/presentation/bloc/pokemon_list_cubit.dart'
    as _i435;
import '../features/pokemon_list/presentation/view/pokemon_list_page.dart'
    as _i876;
import 'module.dart' as _i946;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i71.ApiManager>(() => appModule.apiManager);
    gh.factory<_i908.PokemonRepository>(
      () => _i944.PokemonRepositoryImpl(gh<_i71.ApiManager>()),
    );
    gh.factory<_i965.PokemonDetailsCubit>(
      () => _i965.PokemonDetailsCubit(
        pokemonRepository: gh<_i908.PokemonRepository>(),
      ),
    );
    gh.factory<_i435.PokemonListCubit>(
      () => _i435.PokemonListCubit(
        pokemonRepository: gh<_i908.PokemonRepository>(),
      ),
    );
    gh.factoryParam<
      _i323.PokemonDetailsPage,
      _i323.PokemonDetailsPageParams,
      dynamic
    >(
      (params, _) => _i323.PokemonDetailsPage(
        cubit: gh<_i965.PokemonDetailsCubit>(),
        params: params,
      ),
    );
    gh.factory<_i876.PokemonListPage>(
      () => _i876.PokemonListPage(cubit: gh<_i435.PokemonListCubit>()),
    );
    return this;
  }
}

class _$AppModule extends _i946.AppModule {}
