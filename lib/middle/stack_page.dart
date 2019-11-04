import 'package:flutter/material.dart';

///
/// Desc           :  flutter 层叠布局（Stack、Positioned）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class StackPage extends StatelessWidget{

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  StackPage({Key key, this.title}) : super(key : key);

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

          _second()
        ],
      ),
    );
  }

  Widget _first(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 标题
          Text("1、层叠布局实例", style: _titleStyle),
          // 用Container组件确定高度
          Container(
            height: 150,
            // 用ConstrainedBox占满整个父组件
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              // 组件层叠布局
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  // 无定位时， 定位方式为父布局，即居中
                  Container(
                    child: Text("无定位组件", style: _titleStyle),
                    color: Colors.green,
                  ),
                  // 有定位时， 定位方式为父布局定位 + Positioned定位
                  Positioned(
                    // 定位为横向布局，故而垂直居中
                    left: 12,
                    child: Text("定位组件1")
                  ),
                  Positioned(
                    // 定位为纵向布局，故而水平居中
                    top: 12,
                    child:  Text("定位组件2")
                  )
                ],
              ),
            ),
          )
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
          // 标题
          Text("2、层叠布局中的fit属性实例", style: _titleStyle),
          // 用Container组件确定高度
          Container(
            height: 150,
            // 用ConstrainedBox占满整个父组件
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              // 组件层叠布局
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: <Widget>[
                  // 有定位时， 定位方式为父布局定位 + Positioned定位
                  Positioned(
                    // 定位为横向布局，故而垂直居中
                      left: 12,
                      child: Text("定位组件1")
                  ),
                  // 无定位时， 定位方式为父布局，即居中
                  Container(
                    child: Text("无定位组件", style: _titleStyle),
                    color: Colors.green,
                  ),
                  Positioned(
                    // 定位为纵向布局，故而水平居中
                      top: 12,
                      child:  Text("定位组件2")
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}