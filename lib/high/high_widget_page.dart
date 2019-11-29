import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_app/high/app_bar_page.dart';
import 'package:flutter_learn_app/high/bottom_navigation_bar_page.dart';
import 'package:flutter_learn_app/high/custom_scroll_view_page.dart';
import 'package:flutter_learn_app/high/dialog_page.dart';
import 'package:flutter_learn_app/high/drawer_page.dart';
import 'package:flutter_learn_app/high/grid/grid_view_page.dart';
import 'package:flutter_learn_app/high/list/list_view_page.dart';
import 'package:flutter_learn_app/high/nested_scroll_view_page.dart';
import 'package:flutter_learn_app/high/page_view/page_view_page.dart';
import 'package:flutter_learn_app/high/single_child_scroll_view_page.dart';
import 'package:flutter_learn_app/high/tab_bar_page.dart';
import 'package:flutter_learn_app/util/utils.dart';


///
/// Desc           :  中级组件页
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:39
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class HighWidgetPage extends StatelessWidget{

  HighWidgetPage({Key key, this.title}) : super(key : key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(title),
      ),
      body: _listView()
    );
  }

  Widget _listView(){

    final _tabName = <String>["ListView", "GridView", "SingleChildScrollView",
      "NestedScrollView", "CustomScrollView", "PageView", "顶部导航栏（AppBar）",
      "侧边栏（Drawer）", "底部导航栏（BottomNavigationBar）", "顶部导航标签（TabBar）",
      "对话框（Dialog）"];

    return new ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: _tabName.length,
      itemBuilder: (context,i){
        return Container(
          child: Column(
            children: <Widget>[
              _item(context, _tabName[i], i),
              Divider()
            ],
          ),
        );
      },
    );
  }

  Widget _item(context, name, pos){
    return new ListTile(
      trailing: Icon(Icons.arrow_right, color: Colors.red),
      title: Text(name, style: TextStyle(color: Colors.red)),
      onTap: (){
        _tap(context, name, pos);
      },
    );
  }

  void _tap(context, name, pos){
    switch(pos){
      case 0 : { CommonUtil.launcher(context, ListViewPage(title: name,)); } break;
      case 1 : { CommonUtil.launcher(context, GridViewPage(title: name)); } break;
      case 2 : { CommonUtil.launcher(context, SingleChildScrollViewPage(title: name)); } break;
      case 3 : { CommonUtil.launcher(context, NestedScrollViewPage(title: name)); } break;
      case 4 : { CommonUtil.launcher(context, CustomScrollViewPage(title: name)); } break;
      case 5 : { CommonUtil.launcher(context, PageViewPage(title: name)); } break;
      case 6 : { CommonUtil.launcher(context, AppBarPage(title: name)); } break;
      case 7 : { CommonUtil.launcher(context, DrawerPage(title: name)); } break;
      case 8 : { CommonUtil.launcher(context, BottomNavigationBarPage(title: name)); } break;
      case 9 : { CommonUtil.launcher(context, TabBarPage(title: name)); } break;
      case 10 : { CommonUtil.launcher(context, DialogPage(title: name)); } break;
      default: { log("error pos !"); } break;
    }
  }

}