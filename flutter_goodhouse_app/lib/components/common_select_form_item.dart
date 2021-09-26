import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/utils/common_picker/index.dart';

import 'common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String? label;
  final int value;
  final List<String>? options;
  final Function(int)? onChange;
  final double? height;

  const CommonSelectFormItem(
      {Key? key,
      this.label,
      this.value = 0,
      this.options,
      this.onChange,
      this.height = 44.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
        label: label,
        height: height,
        contentBuilder: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent, // 点击空白会没有效果
            onTap: () {
              var result = CommonPicker.showPicker(
                  context: context, options: options!, value: value);
              result.then((selectdValue) => {
                    if (value != selectdValue &&
                        selectdValue != null &&
                        onChange != null)
                      {onChange!(selectdValue)}
                  });
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    options![value],
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          );
        });
  }
}
