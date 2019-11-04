import 'package:flutter/material.dart';

///
/// Desc           :   flutter 流式布局（Wrap、Flow）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class FlowPage extends StatelessWidget{

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  FlowPage({Key key, this.title}) : super(key : key);

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
          _firstRow(),
          Divider(),

          _chip(),
          Divider(),

          _wrapTest(),
          Divider(),

          _testFlow()
        ],
      )
    );
  }

  /*
    当使用Row超出边界时， 会抛出溢出错误
   */
  Widget _firstRow(){

    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1、当使用Row超出边界时， 会抛出溢出错误", style: _titleStyle),
          Row(
            children: <Widget>[
              Text("haha " * 30)
            ],
          ),
        ],
      ),
    );
  }

  /*
    介绍chip组件
   */
  Widget _chip(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、使用Chip组件", style: _titleStyle),
          Chip(
            avatar: Icon(Icons.face),
            label: Text("First Chip"),
            backgroundColor: Colors.red,
          ),
          Chip(
              avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('F')),
              label: Text("Flutter", style: _titleStyle)
          )
        ],
      ),
    );
  }

  /*
    使用Wrap实现流式布局，并规避掉边界溢出错误
   */
  Widget _wrapTest(){

    final _iconName = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];

    final _chipName = <String>["Label A", "Label B", "Label C", "Label D",
      "Label E", "Label F", "Label G"];

    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3、使用Wrap实现流式布局，并规避掉边界溢出错误", style: _titleStyle),
          Wrap(
            spacing: 12,     // 主轴间距
            runSpacing: 12, // 纵轴间距
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text(_iconName[0])),
                  label: Text(_chipName[0], style: _titleStyle)
              ),
              Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text(_iconName[1])),
                  label: Text(_chipName[1], style: _titleStyle)
              ),
              Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text(_iconName[2])),
                  label: Text(_chipName[2], style: _titleStyle)
              ),
              Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text(_iconName[3])),
                  label: Text(_chipName[3], style: _titleStyle)
              ),
              Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text(_iconName[4])),
                  label: Text(_chipName[4], style: _titleStyle)
              ),
              Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text(_iconName[5])),
                  label: Text(_chipName[5], style: _titleStyle)
              ),
              Chip(
                  avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text(_iconName[6])),
                  label: Text(_chipName[6], style: _titleStyle)
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _testFlow(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("4、使用Flow自定义", style: _titleStyle),
        Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            new Container(width: 80.0, height:80.0, color: Colors.red),
            new Container(width: 80.0, height:80.0, color: Colors.green),
            new Container(width: 80.0, height:80.0, color: Colors.blue),
            new Container(width: 80.0, height:80.0, color: Colors.yellow),
            new Container(width: 80.0, height:80.0, color: Colors.brown),
            new Container(width: 80.0, height:80.0, color: Colors.purple),
          ],
        ),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate{

  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity, 200);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

}