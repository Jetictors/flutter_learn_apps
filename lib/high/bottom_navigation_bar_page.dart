import 'dart:developer';

import 'package:flutter/material.dart';

///
/// Desc           :  flutter 底部导航栏组件（BottomNavigationBar）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class BottomNavigationBarPage extends StatefulWidget{

  BottomNavigationBarPage({Key key, this.title}) : super(key : key);

  final String title;

  _BottomBarPageState createState() => _BottomBarPageState();

}

class _BottomBarPageState extends State<BottomNavigationBarPage>{

  final _titleStyle = TextStyle(color: Colors.red);
  var _firstSelectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed:_onAdd
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue[100],
          shape: CircularNotchedRectangle(),
          child: Row(
            // 均分底部导航栏横向空间
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Builder(builder: (context){
                return IconButton(
                  icon: Icon(Icons.home, color: Colors.red),
                  onPressed: null,
                );
              }),
              SizedBox(),
              Builder(builder: (context){
                return IconButton(
                  icon: Icon(Icons.home, color: Colors.red),
                  onPressed: null,
                );
              }),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _firstBottom(),
            ],
          ),
        )
    );
  }

  Widget _firstBottom(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("1、普通的底部导航栏", style: _titleStyle),
        BottomNavigationBar(
          backgroundColor: Colors.blue[100],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text("首页"),
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.red),
            ),
            BottomNavigationBarItem(
              title: Text("其他"),
              icon: Icon(Icons.devices_other, color: Colors.grey),
              activeIcon: Icon(Icons.devices_other, color: Colors.red),
            ),
            BottomNavigationBarItem(
              title: Text("我的"),
              icon: Icon(Icons.face, color: Colors.grey),
              activeIcon: Icon(Icons.face, color: Colors.red),
            )
          ],
          currentIndex: _firstSelectIndex,
          unselectedItemColor: Colors.green,
          selectedItemColor: Colors.red,
          onTap: _firstOnTap,
        ),
        Divider()
      ],
    );
  }

  void _firstOnTap(int index){
    setState(() {
      _firstSelectIndex = index;
      log("切换到了${index + 1}个按钮");
    });
  }

  void _onAdd(){
    log("floatingActionButton被点击了");
  }

}