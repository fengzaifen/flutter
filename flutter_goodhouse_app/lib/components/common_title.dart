import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  const CommonTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0),
      child: Text(title, style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600),),
    );
  }
}