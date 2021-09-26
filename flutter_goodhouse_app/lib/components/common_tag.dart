import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? backgroundColor;

  const CommonTag.origin(
      {Key? key,
      this.title,
      this.color = Colors.black,
      this.backgroundColor = Colors.grey})
      : super(key: key);

  factory CommonTag(String title) {
    switch (title) {
      case '近地铁':
        return CommonTag.origin(
          title: title,
          color: Colors.red,
          backgroundColor: Colors.red.shade100,
        );
      case '随时看房':
        return CommonTag.origin(
          title: title,
          color: Colors.green,
          backgroundColor: Colors.green.shade100,
        );
      case '集中供暖':
        return CommonTag.origin(
          title: title,
          color: Colors.teal,
          backgroundColor: Colors.teal.shade100,
        );
      case '新上':
        return CommonTag.origin(
          title: title,
          color: Colors.pink,
          backgroundColor: Colors.pink.shade100,
        );
      default:
        return CommonTag.origin(title: title);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      padding: EdgeInsets.only(left: 4.0,right: 4.0,top: 1.0, bottom: 2.0),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        title!,
        style: TextStyle(color: color, fontSize: 10.0),
      ),
    );
  }
}
