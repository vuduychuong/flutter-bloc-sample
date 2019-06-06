import 'package:bloc_pattern/src/data/source/remote/service/base_request.dart';

class MovieDetailRequest extends BaseRequest {
  int id;

  MovieDetailRequest(this.id);

  @override
  String method() {
    return "GET";
  }

  @override
  String path() {
    return "/3/movie/$id";
  }
}
