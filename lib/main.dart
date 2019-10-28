import 'package:flutter/material.dart';

import 'home_page.dart';

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
    return MaterialApp(
      title: "Flutter Learn App",
      home: HomePage(),
    );
  }

}

/*
  程序入口
 */
void main() => runApp(MyApp());

