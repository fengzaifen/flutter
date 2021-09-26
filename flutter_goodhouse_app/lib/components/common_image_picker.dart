import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defautImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; //宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<XFile>>? onChange;
  const CommonImagePicker({Key? key, this.onChange}) : super(key: key);

  @override
  _CommonImagePickerState createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<XFile> files = [];
  final ImagePicker _picker = ImagePicker();
  _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      // var image = await _picker.pickImage(source: ImageSource.gallery);
      if (null == pickedFile) return;
      setState(() {
        // files = files..add(pickedFile);
        files.add(pickedFile);
        print(files);
      });
      if (widget.onChange != null) {
        widget.onChange!(files);
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidgetHeightRatio;
    Widget addButton = GestureDetector(
      onTap: () {
        _pickImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey,
        child: Center(
          child: Text(
            '+',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
    Widget wrapper(XFile file) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Image.file(
            File(file.path),
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
          Positioned(
              right: -20.0,
              top: -20.0,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    // files = files..remove(file);
                    files.remove(file);
                    print(files);
                    if (widget.onChange != null) {
                      widget.onChange!(files);
                    }
                  });
                },
                icon: Icon(Icons.delete_forever),
                color: Colors.red,
              ))
        ],
      );
      // return Semantics(
      //   child: ListView.builder(
      //     key: UniqueKey(),
      //     itemBuilder: (context, index) {
      //       return Semantics(
      //         child: Image.file(File(files[index].path)),
      //       );
      //     },
      //     itemCount: files.length,
      //   ),
      // );

      // return Image.file(
      //   imageUri,
      //   height: height,
      //   width: width,
      //   fit: BoxFit.cover,
      // );
      // return Image.network(
      //   imageUri,
      //   width: width,
      //   height: height,
      //   fit: BoxFit.cover,
      // );
    }

    List<Widget> list = files.map((item) => wrapper(item)).toList()
      ..add(addButton);
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list,
      ),
    );
  }
}
