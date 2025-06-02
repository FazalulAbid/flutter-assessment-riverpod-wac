enum AppEnvironment { DEV, STAGING, PROD }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.DEV;

  static void initialize(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;

  static String get envName => _environment._envName;

  static String get connectionString => _environment._connectionString;

  static AppEnvironment get environment => _environment;

  static bool get isProduction => _environment == AppEnvironment.PROD;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.DEV: 'Flutter Assessment Wac Dev',
    AppEnvironment.STAGING: 'Flutter Assessment Wac Staging',
    AppEnvironment.PROD: 'Flutter Assessment Wac',
  };

  static const _connectionStrings = {
    AppEnvironment.DEV: 'https://run.mocky.io/v3',
    AppEnvironment.STAGING: 'https://run.mocky.io/v3',
    AppEnvironment.PROD: 'https://run.mocky.io/v3',
  };

  static const _envs = {
    AppEnvironment.DEV: 'dev',
    AppEnvironment.STAGING: 'staging',
    AppEnvironment.PROD: 'prod',
  };

  String get _appTitle => _appTitles[this]!;

  String get _envName => _envs[this]!;

  String get _connectionString => _connectionStrings[this]!;
}
