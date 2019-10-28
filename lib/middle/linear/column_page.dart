import 'package:flutter/material.dart';

///
/// Desc           :  flutter 线性布局之垂直方向（Column）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class ColumnPage extends StatelessWidget{

  final String title;

  ColumnPage({Key key, this.title}) : super(key : key);

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

          _fourth(),
          Divider(),

          _five(),
          Divider(),

          _six()
        ],
      ),
    );
  }

  Widget _first(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1、测试从轴的对齐方式 crossAxisAlignment"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("组件1" * 3),
              Text("组件2")
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、测试从轴的对齐方式 crossAxisAlignment"),
          Column(
            children: <Widget>[
              Text("组件1" * 3),
              Text("组件2")
            ],
          ),
        ],
      ),
    );
  }

  Widget _third(){
    return  Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3、测试从轴的对齐方式 crossAxisAlignment"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("组件1" * 3),
              Text("组件2")
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("4、测试textDirection"),
          Column(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("组件1" * 3),
              Text("组件2")
            ],
          ),
        ],
      ),
    );
  }

  Widget _five(){
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("5、测试textDirection"),
          Column(
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

  /*
    垂直布局时使纵轴占满全屏
    可以使用ConstrainedBox 或者 SizeBox
   */
  Widget _six(){
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("6、使纵轴占满全屏"),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text("组件1" * 3),
                  Text("组件2")
                ],
              ),
            )
          ],
        ),
      );
  }

}