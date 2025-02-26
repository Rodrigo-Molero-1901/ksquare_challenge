import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract final class Connectivity {
  static Future<bool> get hasInternetAccess async {
    final internetStatus = await InternetConnection().internetStatus;
    if (internetStatus == InternetStatus.disconnected) return false;
    return await InternetConnection().hasInternetAccess;
  }
}
