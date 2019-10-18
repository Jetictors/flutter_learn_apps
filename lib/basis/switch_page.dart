import 'package:flutter/material.dart';

///
/// Desc           :  flutter 单选开关组件（Switch）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 15:08
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class SwitchPage extends StatefulWidget{

  SwitchPage({Key key, this.title}) : super(key : key);

  final String title;

  _SwitchPagePageState createState() => _SwitchPagePageState();
}

class _SwitchPagePageState extends State<SwitchPage>{

  // switch选中状态， 默认关闭
  bool _isSelect = false;

  // 提示文本
  String hint = "false";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: _firstSwitch()
    );
  }

  Widget _firstSwitch(){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Switch(value: _isSelect,
          onChanged: (bool){ _onChange(bool); },
          activeColor: Colors.red,
          activeTrackColor: Colors.green,
          inactiveThumbColor: Colors.blue,
          inactiveTrackColor: Colors.yellow,
        ),
        Divider(),
        Text("switch isSelect = $hint")
      ],
    );
  }

  void _onChange(bool){
    setState(() {
      _isSelect = bool;
      if(bool){
        hint = "true";
      }else{
        hint = "false";
      }
    });
  }

}