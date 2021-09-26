import 'package:flutter/material.dart';

import 'data.dart';

var textStyle = TextStyle(fontSize: 14, color: Colors.black54);

class ItemWidget extends StatelessWidget {
  final InfoItem data;
  const ItemWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.only(left: 8.0, bottom: 8.0,right: 8.0),
      child: Row(
        children: [
          Image.network(
            data.imageUrl,
            width: 120,
            height: 90,
            fit: BoxFit.cover,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style:
                    TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.source, style: textStyle),
                  Text(data.time, style: textStyle)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
