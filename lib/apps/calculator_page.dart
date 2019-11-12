import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Desc           :  flutter 实现一个计算器
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:24
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class CalculatorPage extends StatefulWidget {

  final String title;

  CalculatorPage({Key key, this.title}) : super(key: key);

  _CalculatorPageState createState() => _CalculatorPageState();

}

class CalculatorConstants{

  // 操作按钮"0"
  static const operateZero = "zero";

  // 操作按钮"."
  static const operatePoint = "point";

  // 操作数字按钮"1 - 9"
  static const operateNum = "num";

  // 操作算法按钮"+/-/x/÷"
  static const operateChar = "operat";

  // 操作删除按钮
  static const operateDelete = "delete";

  // 操作清空按钮（AC）
  static const operateClear = "clear";

  // 操作等于按钮
  static const operateResult = "result";

}

class _CalculatorPageState extends State<CalculatorPage>{

  // 运算结果
  String mResult = "0";

  // 第一个操作数
  String mFirstStr = "";

  // 第二个操作数
  String mSecondStr = "";

  // 操作符
  String mOperateStr = "";

  // 清空键按钮文本
  String mClearText = "AC";

  // 显示数值
  String mProcess = "0";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _resultWidget(),
          _operateWidget(),
          _keyboardWidget()
        ],
      ),
    );
  }

  ///
  /// 结果区域组件
  ///
  Widget _resultWidget(){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text("$mResult",
            maxLines: 1,
            style: TextStyle(fontSize: 25)
        )
      )
    );
  }

  ///
  /// 操作区域组件
  ///
  Widget _operateWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 16, bottom: 6),
          child: Text("$mOperateStr", style: TextStyle(fontSize: 20))
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 16, top: 6, bottom: 12),
              child: Text("$mProcess",  maxLines: 1, style: TextStyle(fontSize: 20)),
            )
          ]
        )
      ],
    );
  }

  ///
  /// 键盘区域组件
  ///
  Widget _keyboardWidget(){
    return Expanded(
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                _getButton(1, CalculatorConstants.operateClear, mClearText, Colors.grey, Colors.white),
                _getButton(1, CalculatorConstants.operateNum, "1", Colors.grey, Colors.white),
                _getButton(1, CalculatorConstants.operateNum, "4", Colors.grey, Colors.white),
                _getButton(1, CalculatorConstants.operateNum, "7", Colors.grey, Colors.white),
                _getButton(1, CalculatorConstants.operatePoint, ".", Colors.grey, Colors.white),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            _getButton(1, CalculatorConstants.operateChar, "+", Colors.grey, Colors.white),
                            _getButton(1, CalculatorConstants.operateNum, "2", Colors.grey, Colors.white),
                            _getButton(1, CalculatorConstants.operateNum, "5", Colors.grey, Colors.white),
                            _getButton(1, CalculatorConstants.operateNum, "8", Colors.grey, Colors.white)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            _getButton(1, CalculatorConstants.operateChar, "-", Colors.grey, Colors.white),
                            _getButton(1, CalculatorConstants.operateNum, "3", Colors.grey, Colors.white),
                            _getButton(1, CalculatorConstants.operateNum, "6", Colors.grey, Colors.white),
                            _getButton(1, CalculatorConstants.operateNum, "9", Colors.grey, Colors.white)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: _getButton(0, CalculatorConstants.operateZero, "0", Colors.grey, Colors.white)
                  )
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child:  Column(
              children: <Widget>[
                _getButton(1, CalculatorConstants.operateChar, "x", Colors.grey, Colors.white),
                _getButton(1, CalculatorConstants.operateChar, "÷", Colors.grey, Colors.white),
                _getButton(1, CalculatorConstants.operateDelete, "←", Colors.grey, Colors.white),
                _getButton(2, CalculatorConstants.operateResult, "=", Colors.grey, Colors.white),
              ],
            )
          )
        ],
      )
    );
  }

  ///
  /// 生成按钮组件
  /// [flex]       权重
  /// [operate]    操作类型
  /// [text]       按钮文本
  /// [textColor]  文本颜色
  /// [bgColor]    按钮背景颜色
  ///
  Widget _getButton(int flex, String operate, String text, Color textColor, Color bgColor){

    OutlineButton button = OutlineButton(
      child: Text(text, style: TextStyle(color: textColor, fontSize: 20)),
      color: bgColor,
      disabledBorderColor: bgColor,
      highlightedBorderColor: bgColor,
      onPressed: (){ _operator(operate, text); },
    );

    if(flex == 0) {
      return button;
    }else{
      return Expanded(
        flex: flex,
        child: button
      );
    }
  }

  void _operator(String operate, String text){
    switch(operate){
      case CalculatorConstants.operatePoint :
        _dealPoint(text);
        break;
      case CalculatorConstants.operateZero :
        _dealZero(text);
        break;
      case CalculatorConstants.operateNum : {
        _dealNum(text);
      } break;
      case CalculatorConstants.operateChar :
        _dealOperate(text);
        break;
      case CalculatorConstants.operateDelete :
        _delete();
        break;
      case CalculatorConstants.operateClear :
        _clear();
        break;
      case CalculatorConstants.operateResult :
        _equal();
        break;
      default : {} break;
    }
  }

  /*
    处理按钮`.`的逻辑
   */
  void _dealPoint(String value){

    if(mOperateStr.isEmpty){
      if(mFirstStr.contains('.')) return;

      if (mFirstStr.isEmpty){
        mFirstStr = "0" + value;
      } else{
        mFirstStr += value;
      }
    }else{
      if(mSecondStr.contains('.')) return;

      if (mSecondStr.isEmpty){
        mSecondStr = "0" + value;
      } else{
        mSecondStr += value;
      }
    }
    _changeProcess();
  }

  /*
    处理按钮`0`的逻辑
   */
  void _dealZero(String value){
    if(mOperateStr.isEmpty){
      if (mFirstStr.isEmpty || mFirstStr.toString() == value) return;

      mFirstStr += value;
    }else{
      if (mSecondStr.isEmpty || mSecondStr.toString() == value) return;

      mSecondStr += value;
    }
    _changeProcess();
  }

  /*
    处理数字1 - 9的逻辑
   */
  void _dealNum(String value){
    if(mOperateStr.isEmpty){
      mFirstStr += value;
    }else{
      mSecondStr += value;
    }
    _changeProcess();
  }

  /*
    处理算法逻辑， + / - / * / ÷
   */
  void _dealOperate(String value){
    mSecondStr = "";

    setState(() {
      mOperateStr = value;
    });
  }

  /*
    更新清除按钮以及输入框
   */
  void _changeProcess(){

    String process = "";

    if(mOperateStr.isEmpty){
      if (mFirstStr.isEmpty)
        process =  "0";
      else
        process = mFirstStr.toString();
    }else{
      if (mSecondStr.isEmpty)
        process =  "0";
      else
        process = mSecondStr.toString();
    }

    setState(() {
      if (process == "0"){
        this.mClearText = "AC";
      }else{
        this.mClearText = "C";
      }

      this.mProcess = process;
    });
  }

  /*
    删除（退格）
   */
  void _delete(){
    if(mOperateStr.isEmpty){
      if(mFirstStr.isNotEmpty) mFirstStr = mFirstStr.substring(0, mFirstStr.length - 1);
    }else{
      if(mSecondStr.isNotEmpty) mSecondStr = mSecondStr.substring(0, mSecondStr.length - 1);
    }
    _changeProcess();
  }

  /*
    清空函数
   */
  void _clear(){

    setState(() {
      if(mClearText == "C"){
        if(mOperateStr.isEmpty){
          mFirstStr = "";
        }else{
          mSecondStr = "";
        }
        this.mClearText = "AC";
      }else{
        mFirstStr = "";
        mSecondStr = "";
        mResult = "0";
        mOperateStr = "";
      }
      mProcess = "0";
    });
  }

  /*
    处理算法的逻辑
   */
  void _equal(){
    double numFirst = 0;
    double numSecond = 0;
    double numResult = 0;

    if(mOperateStr.isEmpty && mProcess != "0"){
      numFirst = double.parse(mProcess);
    }else{
      if(this.mResult.isNotEmpty && this.mResult != "0"){
        numFirst = double.parse(this.mResult);
      }else{
        if(mFirstStr.isNotEmpty){
          numFirst = double.parse(mFirstStr);
        }
      }
    }

    if(mSecondStr.isNotEmpty){
      numSecond = double.parse(mSecondStr);
    }

    switch(mOperateStr){
      case "+" :
        numResult = numFirst + numSecond;
        break;
      case "-" :
        numResult = numFirst - numSecond;
        break;
      case "x" :
        numResult = numFirst * numSecond;
        break;
      case "÷" :
        if(numSecond == 0){
          _showDialog();
        }else{
          numResult = numFirst / numSecond;
        }
        break;
      default :
        numResult = numFirst;
        break;
    }
    setState(() {
      
      mFirstStr = "";
      mSecondStr = "";
      mOperateStr = "";
      mProcess = "0";
      mResult = _subZeroAndDot(numResult.toString());
    });

  }

  void _showDialog(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return AlertDialog(
            title: Text("提示", style: TextStyle(color: Colors.red, fontSize: 20)),
            content: Text("被除数不能为0哦!"),
            actions: <Widget>[
              OutlineButton(
                child: Text("确定"),
                onPressed: (){ Navigator.of(context).pop(); }
              )
            ],
          );
        }
    );
  }
  
  ///
  /// 使用正则表达式去掉多余的.与0
  /// [s] 待处理的字符串
  /// 
  String _subZeroAndDot(String s){
    if(s.indexOf(".") > 0){
      //去掉多余的0
      s = s.replaceAll(RegExp("0+?\$"), "");
      //如最后一位是.则去掉
      s = s.replaceAll(RegExp("[.]\$"), "");
    }
    return s;
  }

}
