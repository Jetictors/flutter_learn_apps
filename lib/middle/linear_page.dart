import 'package:flutter/material.dart';

///
/// Desc           :  flutter 线性布局（Row、Column）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class LinearPage extends StatelessWidget{

  final String title;

  LinearPage({Key key, this.title}) : super(key : key);

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