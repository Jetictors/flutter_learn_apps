import 'package:flutter/material.dart';

///
/// Desc           :  进度条
/// Author         :  Jetictors
/// Time           :  2019/10/24 10:42
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class ProgressPage extends StatefulWidget{

  final String title;

  ProgressPage({Key key, this.title}) : super(key: key);

  _ProgressPageState createState() => _ProgressPageState();

}

class _ProgressPageState extends State<ProgressPage>{

  final _titleStyle = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new ListView(
       children: <Widget>[
         _firstProgress(),
         _secondProgress(),
         _thirdProgress(),
         _fourthProgress(),
         _fiveProgress(),
         _sixProgress()
       ],
      )
    );
  }

  /*
    线性进度条
    当不设置具体的值(value)时，为模糊进度条，会执行一个动画
   */
  Widget _firstProgress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text("1、线性的模糊进度条（LinearProgressIndicator）", style: _titleStyle),
          subtitle: LinearProgressIndicator(
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation(Colors.red),
            semanticsLabel: "LinearProgressIndicator",
            semanticsValue: "first",
          )
        ),
        Divider()
      ],
    );
  }

  /*
    线性进度条
    有确定值得进度条，其值（value）得取值区间为[0,1]
   */
  Widget _secondProgress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
            title: Text("2、线性的定值进度条（LinearProgressIndicator）", style: _titleStyle),
            subtitle: LinearProgressIndicator(
              value: 0.2,
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            )
        ),
        Divider()
      ],
    );
  }

  /*
    圆形进度条
   */
  Widget _thirdProgress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
            title: Text("3、圆形的模糊进度条（CircularProgressIndicator）", style: _titleStyle),
            subtitle: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.green,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                strokeWidth: 5,
              )
            )
        ),
        Divider()
      ],
    );
  }

  Widget _fourthProgress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
            title: Text("4、圆形的定值进度条（CircularProgressIndicator）", style: _titleStyle),
            subtitle: Center(
                child: CircularProgressIndicator(
                  value: 0.8,
                  backgroundColor: Colors.green,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  strokeWidth: 5,
                )
            )
        ),
        Divider()
      ],
    );
  }



  /*
    类似下拉刷新的进度条
   */
  Widget _fiveProgress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
            title: Text("5、刷新的进度条（RefreshProgressIndicator）", style: _titleStyle),
            subtitle: Center(
                child: RefreshProgressIndicator(
                  backgroundColor: null,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                  strokeWidth: 3,
                )
            )
        ),
        Divider()
      ],
    );
  }

  /*
    指定进度条大小
   */
  Widget _sixProgress(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("6、指定进度条大小", style: _titleStyle),

        Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: 3,
            child: LinearProgressIndicator(
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            width: 72,
            height: 72,
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
              valueColor: AlwaysStoppedAnimation(Colors.red),
            ),
          ),
        ),

        SizedBox(
          width: 100,
          height: 100,
          child: RefreshProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
            strokeWidth: 5,
          ),
        ),
        Divider()
      ],
    );
  }

}