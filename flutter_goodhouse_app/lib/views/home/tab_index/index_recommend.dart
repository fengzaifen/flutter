import 'package:flutter/material.dart';

import 'index_recommend_data.dart';
import 'index_recommend_item_widget.dart';

class IndexRecommend extends StatelessWidget {
  final List<IndexRecommendItem>? dataList;
  const IndexRecommend({Key? key, this.dataList = indexRecommendData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(0x08000000)
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('房屋推荐', style: TextStyle(fontWeight: FontWeight.w600)),
            Text('更多', style: TextStyle(fontWeight: FontWeight.w300))
          ],
        ),
        SizedBox(height: 10.0,),
        Wrap(
          spacing: 10.0,  // 左右边距
          runSpacing: 10.0,// 上下边距
          children: dataList!.map((e) => IndexRecommendItemWidget(e)).toList(),
        )
      ],),
    );
  }
}