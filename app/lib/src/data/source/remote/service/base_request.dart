abstract class BaseRequest {
  String method();

  String path();

  Map<String, dynamic> queryParameters() {
    return {};
  }

  String body() {}

  List<int> bodyBytes() {}

  Map<String, String> bodyFields() {}

  Map<String, String> headers() {}
}
