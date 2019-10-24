import 'package:flutter/material.dart';

///
/// Desc           :  flutter 滑动组件（SingleChildScrollView）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class SingleChildScrollViewPage extends StatelessWidget{

  SingleChildScrollViewPage({Key key, this.title}) : super(key : key);

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