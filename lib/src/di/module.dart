import 'package:injectable/injectable.dart';

import '../core/api_client/api_manager/api_manager.dart';

@module
abstract class AppModule {
  @lazySingleton
  ApiManager get apiManager => ApiManager.init();
}
