import 'package:bloc_pattern/src/data/source/remote/service/base_request.dart';

class MovieListRequest extends BaseRequest {
  @override
  String method() {
    return "GET";
  }

  @override
  String path() {
    return "/3/movie/popular";
  }
}
