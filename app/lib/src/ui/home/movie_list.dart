import 'package:bloc_pattern/src/blocs/movies_bloc.dart';
import 'package:bloc_pattern/src/data/source/remote/response/movie_list_response.dart';
import 'package:flutter/material.dart';

import '../../../helpers.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MoviesBloc bloc = MoviesBloc.instance;

  @override
  void initState() {
    super.initState();
    print('fetch movie list');
    bloc.fetchAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context, AsyncSnapshot<MovieListResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MovieListResponse> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _onTapDetail(context, snapshot.data.results[index].id),
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].posterPath}',
              fit: BoxFit.cover,
            ),
          );
        });
  }
}

_onTapDetail(BuildContext context, int id) {
  navigate(context, 'movie/detail/$id');
}
