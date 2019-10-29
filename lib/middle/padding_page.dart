import 'package:flutter/material.dart';

///
/// Desc           :  flutter 填充（Padding）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class PaddingPage extends StatelessWidget{

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  PaddingPage({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _first(),
          Divider(),

          _second(),
          Divider(),

          _third(),
          Divider(),

          _fourth()
        ],
      ),
    );
  }

  /*
    使用EdgeInsets.all(double left)
    所有方向均使用相同数值的填充
   */
  Widget _first(){
    return ListTile(
      title: Text("1、使用EdgeInsets.all()函数", style: _titleStyle),
      subtitle: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            color: Colors.yellow,
            child: Text("First"),
          ),
        ),
      ),
    );
  }

  /*
    使用EdgeInsets.fromLTRB(double left, double top, double right, double bottom)
    分别指定四个方向的填充
   */
  Widget _second(){
    return ListTile(
      title: Text("2、使用EdgeInsets.fromLTRB()函数", style: _titleStyle),
      subtitle: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.fromLTRB(3, 6, 9, 12),
          child: Container(
            color: Colors.yellow,
            child: Text("Second"),
          ),
        ),
      ),
    );
  }

  /*
    使用EdgeInsets.only({left, top, right ,bottom })
    可以设置具体某个方向的填充(可以同时指定多个方向)。
   */
  Widget _third(){
    return ListTile(
      title: Text("3、使用EdgeInsets.only()函数", style: _titleStyle),
      subtitle: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.only(
                left: 4,
                bottom: 8,
                right: 12),
          child: Container(
            color: Colors.yellow,
            child: Text("Third"),
          ),
        ),
      ),
    );
  }

  /*
     使用EdgeInsets.symmetric({vertical, horizontal})
     用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right
   */
  Widget _fourth(){
    return ListTile(
      title: Text("4、使用EdgeInsets.symmetric()函数", style: _titleStyle),
      subtitle: Container(
        color: Colors.green,
        child: Padding(
          padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8),
          child: Container(
            color: Colors.yellow,
            child: Text("Fourth"),
          ),
        ),
      ),
    );
  }

}