import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CommonPicker {
  static Future<int?> showPicker(
      {BuildContext? context,
      List<String>? options,
      int? value,
      double height = 300.0}) {
    return showCupertinoModalPopup<int>(
        context: context!,
        builder: (BuildContext context) {
          var buttonTextStyle =
              TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
          var controller = FixedExtentScrollController(initialItem: value!);
          return Container(
            color: Colors.grey,
            height: height,
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade200,
                  height: 40.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                             Navigator.of(context).pop();
                          },
                          child: Text(
                            '取消',
                            style: buttonTextStyle,
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(controller.selectedItem);
                          },
                          child: Text(
                            '确定',
                            style: buttonTextStyle,
                          ))
                    ],
                  ),
                ),
                // https://blog.csdn.net/weixin_39852620/article/details/103657126
                // itemExtent ：子项高度，选中位置的高度。
                // children: 子widget组。
                // onSelectedItemChanged: 滚动选择的回调，每次滚动，都会触发此回调，会将选中的子widget的position返回。
                // diameterRatio：直径比，double类型。
                // backgroundColor，背景颜色。
                // offAxisFraction，轴偏移，默认是0.0。控制选中的子widget的左右偏移
                // useMagnifier: 放大效果，默认false。
                // magnification： 放大倍数，需先开启放大效果，此参数才有作用。
                // scrollController：控制器
                // squeeze：压缩，这个控制的children之间的空隙，和diameterRatio的效果有相似之处。
                Expanded(
                    child: CupertinoPicker(
                      scrollController: controller,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  selectionOverlay: _selectionOverlayWidget(), // 中间选中样式
                  itemExtent: 32.0,
                  onSelectedItemChanged: (val) {
                    print(val);
                  },
                  children: options!.map((e) => Text(e)).toList(),
                ))
              ],
            ),
          );
        });
  }

  // 中间分割线
  static Widget _selectionOverlayWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 0, right: 0),
      child: Column(
        children: [
          Divider(
            height: 1,
            color: Colors.green.shade200,
          ),
          Expanded(child: Container()),
          Divider(
            height: 1,
            color: Colors.green.shade200,
          ),
        ],
      ),
    );
  }
}
