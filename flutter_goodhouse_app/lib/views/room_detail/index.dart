import 'package:flutter/material.dart';
import 'package:flutter_goodhouse_app/components/common_swiper.dart';
import 'package:flutter_goodhouse_app/components/common_tag.dart';
import 'package:flutter_goodhouse_app/components/common_title.dart';
import 'package:flutter_goodhouse_app/components/room_appliance.dart';
import 'package:flutter_goodhouse_app/views/home/info/index.dart';
import 'package:flutter_goodhouse_app/views/home/tab_search/data_list.dart';
import 'package:flutter_goodhouse_app/views/room_detail/data.dart';
import 'package:share/share.dart';

var bottomButtonTextStyle = TextStyle(fontSize: 20.0, color: Colors.white);

class RoomDetailPage extends StatefulWidget {
  const RoomDetailPage({Key? key, this.roomId}) : super(key: key);
  final String? roomId;

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  RoomDetailData? data;
  bool isLike = false;
  bool showAllText = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      data = defaultData;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (null == data) return Container();
    bool showTextTool = data!.subTitle!.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data!.title!),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share('https://baidu.com');
              }),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwiper(),
              CommonTitle(data!.title!),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data!.price.toString(),
                      style: TextStyle(fontSize: 20.0, color: Colors.pink),
                    ),
                    Text(
                      ' ???/???(????????????)',
                      style: TextStyle(fontSize: 14.0, color: Colors.pink),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Wrap(
                  spacing: 4.0,
                  children: data!.tags!.map((item) => CommonTag(item)).toList(),
                ),
              ),
              Divider(
                color: Colors.grey,
                indent: 10.0,
                endIndent: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    BaseInfoItem(content: '?????????${data!.size}?????????'),
                    BaseInfoItem(content: '?????????${data!.floor}'),
                    BaseInfoItem(content: '?????????${data!.roomType}'),
                    BaseInfoItem(content: '???????????????'),
                  ],
                ),
              ),
              CommonTitle('????????????'),
              RoomApplianceList(
                list: data!.applicances!,
              ),
              CommonTitle('????????????'),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data!.subTitle ?? '??????????????????',
                      maxLines: showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(showAllText ? '??????' : '??????'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                              )
                            : Container(),
                        Text('??????'),
                      ],
                    ),
                  ],
                ),
              ),
              CommonTitle('????????????'),
              Info(
                showTitle: false,
              ),
              Container(
                height: 100.0,
              )
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: 100.0,
            bottom: 0,
            child: Container(
              color: Colors.grey[200],
              padding: EdgeInsets.only(top: 10.0, left: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike;
                      });
                    },
                    child: Container(
                        height: 50.0,
                        width: 40.0,
                        margin: EdgeInsets.only(right: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(isLike ? Icons.star : Icons.star_border,
                                size: 24.0,
                                color: isLike ? Colors.green : Colors.black),
                            Text(isLike ? '?????????' : '??????',
                                style: TextStyle(fontSize: 12.0))
                          ],
                        )),
                  ),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50.0,
                            margin: EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Center(
                              child: Text('????????????', style: bottomButtonTextStyle),
                            ),
                          ))),
                  Expanded(
                      child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50.0,
                            margin: EdgeInsets.only(right: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Center(
                              child: Text('????????????', style: bottomButtonTextStyle),
                            ),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        content,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
    );
  }
}
