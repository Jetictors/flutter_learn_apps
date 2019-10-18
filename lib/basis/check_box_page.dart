import 'package:flutter/material.dart';

///
/// Desc           :  flutter 复选框组件（Checkbox）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 15:08
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class CheckBoxPage extends StatefulWidget{

  CheckBoxPage({Key key, this.title}) : super(key : key);

  final String title;

  _CheckBoxPageState createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage>{

  bool _firstIsSelect = false;
  String _firstHint = "false";

  bool _secondIsSelect = false;
  String _secondHint = "false";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          _firstCheckBox(),
          _secondCheckBox()
        ],
      )
    );
  }

  Widget _firstCheckBox(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          value: _firstIsSelect,
          onChanged: (bool){ _firstChange(bool); },
          activeColor: Colors.blue,
          checkColor: Colors.red,
        ),
        Text("checkbox isSelect = $_firstHint"),
        Divider()
      ],
    );
  }

  Widget _secondCheckBox(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          tristate: true,
          value: _secondIsSelect,
          onChanged: (bool){ _secondChange(bool); },
          activeColor: Colors.yellow,
          checkColor: Colors.green,
        ),
        Text("checkbox isSelect = $_secondHint"),
        Divider()
      ],
    );
  }

  void _firstChange(bool){
    setState(() {
      _firstIsSelect = bool;

      if(bool){
        _firstHint = "true";
      }else{
        _firstHint = "false";
      }
    });
  }

  void _secondChange(bool){
    setState(() {
      _secondIsSelect = bool;

      if(null == bool){
        _secondHint = "null";
        return;
      }

      if(bool){
        _secondHint = "true";
      }else{
        _secondHint = "false";
      }
    });
  }

}