import 'package:flutter/material.dart';

///
/// Desc           :  文件操作
/// Author         :  Jetictors
/// Time           :  2019/11/19 14:59
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class FilePage extends StatefulWidget{

  final String title;

  FilePage({Key key, this.title}) : super(key : key);

  _FilePageState createState() => _FilePageState();

}

class _FilePageState extends State<FilePage>{

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