import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Connectivity {
  Future<bool> hasInternetAccess() async {
    final internetStatus = await InternetConnection().internetStatus;
    if (internetStatus == InternetStatus.disconnected) return false;
    return await InternetConnection().hasInternetAccess;
  }
}
