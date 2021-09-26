import 'dart:ffi';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final bool? shwoLocation;
  final Function? goBackCallback;
  final String? inputValue;
  final String? defaultInputValue;
  final Function? onCancel;
  final bool? showMap;
  final Function()? onSearch;
  final ValueChanged<String>? onSearchSubmit;
  const SearchBar(
      {Key? key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWord = '';
  late TextEditingController _controller; // 
  FocusNode? _focus;  // 焦点
  _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          if (widget.shwoLocation != null)
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.room,
                      size: 16,
                      color: Colors.blue,
                    ),
                    Text(
                      '海南',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              ),
              onTap: () {},
            ),
          if (widget.goBackCallback != null)
            GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                )),
          Expanded(
              child: Container(
            height: 30.0,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(18.0)),
            // padding: EdgeInsets.only(left: 2.0),
            child: TextField(
              focusNode: _focus,
              onTap: () {
                if (widget.onSearchSubmit == null) {
                  _focus!.unfocus();
                }
                widget.onSearch!();
              },
              onSubmitted: widget.onSearchSubmit,
              controller: _controller,
              onChanged: (val) {
                setState(() {
                  _searchWord = val;
                });
              },
              textInputAction: TextInputAction.search,
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: -5.0),
                  hintText: '请输入搜索词',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.grey,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(minWidth: 32, minHeight: 32),
                  // icon: Padding(
                  //   padding: const EdgeInsets.only(left: 8.0),
                  //   child: Icon(
                  //     Icons.search,
                  //     size: 20.0,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _onClean();
                    },
                    child: Icon(
                      Icons.clear,
                      size: 20,
                      color: _searchWord == ''
                          ? Colors.grey.shade100
                          : Colors.grey,
                    ),
                  )),
            ),
          )),
          SizedBox(
            width: 4.0,
          ),
          if (widget.onCancel != null)
            GestureDetector(
              child: Text(
                '取消',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          if (widget.showMap != null)
            GestureDetector(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 4.0),
                    child:
                        Image.asset('assets/icons/widget_search_bar_map.png'),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
