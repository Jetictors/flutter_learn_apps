import 'package:flutter/material.dart';

///
/// Desc           :  网络请求
/// Author         :  Jetictors
/// Time           :  2019/11/19 14:59
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class HttpPage extends StatefulWidget{

  final String title;

  HttpPage({Key key, this.title}) : super(key : key);

  _HttpPageState createState() => _HttpPageState();

}

class _HttpPageState extends State<HttpPage>{

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