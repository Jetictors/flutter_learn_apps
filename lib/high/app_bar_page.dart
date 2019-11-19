import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

///
/// Desc           :  flutter 顶部导航栏组件（AppBar）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class AppBarPage extends StatelessWidget{

  AppBarPage({Key key, this.title}) : super(key : key);

  final String title;
  final _titleStyle = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(title),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 12, top: 12, right: 12),
          child: ListView(
            children: <Widget>[
              _first(),
              _second(),
              _third(),
              _fourth(),
              _five(),
              _six()
            ],
          )
        )
    );
  }

  Widget _first(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("1、实现一个简易得AppBar", style: _titleStyle),
        AppBar(
          title: Text("测试一"),
          backgroundColor: Colors.blue,
        ),
        Divider()
      ],
    );
  }

  Widget _second(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("2、标题居中，换左右按钮", style: _titleStyle),
        AppBar(
          title: Text("测试二"),
          backgroundColor: Colors.blue,
          centerTitle: true,
          leading: Builder(builder: (context){
            return IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: (){
              showToast("second示例中的左边按钮被点击了！");
            });
          })
        ),
        Divider()
      ],
    );
  }

  Widget _third(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("3、隐藏左边按钮和不需要左边按钮", style: _titleStyle),
        AppBar(
          title: Text("测试三"),
          backgroundColor: Colors.blue,
          leading: Icon(null)
        ),
        Divider(),
        AppBar(
          title: Text("测试三"),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false
        ),
        Divider()
      ],
    );
  }

  Widget _fourth(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("4、添加阴影", style: _titleStyle),
        AppBar(
          title: Text("测试四"),
          backgroundColor: Colors.blue,
          // 阴影
          elevation: 6,
          // 外观
          shape: OutlineInputBorder(),
        ),
        Divider()
      ],
    );
  }

  Widget _five(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("5、样式属性", style: _titleStyle),
        AppBar(
          title: Text("测试五"),
          backgroundColor: Colors.blue,
          elevation: 6,
          // 左边按钮得样式 ，可以使用fallback()，size = 24， color = 黑色，opacity（透明度）= 1.0
          iconTheme: IconThemeData(color: Colors.red, size: 36, opacity: 0.7),
          // 文本样式
          textTheme: TextTheme(title: TextStyle(color: Colors.red)),
          // title与左边按钮的间距
          titleSpacing: 24,
        ),
        Divider()
      ],
    );
  }

  Widget _six(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("6、样式属性", style: _titleStyle),
        AppBar(
          title: Text("测试六"),
          backgroundColor: Colors.blue,
          // actions 右边按钮
          actions: <Widget>[
            Builder(builder: (context){
              return IconButton(icon: Icon(Icons.add, color: Colors.white), onPressed: (){
                showToast("six示例中的右边第一个按钮被点击了！");
              });
            }),
            Builder(builder: (context){
              return FlatButton(child: Text("完成", style: TextStyle(color: Colors.white, fontSize: 16)), onPressed: (){
                showToast("six示例中的右边第二个按钮被点击了！");
              });
            }),
          ],
        ),
        Divider()
      ],
    );
  }

}