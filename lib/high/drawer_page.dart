import 'dart:developer';

import 'package:flutter/material.dart';

///
/// Desc           :  flutter 侧边栏组件（Drawer）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class DrawerPage extends StatelessWidget{

  DrawerPage({Key key, this.title}) : super(key : key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(title),
          leading: Builder(builder: (context){
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white, size: 24),
              onPressed: (){
                // 打开侧边栏
                Scaffold.of(context).openDrawer();
                },
            );
          }),
        ),
        drawer: Drawer(
          child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Container(
                padding: EdgeInsets.only(top: 44),
                color: Colors.blue[200],
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Column(
                    children: <Widget>[
                      Image.asset("imgs/ic_header_4.png", width: 72),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text("Flutter", style: TextStyle(color: Colors.red, fontSize: 18))
                      ),
                      Text("我喜欢Flutter, 和我一起学习吧", textScaleFactor: 0.8),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 36, left: 12, right: 12),
                          child: ListView(
                            children: <Widget>[
                              ListTile(
                                title: Text("首页"),
                                leading: Icon(Icons.home, color: Colors.red),
                                onTap: (){ log("go home page"); },
                              ),
                              Divider(),
                              ListTile(
                                title: Text("设置"),
                                leading: Icon(Icons.settings, color: Colors.red),
                                onTap: (){ log("go Setting page"); },
                              ),
                              Divider(),
                              ListTile(
                                title: Text("关于我们"),
                                leading: Icon(Icons.image, color: Colors.red),
                                onTap: (){ log("go About page"); },
                              ),
                              Divider(),
                              ListTile(
                                title: Text("意见反馈"),
                                leading: Icon(Icons.feedback, color: Colors.red),
                                onTap: (){ log("go Feedback page"); },
                              ),
                              Divider()
                            ],
                          )
                        )
                      ),
                    ],
                  ),
                )
              )
          )
        ),
        body: Center(
          child: Text(title),
        )
    );
  }

}