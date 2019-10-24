import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(title),
        ),
        body: Center(
          child: Text(title),
        )
    );
  }

}