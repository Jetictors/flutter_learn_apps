import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_app/high/page_view/banner_page.dart';
import 'package:flutter_learn_app/high/page_view/pageview_and_bottom.dart';
import 'package:flutter_learn_app/high/page_view/pageview_and_tabbar.dart';
import 'package:flutter_learn_app/high/page_view/splash_page_view.dart';
import 'package:flutter_learn_app/util/utils.dart';

///
/// Desc           :  flutter 滑动组件（PageView）学习, 类似Android中得ViewPager
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class PageViewPage extends StatelessWidget{

  PageViewPage({Key key, this.title}) : super(key : key);

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);
  final _tabName = <String>["PageView组件学习","用PageView实现Banner",
    "开源库[flutter-swpier]实现的banner", "PageView + TabBar联动",
    "PageView + BottomNavigationBar联动", "PageView实现引导页"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: ListView.builder(
          itemCount: _tabName.length,
          itemBuilder: (context, index){
            return  Column(
              children: <Widget>[
                ListTile(
                  title: Text(_tabName[index], style: _titleStyle),
                  trailing: Icon(Icons.arrow_right,color: Colors.red),
                  onTap: (){ _jump(index, context); },
                ),
                Divider(),
              ],
            );
          },
        )
    );
  }

  void _jump(int index, BuildContext context){
    switch(index){
      case 0: CommonUtil.launcher(context, BannerPage(title: _tabName[index],)); break;
      case 1: CommonUtil.launcher(context, BannerPage(title: _tabName[index])); break;
      case 2: CommonUtil.launcher(context, BannerPage(title: _tabName[index])); break;
      case 3: CommonUtil.launcher(context, TabBarAndPageView(title: _tabName[index])); break;
      case 4: CommonUtil.launcher(context, BottomBarAndPageView(title: _tabName[index])); break;
      case 5: CommonUtil.launcher(context, SplashPage(title: _tabName[index])); break;
      default:
        log("error positon!");
        break;
    }
  }

}