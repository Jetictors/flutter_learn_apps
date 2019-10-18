import 'package:flutter/material.dart';

///
/// Desc           :  flutter hello world
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:24
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class HelloWorldWidget extends StatelessWidget{

  HelloWorldWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new Text(title + ' !', style: TextStyle(color: Colors.red)),
      ),
    );
  }

}