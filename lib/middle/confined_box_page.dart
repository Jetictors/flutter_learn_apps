import 'package:flutter/material.dart';

///
/// Desc           :  flutter 受限制的容器（ConstrainedBox、SizedBox...等）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class ConfinedBoxPage extends StatelessWidget{

  final String title;

  ConfinedBoxPage({Key key, this.title}) : super(key : key);

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