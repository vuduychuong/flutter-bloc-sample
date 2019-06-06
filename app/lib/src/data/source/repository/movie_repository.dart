import 'dart:async';

import 'package:bloc_pattern/src/data/model/item_model.dart';
import 'package:bloc_pattern/src/data/source/remote/datasource/movie_api_remote_data_source.dart';
import 'package:bloc_pattern/src/data/source/remote/response/movie_list_response.dart';

class MovieRepository {
  final _remoteSource = MovieRemoteDataSource();

  static MovieRepository _singleton;

  static MovieRepository get instance {
    if (_singleton == null) {
      _singleton = MovieRepository._internal();
    }
    return _singleton;
  }

  factory MovieRepository() {
    return _singleton;
  }

  MovieRepository._internal();

  Future<MovieListResponse> fetchAllMovies() => _remoteSource.fetchMovieList();

  Future<ItemModel> fetchMovie(int id) => _remoteSource.fetchMovie(id);
}
