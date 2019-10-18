import 'package:flutter/material.dart';
import 'package:flutter_learn_app/anim/anim_widget_page.dart';
import 'package:flutter_learn_app/apps/app_page.dart';
import 'package:flutter_learn_app/basis/basis_widget_page.dart';
import 'package:flutter_learn_app/apps/count_page.dart';
import 'package:flutter_learn_app/apps/first_app.dart';
import 'package:flutter_learn_app/apps/hello_world_page.dart';
import 'package:flutter_learn_app/middle/middle_widget_page.dart';
import 'package:flutter_learn_app/other/other_widget_page.dart';

/*
  程序入口
 */
void main() => runApp(MyApp());

///
/// Desc           :  flutter Application
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:24
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Learn App",
      home: new HomePage(),
    );
  }

}

/*
  首页
 */
class HomePage extends StatelessWidget{

  final _icons = <IconData>[Icons.home, Icons.print, Icons.copyright,
    Icons.motorcycle, Icons.devices_other, Icons.map];

  final _titles = <String>["Hello World启程", "基础组件学习", "中级组件学习",
    "动画和Motin", "其他", "Apps"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: _homeContent()
    );
  }

  /*
    首页组件ListView
   */
  Widget _homeContent(){
    return new ListView.builder(
      itemCount: _titles.length,
      padding: EdgeInsets.all(12),
      itemBuilder: (context, i){
        return new Container(
          child: new Column(
            children: <Widget>[
              _rowCount(context, _icons[i], _titles[i], i),
              Divider()
            ],
          ),
        );
      },
    );
  }

  /*
    item布局组件
   */
  Widget _rowCount(context, icon, title, i){
    return new ListTile(
      leading: new Icon(icon, color: Colors.red),
      title: new Text(
        title,
        style: new TextStyle(
          color: Colors.red,
          fontSize: 16
        ),
      ),
      trailing: new Icon(Icons.arrow_right, color: Colors.red),
      onTap: (){
        _tap(context, title, i);
      },
    );
  }

  /*
     item单击事件
   */
  void _tap(context, title, pos){
    switch(pos){
      case 0: { _jump(context, HelloWorldWidget(title: title)); }break;

      case 1: { _jump(context, BasisWidgetPage(title: title)); }break;

      case 2: { _jump(context, MiddleWidgetPage(title: title)); }break;

      case 3: { _jump(context, AnimWidgetPage(title: title)); }break;

      case 4: { _jump(context, OtherWidgetPage(title: title)); }break;

      case 5: { _jump(context, AppPage(title: title)); }break;

      default: {}break;
    }
  }

  void _jump(context, cls){
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context){
              return cls;
            }
        )
    );
  }

}

