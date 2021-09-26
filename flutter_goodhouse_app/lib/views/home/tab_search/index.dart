import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/room_list_item_widget.dart';
import 'package:flutter_goodhouse_app/components/search_bar/index.dart';
import 'package:flutter_goodhouse_app/views/home/tab_search/data_list.dart';
import 'package:flutter_goodhouse_app/views/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:flutter_goodhouse_app/views/home/tab_search/filter_bar/index.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
        actions: [Container()],
        elevation: 0,
        title: SearchBar(
          onSearch: () {
            Navigator.of(context).pushNamed('search');
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 41.0,
            child: FilterBar(
              onChange: (data) {},
            ),
          ),
          Expanded(
            child: ListView(
              children: dataList.map((e) => RoomListItemWidget(e)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
