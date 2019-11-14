import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Desc           :  flutter 变换（Transform）学习
/// Author         :  Jetictors
/// Time           :  2019/11/14 15:47
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1import
///
class TransformPage extends StatelessWidget{

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);
  TransformPage({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Text(title, style: _titleStyle),
        )
    );
  }

}