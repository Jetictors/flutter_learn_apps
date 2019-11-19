import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

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
    return OKToast(
      position: ToastPosition.bottom,
      textAlign: TextAlign.center,
      backgroundColor: Colors.black54,
      textStyle: TextStyle(color: Colors.white, fontSize: 16),
      radius: 12,
      textPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      dismissOtherOnShow: true,
      child: MaterialApp(
        title: "Flutter Learn App",
        home: HomePage(),
      ),
    );
  }
}

/*
  程序入口
 */
main() => runApp(MyApp());

