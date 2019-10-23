import 'package:flutter/material.dart';
import 'package:flutter_learn_app/util/my_icon_font.dart';

///
/// Desc           :  flutter 图表组件（Icon）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:35
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class IconPage extends StatelessWidget{

  IconPage({Key key, this.title}) : super(key : key);

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
          _firstIcon(),
          _secondIcon(),
          _thirdIcon()
        ],
      )
    );
  }

  Widget _firstIcon(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("1、使用Material提供的icon图标", style: _titleStyle),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.title,
                color: Colors.blue,
                size: 24,
                textDirection: TextDirection.rtl,
                semanticLabel: "material icon",
              ),
              Icon(
                Icons.print,
                color: Colors.blue,
                size: 36,
              ),
              Icon(
                Icons.favorite,
                color: Colors.blue,
                size: 48,
              ),
            ],
          )
        ),
        Divider()
      ],
    );
  }

  Widget _secondIcon(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("2、使用自定义的字体icon图标", style: _titleStyle),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                IconData(0xe8b3, fontFamily: "MyIconFonts"),
                color: Colors.green,
                size: 24,
                textDirection: TextDirection.rtl,
                semanticLabel: "material icon",
              ),
              Icon(
                IconData(0xe8b4, fontFamily: "MyIconFonts"),
                color: Colors.green,
                size: 36,
              ),
              Icon(
                IconData(0xe8b5, fontFamily: "MyIconFonts"),
                color: Colors.green,
                size: 48,
              ),
            ],
          )
        ),
        Divider()
      ],
    );
  }

  Widget _thirdIcon(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("3、使用自定义的字体icon图标，封装成静态", style: _titleStyle,),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                MyIconFonts.date,
                color: Colors.red,
                size: 24,
                textDirection: TextDirection.rtl,
                semanticLabel: "material icon",
              ),
              Icon(
                MyIconFonts.comment,
                color: Colors.red,
                size: 36,
              ),
              Icon(
                MyIconFonts.weChat,
                color: Colors.red,
                size: 48,
              ),
            ],
          )
        ),
        Divider()
      ],
    );
  }



}