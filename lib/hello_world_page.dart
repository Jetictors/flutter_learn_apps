import 'package:flutter/material.dart';

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