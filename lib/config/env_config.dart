enum Environment { DEV, STAGING, PROD }

class EnvConfig {
  static late final Map<String, dynamic> _config;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = Config.debugConstants;
        break;
      case Environment.PROD:
        _config = Config.prodConstants;
        break;
      default:
        _config = Config.debugConstants;
        break;
    }
  }

  static String get apiUrl => _config[Config.API_URL];
}

class Config {
  static const String API_URL = 'API_URL';

  static final Map<String, dynamic> debugConstants = {
    API_URL: 'https://freelancer.timviec365.com/api_app/sdfsdxccx',
  };

  static final Map<String, dynamic> prodConstants = {
    API_URL: 'https://PhamTheSon/',
  };
}
