import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/routes/index.dart';

class PageContent extends StatelessWidget {
  const PageContent({Key? key, this.name}) : super(key: key);

  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("当前页面：$name"),
      ),
      body: ListView(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.home);
            },
            child: Text(Routes.home),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.login);
            },
            child: Text(Routes.login),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/aaaaa');
            },
            child: Text('不存在的页面'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, 'room/2222');
            },
            child: Text(Routes.roomDetail),
          ),
        ],
      ),
    );
  }
}
