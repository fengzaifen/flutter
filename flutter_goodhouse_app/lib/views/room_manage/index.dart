import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/common_floating_button.dart';
import 'package:flutter_goodhouse_app/components/room_list_item_widget.dart';
// import 'package:flutter_goodhouse_app/widget/common_floating_button.dart';
import 'package:flutter_goodhouse_app/views/home/tab_search/data_list.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonFloatingActionButton(title: '发布房源',onTap: () {
          Navigator.of(context).pushNamed('roomAdd');
        }),
        appBar: AppBar(
          title: Text('房屋管理'),
          bottom: TabBar(
            // isScrollable: true,
            tabs: [
              Text('空置'),
              Text('已租'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
                  children: dataList
                      .map((item) => RoomListItemWidget(
                            item,
                          ))
                      .toList()),
              ListView(
                  children: dataList
                      .map((item) => RoomListItemWidget(
                            item,
                          ))
                      .toList()),
          ],
        ),
      ),
    );
  }
}
