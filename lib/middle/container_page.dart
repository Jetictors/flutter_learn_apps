import 'package:flutter/material.dart';

///
/// Desc           :  flutter 容器（Container）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class ContainerPage extends StatelessWidget{

  final String title;

  final _titleStyle = new TextStyle(color: Colors.red);

  ContainerPage({Key key, this.title}) : super(key : key);

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
          _second(),
          _third(),
          _fourth()
        ],
      )
    );
  }

  Widget _first(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1、实现一个宽度为100、高度为60的蓝色卡片", style: _titleStyle),
          Container(
            width: 100,
            height: 60,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("卡片1"),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _second(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、使用其提供的margin和padding属性", style: _titleStyle),
          Container(
            width: 100,
            height: 60,
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.symmetric(horizontal: 36),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("卡片1"),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _third(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3、添加装饰，使用其decoration属性", style: _titleStyle),
          Container(
            width: 100,
            height: 60,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5,5)
                )
              ]
            ),
            alignment: Alignment.center,
            child: Text("卡片1"),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _fourth(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("4、添加限制，使用constraints属性", style: _titleStyle),
          Container(
            // expand(),传入宽度和高度参数，默认为最大
            constraints: BoxConstraints.expand(height: 50),
            margin: EdgeInsets.all(12),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text("卡片1"),
          ),
          Divider()
        ],
      ),
    );
  }

}