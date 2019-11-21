import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_route/pages/HomeAty.dart';
import './routers/router_handler.dart';
import './routers/application.dart';
import './routers/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeAty(),

    );
  }
}
