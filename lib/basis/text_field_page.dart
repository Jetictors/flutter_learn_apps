import 'package:flutter/material.dart';

///
/// Desc           :  flutter 输入框组件（TextField）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 15:35
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class TextFieldPage extends StatelessWidget{

  TextFieldPage({Key key, this.title}) : super(key : key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
//        child: TextField(title),
      ),
    );
  }

}