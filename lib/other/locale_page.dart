import 'package:flutter/material.dart';

///
/// Desc           :  国际化（多语言适配）
/// Author         :  Jetictors
/// Time           :  2019/11/19 14:59
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class LocalePage extends StatefulWidget{

  final String title;

  LocalePage({Key key, this.title}) : super(key : key);

  _LocalePageState createState() => _LocalePageState();

}

class _LocalePageState extends State<LocalePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }

}