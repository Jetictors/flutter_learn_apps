import 'package:flutter/material.dart';

///
/// Desc           :  flutter 装饰容器（DecoratedBox）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class DecoratedBoxPage extends StatelessWidget{

  final String title;

  DecoratedBoxPage({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }

}