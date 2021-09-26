import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/views/home/info/index.dart';

import 'advertisement.dart';
import 'function_button.dart';
import 'header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.of(context).pushNamed('setting');
          }, icon: Icon(Icons.settings))
        ],
        elevation: 0, // 阴影
      ),
      body: ListView(children: [
        Header(),
        FunctionButton(),
        Advertisement(),
        Info(
            showTitle: true,
          )
      ],),
    );
  }
}