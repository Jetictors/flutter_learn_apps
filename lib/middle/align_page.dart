import 'package:flutter/material.dart';

///
/// Desc           :  flutter 对齐与相对定位（Align）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class AlignPage extends StatelessWidget{

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  AlignPage({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _first(),
            _second(),
            _third(),
            _fourth(),
            _five(),
            _six()
          ],
        ),
      )
    );
  }

  Widget _first(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("1、Align实例： 使用Alignment", style: _titleStyle),
        Container(
          width: 48,
          height: 48,
          color: Colors.green[200],
          child: Align(
            alignment: Alignment.bottomRight,
            child: FlutterLogo(colors: Colors.red, size: 24)
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _second(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("2、Align实例： widthFactor、heightFactor属性", style: _titleStyle),
        Container(
          color: Colors.green[200],
          child: Align(
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment.centerLeft,
            child: FlutterLogo(colors: Colors.red, size: 24)
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _third(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("3、Align实例： 使用Alignment的构造函数设置偏移", style: _titleStyle),
        Container(
          color: Colors.green[200],
          child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment(2,0),
              child: FlutterLogo(colors: Colors.red, size: 24)
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _fourth(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("4、Align实例： 使用FractionalOffset", style: _titleStyle),
        Container(
          color: Colors.green[200],
          child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: FractionalOffset.centerRight,
              child: FlutterLogo(colors: Colors.red, size: 24)
          ),
        ),
        Divider()
      ],
    );
  }

  Widget _five(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("5、Align实例： 使用FractionalOffset构造函数设置偏移", style: _titleStyle),
        Container(
          color: Colors.green[200],
          child: Align(
              widthFactor: 2,
              heightFactor: 2,
              alignment: FractionalOffset(2, 0),
              child: FlutterLogo(colors: Colors.red, size: 24)
          ),
        ),
        Divider()
      ],
    );
  }

  Widget  _six(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("6、Center实例： Center继承自Align", style: _titleStyle),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.green[200]),
          child: Center(
            child: Text("Center实例1", style: _titleStyle)
          ),
        ),
        Divider(),
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.green[200]),
          child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("Center实例2", style: _titleStyle)
          ),
        ),
        Divider()
      ],
    );
  }

}