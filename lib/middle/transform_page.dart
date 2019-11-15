import 'package:flutter/material.dart';
import 'dart:math' as math;

///
/// Desc           :  flutter 变换（Transform）学习
/// Author         :  Jetictors
/// Time           :  2019/11/14 15:47
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1import
///
class TransformPage extends StatelessWidget{

  final String title;

  final _titleStyle = TextStyle(color: Colors.red);

  TransformPage({Key key, this.title}) : super(key : key);

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
            _five(),
            _six(),
            _seven()
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
          Text("1、平移，Transform.translate", style: _titleStyle),
          Container(
            width: 120,
            height: 50,
            margin: EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: BoxDecoration(
               color: Colors.blue
            ),
            child: Transform.translate(
              offset: Offset(25, 0),
              child: Container(width: 20, height: 20, color: Colors.red)
            )
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
          Text("2、缩放，Transform.scale", style: _titleStyle),
          Container(
              width: 120,
              height: 50,
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Transform.scale(
                scale: 0.5,
                child: Container(width: 20, height: 20, color: Colors.red)
              )
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
          Text("3、旋转，Transform.rotate", style: _titleStyle),
          Container(
              width: 120,
              height: 50,
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Transform.rotate(
                angle: 45,
                child: Container(width: 20, height: 20, color: Colors.red)
              )
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
          Text("4、组合实现，先平移，再旋转", style: _titleStyle),
          Container(
              width: 120,
              height: 50,
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Transform.translate(
                offset: Offset(25, 0),
                child: Transform.rotate(
                  angle: 45,
                  child: Container(width: 20, height: 20, color: Colors.red)
                ),
              )
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _five(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("5、组合实现，先旋转，再平移", style: _titleStyle),
          Container(
              width: 120,
              height: 50,
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Transform.rotate(
                angle: 45,
                child: Transform.translate(
                    offset: Offset(25, 0),
                    child: Container(width: 20, height: 20, color: Colors.red)
                ),
              )
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _six(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("6、矩阵转换, 直接使用Transform", style: _titleStyle),
          Container(
              width: 120,
              height: 50,
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.blue
              ),
              child: Transform(
                transform: Matrix4.skewX(0.5),
                child: Container(width: 20, height: 20, color: Colors.red)
              )
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _seven(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("7、旋转，RotateBox 和 Transform.torate的区别", style: _titleStyle),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      child: Transform.rotate(
                          angle: math.pi / 2,
                          child: Text("torate")
                      ),
                    ),
                    Text("测试", style: _titleStyle)
                  ],
                )
              ),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                            color: Colors.blue
                        ),
                        child: RotatedBox(
                            quarterTurns: 1,
                            child: Text("RotatedBox")
                        ),
                      ),
                      Text("测试", style: _titleStyle)
                    ],
                  )
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }

}