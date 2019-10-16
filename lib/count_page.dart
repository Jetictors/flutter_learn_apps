
import 'package:flutter/material.dart';

class CountPage extends StatefulWidget{

  CountPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CountPageState createState() => _CountPageState();

}

class _CountPageState extends State<CountPage>{

  int _count = 0;

  void _add(){
    setState(() {
      _count++;
    });
  }

  void _sub(){
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                '$_count',
                style: new TextStyle(color: Colors.red, fontSize: 50.0)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton.icon(
                  icon: Icon(Icons.add, color: Colors.red),
                  onPressed: _add,
                  label: Text("Add", style: TextStyle(color: Colors.red)),
                ),
                OutlineButton.icon(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: _sub,
                  label: Text("Sub", style: TextStyle(color: Colors.red)),
                )
              ],
            )
          ],
        ),
        ),
    );
  }

}
