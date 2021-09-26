import 'package:flutter/material.dart';

var textStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loginType = true;
    return loginType ? _loginBuilder(context) : _notLoginBuilder(context);
  }

  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      padding: EdgeInsets.all(16),
      height: 95.0,
      child: Row(
        children: [
          Container(
              width: 65.0,
              height: 65.0,
              margin: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg'),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('login');
                    },
                    child: Text('登录', style: textStyle),
                  ),
                  Text(' / ', style: textStyle),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('register');
                    },
                    child: Text('注册', style: textStyle),
                  ),
                ],
              ),
              Text(
                '登录后可以体验更多',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _loginBuilder(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      padding: EdgeInsets.all(16),
      height: 95.0,
      child: Row(
        children: [
          Container(
              width: 65.0,
              height: 65.0,
              margin: EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg'),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('用户名', style: textStyle),
              Text(
                '登录后可以体验更多',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
