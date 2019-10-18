import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_app/basis/button_page.dart';
import 'package:flutter_learn_app/basis/check_box_page.dart';
import 'package:flutter_learn_app/basis/form_page.dart';
import 'package:flutter_learn_app/basis/icon_page.dart';
import 'package:flutter_learn_app/basis/image_page.dart';
import 'package:flutter_learn_app/basis/switch_page.dart';
import 'package:flutter_learn_app/basis/text_field_page.dart';
import 'package:flutter_learn_app/basis/text_page.dart';

///
/// Desc           :  基础组件页
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:39
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class OtherWidgetPage extends StatelessWidget{

  OtherWidgetPage({Key key, this.title}) : super(key : key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(title),
      ),
      body: _listView()
    );
  }

  Widget _listView(){

    final _tabName = <String>["文本（Text）", "按钮（Button）", "图片（Image）",
      "图标（Icon）", "单选开关（Switch）", "复选框（CheckBox）", "输入框（TextField）",
      "表单（Form）"];

    return new ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: _tabName.length,
      itemBuilder: (context,i){
        return Container(
          child: Column(
            children: <Widget>[
              _item(context, _tabName[i], i),
              Divider()
            ],
          ),
        );
      },
    );
  }

  Widget _item(context, name, pos){
    return new ListTile(
      trailing: Icon(Icons.arrow_right, color: Colors.red),
      title: Text(name, style: TextStyle(color: Colors.red)),
      onTap: (){
        _tap(context, name, pos);
      },
    );
  }

  void _tap(context, name, pos){
    log(name);
    switch(pos){
      case 0 : { _jump(context, TextPage(title: name,)); } break;
      case 1 : { _jump(context, ButtonPage(title: name)); } break;
      case 2 : { _jump(context, ImagePage(title: name)); } break;
      case 3 : { _jump(context, IconPage(title: name)); } break;
      case 4 : { _jump(context, SwitchPage(title: name)); } break;
      case 5 : { _jump(context, CheckBoxPage(title: name)); } break;
      case 6 : { _jump(context, TextFieldPage(title: name)); } break;
      case 7 : { _jump(context, FormPage(title: name)); } break;
      default: { print("error pos !"); } break;
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