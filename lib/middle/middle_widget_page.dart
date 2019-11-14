import 'package:flutter/material.dart';
import 'package:flutter_learn_app/middle/align_page.dart';
import 'package:flutter_learn_app/middle/confined_box_page.dart';
import 'package:flutter_learn_app/middle/container_page.dart';
import 'package:flutter_learn_app/middle/decorated_box_page.dart';
import 'package:flutter_learn_app/middle/flex_page.dart';
import 'package:flutter_learn_app/middle/flow_page.dart';
import 'package:flutter_learn_app/middle/linear/linear_page.dart';
import 'package:flutter_learn_app/middle/padding_page.dart';
import 'package:flutter_learn_app/middle/stack_page.dart';
import 'package:flutter_learn_app/middle/transform_page.dart';
import 'package:flutter_learn_app/util/utils.dart';

///
/// Desc           :  中级组件页
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:39
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class MiddleWidgetPage extends StatelessWidget{

  MiddleWidgetPage({Key key, this.title}) : super(key : key);

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

    final _tabName = <String>["线性布局（Row和Column）", "弹性布局（Flex）", "流式布局（Wrap、Flow）",
      "层叠布局（Stack、Positioned）", "对齐与相对定位（Align）", "填充（Padding）", "容器（Container）",
      "装饰容器（DecoratedBox）", "尺寸限制类容器", "变换（Transform）"];

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
      case 0 : { CommonUtil.launcher(context, LinearPage(title: name,)); } break;
      case 1 : { CommonUtil.launcher(context, FlexPage(title: name)); } break;
      case 2 : { CommonUtil.launcher(context, FlowPage(title: name)); } break;
      case 3 : { CommonUtil.launcher(context, StackPage(title: name)); } break;
      case 4 : { CommonUtil.launcher(context, AlignPage(title: name)); } break;
      case 5 : { CommonUtil.launcher(context, PaddingPage(title: name)); } break;
      case 6 : { CommonUtil.launcher(context, ContainerPage(title: name)); } break;
      case 7 : { CommonUtil.launcher(context, DecoratedBoxPage(title: name)); } break;
      case 8 : { CommonUtil.launcher(context, ConfinedBoxPage(title: name)); } break;
      case 9 : { CommonUtil.launcher(context, TransformPage(title: name)); } break;
      default: { print("error pos !"); } break;
    }
  }

}