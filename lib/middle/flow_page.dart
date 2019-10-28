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



        ],
      )
    );
  }

  /*
    当使用Row超出边界时， 会抛出溢出错误
   */
  Widget _firstRow(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("1、当使用Row超出边界时， 会抛出溢出错误", style: _titleStyle),
        Row(
          children: <Widget>[
              Text("haha " * 30)
          ],
        ),
      ],
    );
  }

  /*
    介绍chip组件
   */
  Widget _chip(){
    return Column(
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
    );
  }

  /*
    使用Wrap实现流式布局，并规避掉边界溢出错误
   */
  Widget _wrapTest(){

    final _iconName = <String>['A', 'B', 'C', 'D', 'E', 'F'];

    final _chipName = <String>["Label A", "Label B", "Label C", "Label D",
      "Label E", "Label F"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("3、使用Wrap实现流式布局，并规避掉边界溢出错误", style: _titleStyle),
        Wrap(
          spacing: 5,     // 主轴间距
          runSpacing: 10, // 纵轴间距
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center,
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
          )
          ],
        )
      ],
    );

  }

}