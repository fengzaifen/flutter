import 'package:flutter/material.dart';

import 'common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String? label;
  final List<String>? options;
  final int? value;
  final ValueChanged? onChange;
  final double? height;

  const CommonRadioFormItem(
      {Key? key,
      this.label,
      this.options,
      this.value,
      this.onChange,
      this.height=44.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
      label: label,
      height: height,
      contentBuilder: (context) {
        return Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  options!.length,
                  (index) => Row(
                        children: [
                          Radio(
                              value: index,
                              groupValue: value,
                              onChanged: onChange),
                          Text(options![index])
                        ],
                      ))),
        );
      },
    );
  }
}
