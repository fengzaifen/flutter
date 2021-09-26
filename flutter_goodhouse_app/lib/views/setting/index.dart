import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/utils/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置'),),
      body: ListView(children: [
        ElevatedButton(onPressed: () {
          CommonToast.showToast('退出成功');
        }, child: Text('退出登录'))
      ],),
    );
  }
}