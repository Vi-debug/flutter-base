class HiveConstants {

  HiveConstants._();

  static AppData appData = const AppData();
  static AppConfig config = const AppConfig();

  static final initBox = [appData.appDataBox,config.configBox];

}

class AppData {

  const AppData();


  String get appDataBox => "appDataBox";
  String get userProfile => "userProfile";

}

class AppConfig {

  const AppConfig();

  String get configBox => "configBox";
  String get language => "configLanguage";
  String get mode => "configMode";
}
