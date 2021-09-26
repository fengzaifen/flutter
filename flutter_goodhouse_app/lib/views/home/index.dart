import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/page_content.dart';
import 'package:flutter_goodhouse_app/views/home/tab_index/index.dart';
import 'package:flutter_goodhouse_app/views/home/tab_info/index.dart';
import 'package:flutter_goodhouse_app/views/home/tab_profile/index.dart';
import 'package:flutter_goodhouse_app/views/home/tab_search/index.dart';

List<Widget> tabViewList = [
  TabIndex(),
  TabSearch(),
  TabInfo(),
  TabProfile()
];

List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home)),
  BottomNavigationBarItem(label: '搜索', icon: Icon(Icons.search)),
  BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.info)),
  BottomNavigationBarItem(label: '我的', icon: Icon(Icons.account_circle))
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 当前 选中页 索引
  int _currentIndex = 0;

  void _onTapClick(index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: tabViewList[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: tabViewList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _currentIndex,
        onTap: _onTapClick,
      ),
    );
  }
}
