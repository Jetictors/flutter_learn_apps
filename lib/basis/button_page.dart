import 'dart:developer';

import 'package:flutter/material.dart';

///
/// Desc           :  flutter 按钮组件(Button)学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:24
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class ButtonPage extends StatelessWidget{

  ButtonPage({Key key, this.title}) : super(key : key);

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: <Widget>[
          _firstBtn(),
          _secondBtn(),
          _thirdBtn(),
          _fourthBtn(),
          _fiveBtn(),
          _sixBtn(),
          _sevenBtn(),
          _eightBtn(),
          _nineBtn()
        ],
      ),
    );
  }

  /*
    RaisedButton
   */
  Widget _firstBtn(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("1、RaisedButton", style: _titleStyle),
          subtitle: RaisedButton(
              child: Text("RaisedButton"),
              onPressed: (){ _toast("RaisedButton"); }
          )
        ),
        Divider()
      ],
    );
  }

  /*
    FlatButton
   */
  Widget _secondBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("2、FlatButton", style: _titleStyle),
            subtitle: FlatButton(
                child: Text("FlatButton"),
                onPressed: (){ _toast("FlatButton"); }
            )
        ),
        Divider()
      ],
    );
  }

  /*
    OutlineButton
   */
  Widget _thirdBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("3、OutlineButton", style: _titleStyle),
            subtitle: OutlineButton(
                child: Text("OutlineButton"),
                onPressed: (){ _toast("OutlineButton"); }
            )
        ),
        Divider()
      ],
    );
  }

  /*
    IconButton
   */
  Widget _fourthBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("4、IconButton", style: _titleStyle),
            subtitle: IconButton(
                icon: Icon(Icons.print),
                onPressed: (){ _toast("IconButton"); }
            )
        ),
        Divider()
      ],
    );
  }

  /*
    BackButton
    从源码中得知其是对IconButton的封装
    作用是：点击时关闭当前页
   */
  Widget _fiveBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("5、BackButton, 返回按钮， 点击时关闭当前页", style: _titleStyle),
            subtitle: BackButton(color: Colors.red)
        ),
        Divider()
      ],
    );
  }

  /*
    CloseButton
    从源码中得知其是对IconButton的封装
    作用是：点击时关闭当前页
   */
  Widget _sixBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("6、CloseButton, 关闭按钮， 点击时关闭当前页", style: _titleStyle),
            subtitle: CloseButton()
        ),
        Divider()
      ],
    );
  }

  /*
    FloatingActionButton
   */
  Widget _sevenBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("7、FloatingActionButton", style: _titleStyle),
            subtitle: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.blue,
              onPressed: (){ _toast("FloatingActionButton"); },
              foregroundColor: Colors.white,
            )
        ),
        Divider()
      ],
    );
  }

  /*
    RaisedButton、FlatButton、OutlineButton按钮的另一种实现，添加图标文字按钮
   */
  Widget _eightBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("8、带图标的文字按钮", style: _titleStyle),
            subtitle: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton.icon(
                    onPressed: (){ _toast("RaisedButton.icon()"); },
                    icon: Icon(Icons.add),
                    label: Text("Add")
                ),
                FlatButton.icon(
                    onPressed: (){ _toast("FlatButton.icon()"); },
                    icon: Icon(Icons.add),
                    label: Text("Add")
                ),
                OutlineButton.icon(
                    onPressed: (){ _toast("OutlineButton.icon()"); },
                    icon: Icon(Icons.add),
                    label: Text("Add")
                )
              ],
            )
        ),
        Divider()
      ],
    );
  }

  /*
    自定义btn
   */
  Widget _nineBtn(){
    return Column(
      children: <Widget>[
        ListTile(
            title: Text("9、自定义Button", style: _titleStyle),
            subtitle: FlatButton(
              child: Text("自定义Button"),
              onPressed: (){ _toast("自定义Button"); },
              textColor: Colors.red,
              color: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            )
        ),
        Divider()
      ],
    );
  }

  void _toast(String str){
    log("$str is onPress");
  }

}