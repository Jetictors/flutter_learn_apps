import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_app/anim/anim_widget_page.dart';
import 'package:flutter_learn_app/apps/app_page.dart';
import 'package:flutter_learn_app/basis/basis_widget_page.dart';
import 'package:flutter_learn_app/apps/hello_world_page.dart';
import 'package:flutter_learn_app/high/high_widget_page.dart';
import 'package:flutter_learn_app/middle/middle_widget_page.dart';
import 'package:flutter_learn_app/other/other_widget_page.dart';
import 'package:flutter_learn_app/util/utils.dart';

///
/// Desc           :  首页
/// Author         :  Jetictors
/// Time           :  2019/10/23 12:07
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class HomePage extends StatelessWidget {

  final _icons = <IconData>[Icons.home, Icons.print, Icons.copyright,
    Icons.high_quality, Icons.motorcycle, Icons.devices_other, Icons.map];

  final _titles = <String>["Hello World启程", "基础组件学习", "中级组件学习",
    "高级组件学习", "动画和Motin", "其他", "Apps"];

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
  Widget _homeContent() {
    return new ListView.builder(
      itemCount: _titles.length,
      padding: EdgeInsets.all(12),
      itemBuilder: (context, i) {
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
  Widget _rowCount(context, icon, title, i) {
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
      onTap: () {
        _tap(context, title, i);
      },
    );
  }

  /*
     item单击事件
   */
  void _tap(context, title, pos) {
    switch (pos) {
      case 0: { CommonUtil.launcher(context, HelloWorldWidget(title: title)); } break;
      case 1: { CommonUtil.launcher(context, BasisWidgetPage(title: title)); } break;
      case 2: { CommonUtil.launcher(context, MiddleWidgetPage(title: title)); } break;
      case 3: { CommonUtil.launcher(context, HighWidgetPage(title: title)); } break;
      case 4: { CommonUtil.launcher(context, AnimWidgetPage(title: title)); } break;
      case 5: { CommonUtil.launcher(context, OtherWidgetPage(title: title)); } break;
      case 6: { CommonUtil.launcher(context, AppPage(title: title)); } break;
      default: { log("error pos !"); }break;
    }
  }

}