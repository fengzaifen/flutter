import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/common_check_button.dart';
import 'package:flutter_goodhouse_app/config/index.dart';
import 'package:flutter_goodhouse_app/views/home/tab_profile/function_button_data.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);

  // const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];

class RoomAppliance extends StatefulWidget {
  //组件参数
  final ValueChanged<List<RoomApplianceItem>>? onChange;
  RoomAppliance({Key? key, this.onChange}) : super(key: key);

  @override
  _RoomApplianceState createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 20.0,
        children: list
            .map((e) => GestureDetector(
                  onTap: () {
                    list = list
                        .map((innerItem) => innerItem == e
                            ? RoomApplianceItem(
                                e.title, e.iconPoint, !e.isChecked)
                            : innerItem)
                        .toList();
                    //  同时通知父级
                    if (null != widget.onChange) {
                      widget.onChange!(list);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      children: [
                        Icon(
                          // IconData(e.iconPoint, fontFamily: Config.CommonIcon),
                          Icons.ac_unit_outlined,
                          size: 40.0,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Text(e.title),
                        ),
                        CommonCheckButton(e.isChecked)
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class RoomApplianceList extends StatefulWidget {
  final List<String> list;

  const RoomApplianceList({Key? key, required this.list}) : super(key: key);

  @override
  _RoomApplianceListState createState() => _RoomApplianceListState();
}

class _RoomApplianceListState extends State<RoomApplianceList> {
  @override
  Widget build(BuildContext context) {
    var showList =
        _dataList.where((item) => widget.list.contains(item.title)).toList();
    if (showList.length == 0) {
      return Container(
        padding: EdgeInsets.only(left: 10),
        child: Text('暂无房源配置信息'),
      );
    }
    return Container(
      child: Container(
        child: Wrap(
            runSpacing: 30.0,
            children: showList
                .map((item) => Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: Column(children: <Widget>[
                        Icon(
                            //字体图标的使用
                            // IconData(item.iconPoint, fontFamily: Config.CommonIcon),
                            Icons.ac_unit_outlined,
                            size: 40.0),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(item.title),
                        ),
                        // CommonCheckButton(item.isChecked)
                      ]),
                    ))
                .toList()),
      ),
    );
  }
}
