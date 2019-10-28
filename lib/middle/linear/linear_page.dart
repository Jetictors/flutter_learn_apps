import 'package:flutter/material.dart';
import 'package:flutter_learn_app/middle/linear/column_page.dart';
import 'package:flutter_learn_app/middle/linear/nest_page.dart';
import 'package:flutter_learn_app/middle/linear/row_page.dart';
import 'package:flutter_learn_app/util/utils.dart';

///
/// Desc           :  flutter 线性布局（Row、Column）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class LinearPage extends StatelessWidget{

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  LinearPage({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {

    final _tabName = <String>["水平方向（Row）","垂直方向（Column）", "Row和Column嵌套使用"];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(_tabName[0], style: _titleStyle),
            trailing: Icon(Icons.arrow_right,color: Colors.red),
            onTap: (){
              CommonUtil.launcher(context, RowPage(title: _tabName[0]));
            },
          ),
          Divider(),
          ListTile(
            title: Text(_tabName[1], style: _titleStyle),
            trailing: Icon(Icons.arrow_right,color: Colors.red),
            onTap: (){
              CommonUtil.launcher(context, ColumnPage(title: _tabName[1]));
            },
          ),
          Divider(),
          ListTile(
            title: Text(_tabName[2], style: _titleStyle),
            trailing: Icon(Icons.arrow_right,color: Colors.red),
            onTap: (){
              CommonUtil.launcher(context, NestPage(title: _tabName[2]));
            },
          ),
        ],
      )
    );
  }
}