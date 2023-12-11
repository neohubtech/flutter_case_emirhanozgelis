
final class ApiUrls {

  static ApiUrls shared = ApiUrls._();

  ApiUrls._();

  static const String _apiBaseUrl = "https://intertechtr.github.io/";

   String get interviewUrl => "${_apiBaseUrl}interview.json";

}
