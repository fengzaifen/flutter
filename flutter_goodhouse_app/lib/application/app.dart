import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/routes/index.dart';
import 'package:flutter_goodhouse_app/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';
// import 'package:flutter_goodhouse_app/views/home/index.dart';
// import 'package:flutter_goodhouse_app/views/login/index.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // fluro 引入 创建 FluroRouter
    final router = FluroRouter();
    Routes.configureRoutes(router);
    return ScopedModel<FilterBarModel>(
        model: FilterBarModel(),
        child: MaterialApp(
          // home: LoginPage(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: router.generator, //
        ));
  }
}
