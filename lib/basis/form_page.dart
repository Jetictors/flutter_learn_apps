import 'package:flutter/material.dart';

///
/// Desc           :  flutter 表单组件（Form）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 15:35
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class FormPage extends StatelessWidget{

  FormPage({Key key, this.title}) : super(key : key);

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
        child: Text(title),
      ),
    );
  }

}