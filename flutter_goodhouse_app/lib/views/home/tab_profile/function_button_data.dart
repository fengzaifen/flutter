

import 'package:flutter/material.dart';

class FunctionButtonItem {
  final String imageUrl;
  final String title;
  final Function? onTapHandle;
  FunctionButtonItem(this.imageUrl, this.title, this.onTapHandle);
}

final List<FunctionButtonItem> list = [
  FunctionButtonItem('assets/images/home_profile_record.png', "看房记录", (context) {}),
  FunctionButtonItem('assets/images/home_profile_order.png', '我的订单', null),
  FunctionButtonItem('assets/images/home_profile_favor.png', '我的收藏', null),
  FunctionButtonItem('assets/images/home_profile_id.png', '身份认证', null),
  FunctionButtonItem('assets/images/home_profile_message.png', '联系我们', null),
  FunctionButtonItem('assets/images/home_profile_contract.png', '电子合同', null),
  FunctionButtonItem('assets/images/home_profile_wallet.png', '钱包', (context) {
    Navigator.pushNamed(context, 'imagePicker');
    
  }),
  FunctionButtonItem('assets/images/home_profile_house.png', "房屋管理", (context) {
    bool isLogin = true; //假设先设置未登录
    if (isLogin) {
      Navigator.pushNamed(context, 'roomManage');
    }
  })
];
