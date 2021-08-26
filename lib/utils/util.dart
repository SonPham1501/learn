
import 'package:learn/plugin/dio.dart';
import 'package:learn/routes/route_name.dart';
import 'package:learn/utils/secure_storage_service.dart';

class UtilService {


  static void toDoWhenLogout() {
    SecureStorageService.removeToke();
    SecureStorageService.removeAccount();
    navigationService.navigatePushAndRemoveUntil(RouteName.login);
  }
}