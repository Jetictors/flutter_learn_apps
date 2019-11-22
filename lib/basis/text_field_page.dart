import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

///
/// Desc           :  flutter 输入框组件（TextField）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 15:35
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class TextFieldPage extends StatefulWidget{

  TextFieldPage({Key key, this.title}) : super(key : key);

  final String title;

  _TextFieldPageState createState() => _TextFieldPageState();

}

class _TextFieldPageState extends State<TextFieldPage>{

  final _titleStyle = new TextStyle(color: Colors.red);

  TextEditingController _controllerFirst = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          _six()
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
          // 标题
          Text("1、使用默认，即什么属性都不设置", style: _titleStyle),
          TextField(),
          Divider(),
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
          // 标题
          Text("2、样式设置，使用decoration属性去完成输入框的装饰", style: _titleStyle),
          TextField(
            decoration: InputDecoration(
              // 这里只举例几个常用的，关于其他的属性设置，请查看源码
              hintText: "提示文本",
              hintStyle: TextStyle(color: Colors.blue, fontSize: 14),
              enabled: true, // 是否禁用, 默认为true

              /*
                  prefix和suffix类似android中的drawable, 只是一个是前、一个是后
                  prefix: 自定义组件
                  prefixIcon ： 图标组件
                  prefixText ： 文本组件
                  prefixStyle ： 文本样式
                  上面的几个属性，根据需求选择一个用即可
               */
              prefixIcon: Icon(Icons.face, color: Colors.grey),  // 类似android中的drawableLeft
              // prefixText: "用户名：",
              // prefixStyle: TextStyle(color: Colors.red, fontSize: 16),
              suffixIcon: Icon(Icons.clear, color: Colors.grey),

              /*
                边框样式
                border : 未选中时的边框样式
                focusedBorder ： 选中时的边框样式
                errorBorder   :  错误时的边框样式
                enabledBorder :  禁用时的边框样式
                ... 等等
               */
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue, width: 1)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red, width: 1)
              ),

            ),
          ),
          Divider(),
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
          // 标题
          Text("3、修改游标样式", style: _titleStyle),
          TextField(
            cursorWidth: 5, // 默认为2
            showCursor: true,   // 是否显示游标, 默认为true
            cursorColor: Colors.red,  // 游标颜色
            cursorRadius: Radius.circular(12), // 游标圆角
          ),
          Divider(),
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
          // 标题
          Text("4、其他属性设置，输入类型、对齐方式、行数、字符统计、键盘等等", style: _titleStyle),
          TextField(
            textInputAction: TextInputAction.next,  // 键盘最后一个按钮 TextInputAction是一个枚举类
            textAlign: TextAlign.center,            // 居中
            keyboardType: TextInputType.phone,      // 键盘类型，（这里为电话号码，即全数字键盘）
            maxLength: 20,                          // 限制20个字符
            maxLines: 1,                            // 最大行数
            obscureText: true,                      // 支持密码样式
          ),
          Divider(),
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
          // 标题
          Text("5、各种事件监听，onChange()、onTap()等等，不过更推荐使用controller去统一处理", style: _titleStyle),
          TextField(
            textInputAction: TextInputAction.next,
            onSubmitted: (value){
              showToast("触发了onSubmitted()事件");
            },
            onChanged: (value){
              showToast("触发了onChanged()事件");
            },
            onTap: (){
              showToast("触发了onTap()事件");
            },
            onEditingComplete: (){
              // onSubmitted事件高于onEditingComplete事件
              showToast("触发了onEditingComplete()事件");
            },
          ),
          Divider(),
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
          // 标题
          Text("6、控制器，使用controller属性", style: _titleStyle),
          TextField(
            controller: _controllerFirst,
            decoration: InputDecoration(
              suffix: FlatButton(
                child: Text("清空", style: TextStyle(color: Colors.red, fontSize: 12)),
                onPressed: (){ _controllerFirst.clear(); },
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("获取值"),
                onPressed: (){
                  showToast(_controllerFirst.text);
                },
              ),
              RaisedButton(
                child: Text("改变值为 哈哈 "),
                onPressed: (){
                  _controllerFirst.text = "哈哈";
                },
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

}
