import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/common_swiper.dart';
import 'package:flutter_goodhouse_app/components/search_bar/index.dart';
import 'package:flutter_goodhouse_app/views/home/info/index.dart';

import 'index_navigator.dart';
import 'index_recommend.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          shwoLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          CommonSwiper(),
          IndexNavigator(),
          IndexRecommend(),
          Info(
            showTitle: true,
          )
          // Text("data")
        ],
      ),
    );
  }
}
