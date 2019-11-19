import 'package:flutter/material.dart';

///
/// Desc           :  flutter 文本组件（Text）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:24
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///

class TextPage extends StatelessWidget{

  TextPage({Key key, this.title}) : super(key : key);

  final String title;

  final String strName = "Hello World";
  final _titleStyle = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new ListView(
          children: <Widget>[
            _firstText(),
            _secondText(5),
            _thirdText(1.2),
            _fourthText(),
            _fiveText(),
            _sixText(),
            _sevenText(),
            _eightText(),
            _nineText(),
            _tenText()
          ],
      ),
    );
  }

  /*
     基础使用
   */
  Widget _firstText(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("1、基本示例", style: _titleStyle),
          subtitle:  Text(strName),
        ),
        Divider()
      ],
    );
  }

  /*
    文本循环
   */
  Widget _secondText(int num){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("2、文本循环", style: _titleStyle),
          subtitle:  Text("$strName \t" * num),
        ),
        Divider()
      ],
    );
  }

  /*
    文本缩放，和设置文字大小有区别
   */
  Widget _thirdText(double scale){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("3、文本缩放", style: _titleStyle),
          subtitle:  Text( "Hello World", textScaleFactor: scale),
        ),
        Divider()
      ],
    );
  }

  /*
     设置文本对齐方式
   */
  Widget _fourthText(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("4、文本对齐方式", style: _titleStyle),
          subtitle:  Text("$strName \t" * 10, textAlign: TextAlign.center),
        ),
        Divider()
      ],
    );
  }

  /*
    maxLines
   */
  Widget _fiveText(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("5、最大行数", style: _titleStyle,),
          subtitle:  Text("$strName \t" * 10, maxLines: 2),
        ),
        Divider()
      ],
    );
  }

  /*
    文本裁剪
   */
  Widget _sixText(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("6、文本裁剪方式", style: _titleStyle),
          subtitle:  Text("$strName \t" * 10, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        Divider()
      ],
    );
  }

  /*
    文本显示方向
   */
  Widget _sevenText(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("7、文本显示方向", style: _titleStyle),
          subtitle:  Text("$strName \t", textDirection: TextDirection.rtl),
        ),
        Divider()
      ],
    );
  }

  /*
    设置文本样式
   */
  Widget _eightText(){
    // 这里只实现了几个属性，其他的属性可以根据TextStyle源码中的属性对应设置
    final _textStyle = TextStyle(
      color: Colors.green,
      backgroundColor: Colors.blue,
      fontSize: 25,
      decoration:TextDecoration.underline,
      decorationColor: Colors.black,
      decorationStyle: TextDecorationStyle.dashed
    );
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("8、设置文本样式", style: _titleStyle),
          subtitle:  Text("$strName \t", style: _textStyle),
        ),
        Divider()
      ],
    );
  }

  /*
    设置TextSpan
   */
  Widget _nineText(){
    final _textSpan = TextSpan(
      text: strName,
      children: [
        TextSpan(
          text: strName,
          style: TextStyle(color: Colors.blue)
        ),
        TextSpan(
            text: strName,
            style: TextStyle(color: Colors.red)
        )
      ]
    );
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("9、设置TextSpan", style: _titleStyle),
          subtitle:  Text.rich(_textSpan)
        ),
        Divider()
      ],
    );
  }

  /*
    设置DefaultTextStyle
   */
  Widget _tenText(){

    return Column(
      children: <Widget>[
        ListTile(
            title: Text("10、设置DefaultTextStyle", style: _titleStyle),
            subtitle: DefaultTextStyle(
              // 1.设置文本默认样式
              style: TextStyle(
                color:Colors.red,
                fontSize: 20.0,
              ),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(strName),
                  Text("$strName 啦啦啦"),
                  Text(strName,
                    style: TextStyle(
                        inherit: false, // 2.不继承默认样式
                        color: Colors.grey,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ],
              ),
            ),
        ),
        Divider()
      ],
    );
  }

}