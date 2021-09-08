import 'package:learn/config/env_config.dart';

class Constant {
  static final String apiUrl = EnvConfig.apiUrl;

  static const int successText = 201;

  static const int errorText = 404;

  static bool isShowingDialog = false;

  static bool isForceLogin = false;

  static const int GITHUB_API_REFUSED = -4;

  static const int NETWORK_TIMEOUT = -2;
}
