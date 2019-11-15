import 'package:flutter/material.dart';

///
/// Desc           :  flutter 受限制的容器（ConstrainedBox、SizedBox...等）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 15:36
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class ConfinedBoxPage extends StatelessWidget{

  final String title;

  final _titleStyle = new TextStyle(color: Colors.red);

  ConfinedBoxPage({Key key, this.title}) : super(key : key);

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
          _first(),
          _second(),
          _third(),
          _fourth(),
          _five(),
          _six(),
          _seven(),
          _eight(),
          _nine(),
          _ten()
        ],
      )
    );
  }

  Widget _first(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1、SizeBox组件, 用于给子元素指定固定的宽高, 例：50 x 50", style: _titleStyle),
          SizedBox(
            width: 50,
            height: 50,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text("50 * 50", style: TextStyle(color: Colors.white))
            )
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _second(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、ConstrainedBox组件，用于对子组件添加额外的约束", style: _titleStyle),
          ConstrainedBox(
            constraints: BoxConstraints.expand(width: 50, height: 50),
            child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: Text("50 * 50", style: TextStyle(color: Colors.white))
            )
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _third(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("3、ConstrainedBox.expand()，长度最大化，高度50", style: _titleStyle),
          ConstrainedBox(
              constraints: BoxConstraints.expand(height: 50),
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text("max * 50", style: TextStyle(color: Colors.white))
              )
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _fourth(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("4、ConstrainedBox.tightFor，固定宽高", style: _titleStyle),
          ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 50, height: 50),
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text("50 * 50", style: TextStyle(color: Colors.white))
              )
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _five(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("5、多重限制，当参数为minXXX()时，取父子中相应数值较大的参数", style: _titleStyle),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100, minHeight: 50),
            child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 20, minHeight: 100),
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text("100 * 100", style: TextStyle(color: Colors.white))
                )
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _six(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("6、多重限制，当参数为maxXXX()时，取父子中相应数值较小的参数", style: _titleStyle),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100, maxHeight: 50),
            child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 20, maxHeight: 20),
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text("match * 20", style: TextStyle(color: Colors.white))
                )
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _seven(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("7、UnconstrainedBox组件，去除多重限制", style: _titleStyle),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 100, minHeight: 50),
            child: UnconstrainedBox(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 60, minHeight: 30),
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    child: Text("60 * 30", style: TextStyle(color: Colors.white))
                ),
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _eight(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("8、AspectRatio组件，指定子组件的长宽比", style: _titleStyle),
          AspectRatio(
            aspectRatio: 3 / 1, // 宽比高， 即在确定宽度的情况下，可以算出高度为其1/3
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text("match * 50", style: TextStyle(color: Colors.white))
          ),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _nine(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("9、LimitedBox组件，用于指定最大宽高", style: _titleStyle),
          LimitedBox(
            maxHeight: 50,
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              child: Text("match * 50", style: TextStyle(color: Colors.white))
          ),
          ),
          Divider()
        ],
      ),
    );
  }

  Widget _ten(){
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("10、FractionallySizedBox组件，根据父容器宽高的百分比来设置子组件宽高", style: _titleStyle),
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child:  FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 0.5,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text("match / 2 * 25", style: TextStyle(color: Colors.white))
              ),
            ),
          ),
          Divider()
        ],
      ),
    );
  }

}