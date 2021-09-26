import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/views/home/index.dart';
import 'package:flutter_goodhouse_app/views/image_picker/index.dart';
import 'package:flutter_goodhouse_app/views/login/index.dart';
import 'package:flutter_goodhouse_app/views/not_found/index.dart';
import 'package:flutter_goodhouse_app/views/register/index.dart';
import 'package:flutter_goodhouse_app/views/room_add/index.dart';
import 'package:flutter_goodhouse_app/views/room_detail/index.dart';
import 'package:flutter_goodhouse_app/views/room_manage/index.dart';
import 'package:flutter_goodhouse_app/views/setting/index.dart';

class Routes {
  // 定义路由名称
  // static Map<String, P>
  static String home = '/';
  static String login = '/login';
  static String register = '/register';
  static String roomDetail = '/roomDetail/:roomId';
  static String setting = '/setting';
  static String roomManage = '/roomManage';
  static String roomAdd = '/roomAdd';

  static String imagePicker = '/imagePicker';
// 定义路由处理函数
// 首页
  static Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return HomePage();
  });
// 登录页
  static Handler _loginHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return LoginPage();
  });
  // 登录页
  static Handler _registerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return RegisterPage();
  });
// 房屋详情页
  static Handler _roomDetailHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return RoomDetailPage(
      roomId: params['roomId']![0],
    );
  });
// 设置页
  static Handler _settingHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return SettingPage();
  });
// 房屋管理
  static Handler _roomManagePageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return RoomManagePage();
  });
  // 发布房源
  static Handler _roomAddPageHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return RoomAddPage();
  });

  // 图片处理demo
  static Handler _imagePickerHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return ImagePickerPage();
  });

// 错误页
  static Handler _notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return NotFoundPage();
  });

  // 编写路函数  关联路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(setting, handler: _settingHandler);
    router.define(roomManage, handler: _roomManagePageHandler);
    router.define(roomAdd, handler: _roomAddPageHandler);

    router.define(imagePicker, handler: _imagePickerHandler);
    router.notFoundHandler = _notFoundHandler;
  }
}
