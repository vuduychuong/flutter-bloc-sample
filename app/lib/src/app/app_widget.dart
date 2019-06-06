import 'package:bloc_pattern/src/app/app.dart';
import 'package:bloc_pattern/src/ui/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  _AppWidgetState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'App',
      home: HomePage(),
      onGenerateRoute: App.router.generator,
    );
  }
}
