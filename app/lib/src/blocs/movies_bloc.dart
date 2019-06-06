import 'package:bloc_pattern/src/data/model/item_model.dart';
import 'package:bloc_pattern/src/data/source/remote/response/movie_list_response.dart';
import 'package:bloc_pattern/src/data/source/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = MovieRepository.instance;
  final _moviesFetcher = PublishSubject<MovieListResponse>();
  final _movieDetail = PublishSubject<ItemModel>();

  static MoviesBloc _singleton;

  static MoviesBloc get instance {
    if (_singleton == null) {
      _singleton = MoviesBloc._internal();
    }
    return _singleton;
  }

  factory MoviesBloc() {
    return _singleton;
  }

  MoviesBloc._internal();

  Observable<MovieListResponse> get allMovies => _moviesFetcher.stream;

  Observable<ItemModel> get movieDetail => _movieDetail.stream;

  fetchAllMovies() async {
    MovieListResponse itemModel = await _repository.fetchAllMovies();
//    var strItemModel =
//        (await SharedPreferencesHelper.instance).get("movielist");
//    print('movielist: ${strItemModel}');
    _moviesFetcher.sink.add(itemModel);
  }

  fetchMovieDetail(int id) async {
    ItemModel item = await _repository.fetchMovie(id);
    _movieDetail.sink.add(item);
  }

  dispose() {
    _moviesFetcher.close();
    _movieDetail.close();
  }
}
