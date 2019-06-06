import 'package:bloc_pattern/src/app/app_widget.dart';
import 'package:bloc_pattern/src/ui/home/movie_detail.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes(Router router) {
    router.define('home', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return AppWidget();
    }));

    router.define('movie/detail/:id', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return MovieDetail(int.tryParse(params['id'][0]) ?? 0);
    }));
  }
}
