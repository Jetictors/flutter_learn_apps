import 'package:flutter/material.dart';

///
/// Desc           :  flutter 线性布局之水平方向（Row）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class RowPage extends StatelessWidget{

  final String title;

  final _titleStyle = TextStyle(color: Colors.red);

  RowPage({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
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

  Widget _first(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        // 测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1、测试主轴的对齐方式 mainAxisAlignment", style: _titleStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_alarm), label: Text("组件1")),
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_time), label: Text("组件2")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _second(){
    return  Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        // 测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、测试主轴的宽度 mainAxisSize", style: _titleStyle),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(onPressed: null, icon: Icon(Icons.accessible), label: Text("组件1")),
              FlatButton.icon(onPressed: null, icon: Icon(Icons.accessible_forward), label: Text("组件2")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _third(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        // 测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3、测试textDirection", style: _titleStyle),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_alarm), label: Text("组件1")),
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_time), label: Text("组件2")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _fourth(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        // 测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("4、测试textDirection", style: _titleStyle),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_alarm), label: Text("组件1", textScaleFactor: 3)),
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_time), label: Text("组件2")),
            ],
          ),
        ],
      ),
    );
  }

}