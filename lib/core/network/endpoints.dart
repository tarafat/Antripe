//const String version = "";
const String version1 = "/api/v1";
const String version2 = "/api/v2";
//const String baseUrl = urlOne;

final class NetworkConstants {
  NetworkConstants._();
  static const kACCEPT = "Accept";
  static const kAPPKEY = "App-Key";
  static const kACCEPTLANGUAGE = "Accept-Language";
  static const kAPPKEYVALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const kACCEPTTYPE = "application/json";
  static const kAUTHORIZATION = "Authorization";
  static const kCONTENTTYPE = "content-Type";
  static const kAPIKEY = "x-api-key";
  static const kBASEURL = "https://api.antripe.com"; // Example base URL
}

final class Endpoints {
  Endpoints._();
  static String users({int page = 1, int perPage = 10}) => "/v1/contact/api.json";
  static String userDetails(int userId) => "/api/users/$userId";
}
