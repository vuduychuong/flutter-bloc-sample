import 'package:bloc_pattern/src/blocs/movies_bloc.dart';
import 'package:bloc_pattern/src/data/model/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  final int id;

  MovieDetail(this.id);

  @override
  State<StatefulWidget> createState() {
    return _MovieDetailState(id);
  }
}

class _MovieDetailState extends State<MovieDetail> {
  MoviesBloc bloc = MoviesBloc.instance;
  int id;

  _MovieDetailState(this.id);

  @override
  void initState() {
    super.initState();
    bloc.fetchMovieDetail(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Detail'),
      ),
      body: StreamBuilder(
        stream: bloc.movieDetail,
        builder: (context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.hasData) {
            return Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data.posterPath}',
              fit: BoxFit.cover,
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
