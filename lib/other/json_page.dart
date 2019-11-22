import 'package:flutter/material.dart';

///
/// Desc           :  json解析
/// Author         :  Jetictors
/// Time           :  2019/11/19 14:59
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class JsonPage extends StatefulWidget{

  final String title;

  JsonPage({Key key, this.title}) : super(key : key);

  _JsonPageState createState() => _JsonPageState();

}

class _JsonPageState extends State<JsonPage>{

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