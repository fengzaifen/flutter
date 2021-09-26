import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/room_appliance.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_goodhouse_app/components/common_floating_button.dart';
import 'package:flutter_goodhouse_app/components/common_form_item.dart';
import 'package:flutter_goodhouse_app/components/common_image_picker.dart';
import 'package:flutter_goodhouse_app/components/common_radio_form_item.dart';
import 'package:flutter_goodhouse_app/components/common_select_form_item.dart';
import 'package:flutter_goodhouse_app/components/common_title.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({Key? key}) : super(key: key);

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int rentType = 0;
  int decorationType = 0;

  int roomType = 0;
  int floor = 0;
  int oriented = 0;

  var titleController = TextEditingController();
  var descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          CommonFloatingActionButton(title: '提交', onTap: () {}),
      appBar: AppBar(
        title: Text('发布房源'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return Container(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent, // 默认点击空白区域不生效
                  child: Container(
                    // height: 44.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '请选择小区',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed('search');
                  },
                ),
              );
            },
          ),
          CommonFormItem(
            label: '租金',
            hintText: '请输入租金',
            suffixText: '元/月',
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: '大小',
            hintText: '请输入房屋大小',
            suffixText: '平方米',
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
            label: '租赁方式',
            options: ['合租', '整租'],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index;
              });
            },
          ),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
            options: [
              '一室',
              '二室',
              '三室',
              '四室',
            ],
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
            options: [
              '高楼层',
              '中楼层',
              '低楼层·',
            ],
          ),
          CommonSelectFormItem(
            label: '朝向',
            value: oriented,
            onChange: (val) {
              setState(() {
                oriented = val;
              });
            },
            options: [
              '东',
              '南',
              '西',
              '北',
            ],
          ),
          CommonRadioFormItem(
            label: '装修',
            options: ['精装', '简装'],
            value: decorationType,
            onChange: (index) {
              setState(() {
                decorationType = index;
              });
            },
          ),
          CommonTitle('房源图像'),
          CommonImagePicker(
            onChange: (List<XFile> files) {},
          ),
          CommonTitle('房源标题'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: '请输入标题（例如整租，小区名 2 室 2000元）',
                border: InputBorder.none,
              ),
            ),
          ),
          CommonTitle('房源配置'),
          RoomAppliance(onChange: (data) {

          },),
          CommonTitle('房源描述'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: descController,
              maxLength: 10,
              decoration: InputDecoration(
                hintText: '请输入房屋描述信息',
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }
}
