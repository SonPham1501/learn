
import 'package:learn/config/env_config.dart';

class Constant{
  static final String apiUrl = EnvConfig.apiUrl;

  static const int successText = 200;

  static const int errorText = 404;

  static bool isShowingDialog = false;

  static bool isForceLogin = false;
}