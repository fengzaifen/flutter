import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/search_bar/index.dart';
import 'package:flutter_goodhouse_app/views/home/info/index.dart';

class TabInfo extends StatefulWidget {
  const TabInfo({ Key? key }) : super(key: key);

  @override
  _TabInfoState createState() => _TabInfoState();
}

class _TabInfoState extends State<TabInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Padding(padding: EdgeInsets.only(top: 8.0)),
        Info()
      ],),
    );
  }
}