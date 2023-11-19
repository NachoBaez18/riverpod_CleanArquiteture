enum AppEnviroment { DEV, STAGING, PROD }

abstract class EnvInfo {
  static AppEnviroment _enviroment = AppEnviroment.DEV;

  static void initialize(AppEnviroment enviroment) {
    EnvInfo._enviroment = enviroment;
  }

  static String get appName => _enviroment._appTitle;
  static String get envName => _enviroment._envName;
  static String get connectionsString => _enviroment._connectionString;
  static AppEnviroment get enviroment => _enviroment;
  static bool get isProduccion => _enviroment == AppEnviroment.PROD;
}

extension _EnvProperties on AppEnviroment {
  static const _appTitles = {
    AppEnviroment.DEV: 'Cobranza TDD Dev',
    AppEnviroment.STAGING: 'Conranza TDD Staging',
    AppEnviroment.PROD: 'Cobranza TDD'
  };

  static const _connectionStrings = {
    AppEnviroment.DEV: 'http://192.168.0.16:8000/api',
    AppEnviroment.STAGING: 'http://192.168.0.16:8000',
    AppEnviroment.PROD: 'http://192.168.0.16:8000',
  };

  static const _envs = {
    AppEnviroment.DEV: 'dev',
    AppEnviroment.STAGING: 'staging',
    AppEnviroment.PROD: 'prod'
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _connectionString => _connectionStrings[this]!;
}
