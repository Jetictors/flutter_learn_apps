import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Desc           :  flutter 对话框（Dialog）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class DialogPage extends StatelessWidget{

  DialogPage({Key key, this.title}) : super(key : key);
  final _titleStyle = TextStyle(color: Colors.red);
  final String title;

  final _itemTitle = <String>["1、AlertDialog", "2、SimpleDialog", "3、AboutDialog",
    "4、底部弹窗", "5、加载框", "6、日期选择框", "7、时间选择框", "8、苹果风格的时间选择框",
    "9、(Dialog)实现列表框", "10、不是material风格的Dialog", "11、单选弹窗", "12、多选弹窗"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: _itemTitle.length,
          itemBuilder: (context, index){
            return _itemWidget(context, index);
          },
        )
    );
  }

  Widget _itemWidget(BuildContext context, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Text(_itemTitle[index], style: _titleStyle),
          trailing: Icon(Icons.arrow_right, color: Colors.red),
          onTap: (){ _itemClick(context, index); },
        ),
        Divider(),
      ],
    );
  }

  void _itemClick(BuildContext context, int index){
    switch(index){
      case 0: _showAlertDialog(context); break;
      case 1: _showSimpleDialog(context); break;
      case 2: _showAboutDialog(context); break;
      case 3: _showBottomDialog(context); break;
      case 4: _showLoadingDialog(context); break;
      case 5: _showDateDialog(context); break;
      case 6: _showTimeDialog(context); break;
      case 7: _showIosDateDialog(context); break;
      case 8: _showListDialog(context); break;
      case 9: _showOtherDialog(context); break;
      case 10: _showRadioButtonDialog(context); break;
      case 11: _showCheckBoxDialog(context); break;
      default: { log("pos is extis!"); } break;
    }
  }

  void _showAlertDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text("提示"),
          content: Text("我打开了弹窗"),
          actions: <Widget>[
            OutlineButton(
              child: Text("取消"),
              onPressed: (){ Navigator.of(context).pop(); },
            ),
            OutlineButton(
              child: Text("确定"),
              onPressed: (){ Navigator.of(context).pop(); },
            )
          ],
        );
      }
    );
  }

  void _showSimpleDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return SimpleDialog(
          title: Text("请选择你最喜欢的编程语言"),
          backgroundColor: Colors.blue[100],
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Java"),
              onPressed: (){ Navigator.of(context).pop(); },
            ),
            SimpleDialogOption(
              child: Text("Kotlin"),
              onPressed: (){ Navigator.of(context).pop(); },
            ),
            SimpleDialogOption(
              child: Text("Dart"),
              onPressed: (){ Navigator.of(context).pop(); },
            ),
            SimpleDialogOption(
              child: Text("Object-C"),
              onPressed: (){ Navigator.of(context).pop(); },
            )
          ],
        );
      }
    );
  }

  void _showAboutDialog(BuildContext context){
    showAboutDialog(
      context: context,
      applicationName: "Flutter Learn",
      applicationIcon: FlutterLogo(size: 36),
      applicationVersion: "1.0.1",
      applicationLegalese: "",
      children: [
        Text("文本一"),
        Text("文本二"),
      ],
    );
  }

  /*
    showBottomSheet和showModalBottomSheet都是弹出底部弹窗
    其区别是showModalBottomSheet是material风格的，即半屏
    showBottomSheet是全屏的
   */
  void _showBottomDialog(BuildContext context){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.blue[100],
        builder: (context){
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index){
              return ListTile(
                title: Text("选项${index + 1}", style: _titleStyle),
                onTap: (){ Navigator.of(context).pop(); },
              );
            },
          );
        }
    );
  }

  void _showLoadingDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true, // 点击外部可关闭dialog， 默认为true
      builder: (context){
        return UnconstrainedBox(  // 去除父组件的限制，因为默认的alertDialog的宽度太大
          child: SizedBox(
            width: 240,
            child: AlertDialog(
              content: Column(
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.blue[100],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("正在拼命加载中..."),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  void _showDateDialog(BuildContext context){
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2010),
        lastDate: DateTime(2025),
    );
  }

  void _showTimeDialog(BuildContext context){
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
  }

  void _showIosDateDialog(BuildContext context){
    var date = DateTime.now();
    showCupertinoModalPopup(
        context: context,
        builder: (context){
          return SizedBox(
            height: 200,
            child: CupertinoDatePicker(
            // 模式选择， 日期/时间/日期加时间
              mode: CupertinoDatePickerMode.date,
              initialDateTime: date,
              minimumYear: date.year - 10,
              maximumYear: date.year + 10,
              onDateTimeChanged: (DateTime value){
                log(value.toString());
              },
            ),
          );
        }
    );
  }

  void _showListDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        var child = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 24, left: 24),
              child:  Text("请选择：", style: _titleStyle),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index){
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("item ${index + 1}"),
                        onTap: (){ Navigator.of(context).pop(); },
                      ),
                      Divider()
                    ],
                  );
                }
              )
            )
          ],
        );

        return Dialog(
          backgroundColor: Colors.blue[100],
          child: child,
        );
      }
    );
  }

  void _showOtherDialog(BuildContext context){
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black87,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 500),
      transitionBuilder: _buildMaterialDialogTransitions,
      pageBuilder: (context, anim1, anim2){
        return AlertDialog(
          title: Text("提示"),
          content: Text("我是普通的Dialog, 我定制了许多属性哦！"),
          elevation: 3,
          actions: <Widget>[
            OutlineButton(
              child: Text("确定"),
              onPressed: (){ Navigator.of(context).pop(); },
            )
          ],
        );
      }
    );
  }

  void _showRadioButtonDialog(BuildContext context){
    int _groupValue = 0;
    showDialog(
      context : context,
      barrierDismissible: false,
      builder: (context){
        var child = ConstrainedBox(
          constraints: BoxConstraints.expand(height: 400),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text("请选择：", style: _titleStyle)
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RadioListTile(
                          title: Text("item ${index + 1}"),
                          activeColor: Colors.red,
                          value: index,
                          groupValue: _groupValue,
                          onChanged: (value){
                            // 此时context为对话框UI的根Element，我们
                            // 直接将对话框UI对应的Element标记为dirty
                            (context as Element).markNeedsBuild();
                            _groupValue = value;
                          },
                        ),
                        Divider()
                      ],
                    );
                  }
                ),
              ),
              OutlineButton(
                child: Text("确定"),
                onPressed: (){
                  Navigator.of(context).pop();
                  log("${_groupValue + 1} item chick select !");
                },
              )
            ],
          )
        );

        return Dialog(child: child);
      }
    );
  }

  void _showCheckBoxDialog(BuildContext context){

    bool _itemCheck = false;
    final _selectList = <bool>[];

    showDialog(
        context : context,
        barrierDismissible: false,
        builder: (context){
          var child = ConstrainedBox(
              constraints: BoxConstraints.expand(height: 400),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text("请选择：", style: _titleStyle)
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CheckboxListTile(
                                title: Text("item ${index + 1}"),
                                activeColor: Colors.blue,
                                checkColor: Colors.red,
                                value: _itemCheck,
                                onChanged: (value){
                                  (context as Element).markNeedsBuild();
                                  _itemCheck = value;
                                  if(value){
                                    _selectList.add(value);
                                  }else{
                                    _selectList.remove(value);
                                  }
                                },
                                selected: _itemCheck,
                              ),
                              Divider()
                            ],
                          );
                        }
                    ),
                  ),
                  OutlineButton(
                    child: Text("确定"),
                    onPressed: (){
                      Navigator.of(context).pop();

                    },
                  )
                ],
              )
          );

          return Dialog(child: child);
        }
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

}