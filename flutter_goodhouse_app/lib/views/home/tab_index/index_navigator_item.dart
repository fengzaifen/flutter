import 'package:flutter/material.dart';

//准备数据:title,image
class IndexNavigatorItem {
  final String title;
  final String imageUri;
  final Function(BuildContext contenxt)? onTap;
  IndexNavigatorItem(this.title, this.imageUri, this.onTap);
}

List<IndexNavigatorItem> indexNavigatorItemList = [
  IndexNavigatorItem('整租', 'assets/images/home_index_navigator_total.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('合租', 'assets/images/home_index_navigator_share.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('地图找房', 'assets/images/home_index_navigator_map.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
  IndexNavigatorItem('去出租', 'assets/images/home_index_navigator_rent.png',
      (BuildContext context) {
    Navigator.of(context).pushNamed('login');
  }),
];

// const List<String> navigatorImgList = [
//   'assets/images/home_index_navigator_total.png',
//   'static/images/home_index_navigator_share.png',
//   'static/images/home_index_navigator_map.png',
//   'static/images/home_index_navigator_rent.png'
// ];
// const Map<String, >
// class IndexNavigatorItem extends StatefulWidget {
//   const IndexNavigatorItem({ Key? key }) : super(key: key);

//   @override
//   _IndexNavigatorItemState createState() => _IndexNavigatorItemState();
// }

// class _IndexNavigatorItemState extends State<IndexNavigatorItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(children: [
//           Image.asset('assets/images/home_index_navigator_total.png')
//         ],)
//       ],
//     );
//   }
// }