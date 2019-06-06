import 'package:bloc_pattern/src/ui/home/movie_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState(MovieList());
  }
}

class _HomePageState extends State<HomePage> {
  MovieList _movieList;

  _HomePageState(this._movieList);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: _movieList,
      ),
    );
  }
}
