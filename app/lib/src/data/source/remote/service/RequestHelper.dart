import 'package:bloc_pattern/src/data/source/remote/service/base_request.dart';
import 'package:bloc_pattern/src/utils/constants.dart';
import 'package:http/http.dart'
    show Client, Request, Response;

class RequestHelper {
  static RequestHelper _singleton;
  static const String BASE_APP_SCHEME = "http";
  static const int BASE_APP_PORT = 80;
  String baseUrl = "api.themoviedb.org";
  Request requestBuilder;

  static RequestHelper get instance {
    if (_singleton == null) {
      _singleton = RequestHelper._internal();
    }
    return _singleton;
  }

  factory RequestHelper() {
    return _singleton;
  }

  RequestHelper._internal();

  Client get request {
    return Client();
  }

  Future<Response> call(BaseRequest request) async {
    Map<String, dynamic> query = request.queryParameters();
    query.addAll({'api_key': API_KEY});
    Request rq = Request(
        request.method(),
//        Uri.http(BASE_APP_HOST, request.path(), {'api_key': API_KEY})
        Uri(
            scheme: BASE_APP_SCHEME,
            host: baseUrl,
            port: BASE_APP_PORT,
            path: request.path(),
            queryParameters: query));
    if (request.body() != null) rq.body = request.body();
    if (request.bodyBytes() != null) rq.bodyBytes = request.bodyBytes();
    if (request.bodyFields() != null) rq.bodyFields = request.bodyFields();
    if (request.headers() != null) rq.headers.addAll(request.headers());
    rq.headers['authorization'] = "alkdfjaf-adsf-adsfkl-adf";
    print('http: ${request.method()} ${rq.url.toString()}');
    print('http: ${rq.headers}');
//    print(rq);
    return Response.fromStream(await rq.send());
  }

  void setBaseUri(String baseUri) {
    baseUrl = baseUri;
  }
}
