import 'package:flutter/material.dart';

///
/// Desc           :  flutter 装饰容器（DecoratedBox）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class DecoratedBoxPage extends StatelessWidget{

  final String title;

  final _titleStyle = new TextStyle(color: Colors.red);

  DecoratedBoxPage({Key key, this.title}) : super(key : key);

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
          _fourth(),
        ],
      ),
    );
  }

  /*
     设置形状与背景
   */
  Widget _first(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1、设置形状与背景", style: _titleStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("按钮1")
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(Icons.add, color: Colors.white,)
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  /*
    设置圆角与边框
   */
  Widget _second(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、设置圆角与边框, 注意：两个属性不能同时设置", style: _titleStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("按钮2")
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border(
                      top: BorderSide(color: Colors.red, width: 5),
                      right: BorderSide(color: Colors.blue, width: 5)
                  )
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("按钮3")
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  /*
    设置阴影和渐变
   */
  Widget _third(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3、设置阴影和渐变", style: _titleStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      color: Colors.grey,
                    )
                  ]
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("按钮4")
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    gradient: LinearGradient(colors: [Colors.blue, Colors.redAccent])
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text("按钮5")
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  /*
    添加背景图
   */
  Widget _fourth(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("4、添加背景图", style: _titleStyle),
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("imgs/ic_header_1.png"))
            ),
            child: Padding(
                padding: EdgeInsets.all(24),
                child: Text("按钮5")
            ),
          ),
          Divider()
        ],
      ),
    );
  }

}