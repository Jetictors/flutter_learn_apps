import 'package:flutter/material.dart';

///
/// Desc           :  flutter 线性布局嵌套使用（Row、Column嵌套）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class NestPage extends StatelessWidget{

  final String title;

  final _titleStyle = TextStyle(color: Colors.red);

  NestPage({Key key, this.title}) : super(key : key);

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
          Text("1、Row嵌套Row测试, 可以看出内部Row设置的属性无效", style: _titleStyle),
          Row(
            children: <Widget>[
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_alarm), label: Text("组件1")),
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_time), label: Text("组件2")),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("组件1"),
                  Text("组件2")
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _second(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        // 测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、解决Row嵌套Row方案，使用Expanded组件", style: _titleStyle),
          Row(
            children: <Widget>[
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_alarm), label: Text("组件1")),
              FlatButton.icon(onPressed: null, icon: Icon(Icons.access_time), label: Text("组件2")),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("组件1"),
                    Text("组件2")
                  ],
                )
              )
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3、Column嵌套Column测试, 以及用Expanded解决", style: _titleStyle),
          Row(
            children: <Widget>[
              Expanded(
                child: _columnFirst()
              ),
              Divider(),
              Expanded(
                  child: _columnSecond()
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _columnFirst(){
    return Container(
      color: Colors.blue,
      height: 300,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("外部Column"),
          Container(
            color: Colors.yellow,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("组件1"),
                Text("组件2")
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _columnSecond(){
    return Container(
      color: Colors.green,
      height: 300,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("外部Column"),
          Expanded(
           child: Container(
             color: Colors.yellow,
             child: Column(
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                 Text("组件1"),
                 Text("组件2")
               ],
             ),
           ),
          )
        ],
      ),
    );
  }

}