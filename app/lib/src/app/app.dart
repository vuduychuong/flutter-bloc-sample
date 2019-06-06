import 'package:bloc_pattern/src/data/source/remote/service/RequestHelper.dart';
import 'package:bloc_pattern/src/routers/app_routes.dart';
import 'package:bloc_pattern/src/routers/auth_routes.dart';
import 'package:fluro/fluro.dart';

import 'app_widget.dart';

class App {
  // Application environment.
  static String environment;

  // Application router.
  static Router router;

  // Create app.
  App({String environment, String baseUri}) {
    App.environment = environment;

    RequestHelper.instance.setBaseUri(baseUri);

    // Create a router.
    final Router router = new Router();

    // Init and set app router.
    App.router = this.initializeRoutes(router);
  }

  // Let's init our routes.
  Router initializeRoutes(Router router) {
    new AppRoutes(router);
    new AuthRoutes(router);

    return router;
  }

  // App run.
  void run(runApp) {
    runApp(AppWidget());
  }
}
