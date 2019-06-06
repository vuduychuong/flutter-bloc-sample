import 'dart:async';
import 'dart:convert';

import 'package:bloc_pattern/src/data/model/item_model.dart';
import 'package:bloc_pattern/src/data/source/remote/request/list_movie_request.dart';
import 'package:bloc_pattern/src/data/source/remote/request/movie_detail_request.dart';
import 'package:bloc_pattern/src/data/source/remote/response/movie_list_response.dart';
import 'package:bloc_pattern/src/data/source/remote/service/RequestHelper.dart';

class MovieRemoteDataSource {

  Future<MovieListResponse> fetchMovieList() async {
    var request = MovieListRequest();
    final response = await RequestHelper.instance.call(request);
//    final response = await RequestHelper.instance.request
//        .get("http://api.themoviedb.org/3/movie/popular?api_key=$API_KEY");
    print('response success');
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return MovieListResponse.fromJson(jsonDecode(response.body));
    } else {
      return null;
      //TODO: Show error
    }
  }

  Future<ItemModel> fetchMovie(int id) async {
    var request = MovieDetailRequest(id);
    final response = await RequestHelper.instance.call(request);
    print('response detail success: {$request.path}');
    print('response detail success');
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
      //TODO: Show error
    }
  }
}
