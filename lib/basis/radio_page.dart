import 'package:flutter/material.dart';

///
/// Desc           :  flutter 单选框组件（Radio）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 15:08
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class RadioPage extends StatefulWidget{

  RadioPage({Key key, this.title}) : super(key : key);

  final String title;

  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage>{

  String _groupValue = "man";
  String _result = "男";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("请选择性别：", style: TextStyle(color: Colors.red)),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.red,
                          value: "man",
                          groupValue: _groupValue,
                          onChanged: (value){
                            _change(value);
                          },
                        ),
                        Text("男")
                      ],
                    )
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.red,
                          value: "women",
                          groupValue: _groupValue,
                          onChanged: (value){
                            _change(value);
                          },
                        ),
                        Text("女")
                      ],
                    )
                  )
                ],
              ),
            ),
            Text("我选择的是：$_result")
          ],
        ),
      )
    );
  }

  void _change(String value){
    setState(() {
      _groupValue = value;

      if(value == "man"){
        _result = "男";
      }else{
        _result = "女";
      }
    });
  }

}