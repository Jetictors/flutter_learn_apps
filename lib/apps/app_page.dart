import 'package:flutter/material.dart';
import 'package:flutter_learn_app/apps/calculator_page.dart';
import 'package:flutter_learn_app/apps/count_page.dart';
import 'package:flutter_learn_app/apps/first_app.dart';
import 'package:flutter_learn_app/util/utils.dart';

///
/// Desc           :  基础组件页
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:39
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class AppPage extends StatelessWidget{

  AppPage({Key key, this.title}) : super(key : key);

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

    final _icon = <IconData>[Icons.title, Icons.favorite_border, Icons.details];

    final _tabName = <String>["简易计数器", "第一个Flutter App", "简易计算器"];
    final _subTitle = <String>["对一个数字实现递增和递减",
      "官网中的实例，显示以及收藏单词",
      "一个计算器，实现加减乘除操作"];

    return new ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: _tabName.length,
      itemBuilder: (context,i){
        return Container(
          child: Column(
            children: <Widget>[
              _item(context, _tabName[i], _subTitle[i], _icon[i], i),
              Divider()
            ],
          ),
        );
      },
    );
  }

  Widget _item(context, title, subTitle, icon, pos){
    return new ListTile(
      trailing: Icon(Icons.arrow_right, color: Colors.red),
      title: Text(title, style: TextStyle(color: Colors.red)),
      subtitle: Text(subTitle, style: TextStyle(color: Colors.red)),
      leading: Icon(icon, color: Colors.red,),
      onTap: (){
        _tap(context, title, pos);
      },
    );
  }

  void _tap(context, name, pos){
    switch(pos){
      case 0 : { CommonUtil.launcher(context, CountPage(title: name,)); } break;
      case 1 : { CommonUtil.launcher(context, RandomWordPage(title: name)); } break;
      case 2 : { CommonUtil.launcher(context, CalculatorPage(title: name)); } break;
      default: { print("error pos !"); } break;
    }
  }

}