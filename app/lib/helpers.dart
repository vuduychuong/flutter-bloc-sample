import 'package:flutter/material.dart';

import 'src/app/app.dart';

// Navigate
void navigate(BuildContext context, String routePath,
    {Map<String, dynamic> params}) {
  App.router.navigateTo(context, routePath);
}

// Redirect
void redirect(BuildContext context, String routePath) {
  Navigator.pushReplacementNamed(context, routePath);
}
