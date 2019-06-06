import 'package:flutter/material.dart';

import 'src/app/app.dart';

void main() {
  new App(environment: 'local', baseUri: 'api.themoviedb.org').run(runApp);
}
