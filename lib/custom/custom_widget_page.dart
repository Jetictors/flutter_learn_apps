import 'package:flutter/material.dart';
import 'package:flutter_learn_app/other/file_page.dart';
import 'package:flutter_learn_app/other/http_page.dart';
import 'package:flutter_learn_app/other/json_page.dart';
import 'package:flutter_learn_app/other/locale_page.dart';
import 'package:flutter_learn_app/util/utils.dart';

///
/// Desc           :  自定义组件页
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:39
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class CustomWidgetPage extends StatelessWidget{

  CustomWidgetPage({Key key, this.title}) : super(key : key);

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

    final _tabName = <String>["Json解析", "网络请求（Http）", "文件操作（File）",
      "国际化（多语言适配）"];

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
    switch(pos){
      case 0 : { CommonUtil.launcher(context, JsonPage(title: name,)); } break;
      case 1 : { CommonUtil.launcher(context, HttpPage(title: name)); } break;
      case 2 : { CommonUtil.launcher(context, FilePage(title: name)); } break;
      case 3 : { CommonUtil.launcher(context, LocalePage(title: name)); } break;
      default: { print("error pos !"); } break;
    }
  }

}