import 'package:flutter/material.dart';

///
/// Desc           :  flutter 弹性布局（Flex）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class FlexPage extends StatelessWidget{

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  FlexPage({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _first(),
            _second(),
            _third()
          ],
        ),
      )
    );
  }

  /*
    水平 + 垂直的flex, 可以看出替换了Column， 其实Column和Row是继承至Flex的
   */
  Widget _first(){
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("1、用Flex + Expanded实现等比水平布局", style: _titleStyle),
        Flex(
          direction: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(width : 0, height : 24, color: Colors.red),
            ),
            Expanded(
              flex: 2,
              child: Container(width : 0, height: 24, color: Colors.green),
            )
          ],
        ),
        Divider()
      ],
    );
  }

  Widget _second(){
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("2、用Flex + Expanded实现等比垂直布局", style: _titleStyle),
        SizedBox(
          height: 100,
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(height : 0, color: Colors.red),
              ),
              Expanded(
                flex: 1,
                child: Container(height: 0, color: Colors.green),
              ),
              Expanded(
                flex: 2,
                child: Container(height: 0, color: Colors.yellow),
              ),
            ],
          ),
        ),
        Divider()
      ],
    );
  }

  /*
    使用Spacer， 它是Expanded的一个包装类
    例 ：实现一个3等份的水平布局，但是只有两边才有组件， 类似与安卓中的左右button
   */
  Widget _third(){
    return Flex(
      direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("3、使用Spacer", style: _titleStyle),
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child:  OutlineButton(
                child: Text("按钮1"),
                color: Colors.yellow,
                textColor: Colors.pink,
                onPressed: null,
              ),
            ),
            Spacer(flex: 1),
            Expanded(
              flex: 1,
              child: OutlineButton(
                child: Text("按钮2"),
                color: Colors.yellow,
                textColor: Colors.pink,
                onPressed: null,
              ),
            )
          ],
        ),
        Divider()
      ],
    );
  }

}