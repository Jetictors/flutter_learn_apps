import 'package:flutter/material.dart';

///
/// Desc           :  flutter 图片组件（Image）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:33
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///

class ImagePage extends StatelessWidget{

  ImagePage({Key key, this.title}) : super(key : key);

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
          _firstImg(),
          _secondImg(),
          _thirdImg(),
          _fourthImg(),
          _fiveImg(),
          _sixImg()
        ],
      ),
    );
  }

  /*
      加载网络图片
   */
  Widget _firstImg(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
          title: Text("1、加载网络图片", style: _titleStyle),
          subtitle: Image.network(
              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3296637149,2908213866&fm=26&gp=0.jpg",
              scale: 1,
              width: 100,
              height: 100
          )
        ),
        Divider()
      ],
    );
  }

  /*
    加载资源图片
   */
  Widget _secondImg(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ListTile(
            title: Text("2、加载资源图片", style: _titleStyle),
            subtitle: Image.asset("imgs/ic_lock_close.png", width: 56, height: 56)
        ),
        Divider()
      ],
    );
  }

  /*
    图片填充方式
   */
  Widget _thirdImg(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("3、图片的填充方式", style: _titleStyle),
          subtitle: Column(
            children: <Widget>[
              Image.asset("imgs/ic_header_1.png", width: 150, height: 56, fit: BoxFit.cover),
              Image.asset("imgs/ic_header_1.png", width: 200, height: 56, fit: BoxFit.contain),
              Image.asset("imgs/ic_header_1.png", width: 150, height: 56, fit: BoxFit.fill),
              Image.asset("imgs/ic_header_1.png", width: 200, height: 56, fit: BoxFit.fitWidth)
            ],
          ),
        ),
        Divider()
      ],
    );
  }


  /*
    图片重复
   */
  Widget _fourthImg(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("4、图片重复方式", style: _titleStyle),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("imgs/ic_header_2.png", width: 200, height: 56, repeat: ImageRepeat.repeat),
              Image.asset("imgs/ic_header_2.png", width: 56, height: 200, repeat: ImageRepeat.repeatY),
              Image.asset("imgs/ic_header_2.png", width: 72, height: 72, repeat: ImageRepeat.noRepeat)
            ],
          ),
        ),
        Divider()
      ],
    );
  }

  /*
    图片对齐方式
   */
  Widget _fiveImg(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("5、图片对齐方式", style: _titleStyle),
          subtitle: Container(
            width: 150,
            height: 150,
            color: Colors.blue,
            child: Image.asset("imgs/ic_header_2.png", width: 56, height: 56, alignment: Alignment.bottomRight)
          ),
        ),
        Divider()
      ],
    );
  }

  /*
    图片颜色的混合模式
   */
  Widget _sixImg(){
    return Column(
      children: <Widget>[
        ListTile(
          title: Text("6、图片颜色的混合模式", style: _titleStyle),
          subtitle: Column(
            children: <Widget>[
              Image.asset("imgs/ic_header_3.png", width: 56, height: 56, color: Colors.red),
              Image.asset("imgs/ic_header_3.png", width: 56, height: 56, color: Colors.red, colorBlendMode: BlendMode.colorDodge),
              Image.asset("imgs/ic_header_3.png", width: 56, height: 56, color: Colors.red, colorBlendMode: BlendMode.colorBurn),
              Image.asset("imgs/ic_header_3.png", width: 56, height: 56, color: Colors.red, colorBlendMode: BlendMode.darken),
              Image.asset("imgs/ic_header_3.png", width: 56, height: 56, color: Colors.red, colorBlendMode: BlendMode.difference)
            ],
          ),
        ),
        Divider()
      ],
    );
  }


}