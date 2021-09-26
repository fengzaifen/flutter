import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/views/home/tab_index/index_navigator_item.dart';

class IndexNavigator extends StatelessWidget {
  const IndexNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: indexNavigatorItemList
            .map((item) => InkWell(
                  child: Column(
                    children: [
                      Image.asset(
                        item.imageUri,
                        width: 47.5,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                      )
                    ],
                  ),
                  onTap: () {
                    item.onTap!(context);
                  },
                ))
            .toList(),
      ),
    );
  }
}
