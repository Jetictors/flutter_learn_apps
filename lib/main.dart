import 'package:flutter/material.dart';
import 'package:flutter_learn_app/count_page.dart';
import 'package:flutter_learn_app/first_app.dart';
import 'package:flutter_learn_app/hello_world_page.dart';

/*
  程序入口
 */
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Flutter Learn App",
      home: new HomePage(),
    );
  }

}

/*
  首页
 */
class HomePage extends StatelessWidget{

  final _icons = <IconData>[Icons.home, Icons.title, Icons.map];
  final _titles = <String>["Hello World", "Count", "My First App"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: _homeContent()
    );
  }

  /*
    首页组件ListView
   */
  Widget _homeContent(){
    return new ListView.builder(
      itemCount: _titles.length,
      padding: EdgeInsets.all(12),
      itemBuilder: (context, i){
        return new Container(
          child: new Column(
            children: <Widget>[
              _rowCount(context, _icons[i], _titles[i], i),
              Divider()
            ],
          ),
        );
      },
    );
  }

  /*
    item布局组件
   */
  Widget _rowCount(context, icon, title, i){
    return new ListTile(
      leading: new Icon(icon, color: Colors.red),
      title: new Text(
        title,
        style: new TextStyle(
          color: Colors.red,
          fontSize: 16
        ),
      ),
      trailing: new Icon(Icons.arrow_right, color: Colors.red,),
      onTap: (){
        _tap(context, title, i);
      },
    );
  }

  /*
     item单击事件
   */
  void _tap(context, title, pos){
    switch(pos){
      case 0: { _jump(context, new HelloWorldWidget(title: title)); }
      break;

      case 1: { _jump(context, new CountPage(title: title)); }
      break;

      case 2: { _jump(context, new RandomWord(title: title)); }
      break;

      default: {}
      break;
    }
  }

  void _jump(context, cls){
    Navigator.of(context).push(
        new MaterialPageRoute(
            builder: (context){
              return cls;
            }
        )
    );
  }

}

