import 'package:flutter/material.dart';
import 'package:flutter_learn_app/high/page_view/indicator_widget.dart';

///
/// Desc           :  用PageView实现一个引导页
/// Author         :  Jetictors
/// Time           :  2019/11/29 16:51
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class SplashPage extends StatelessWidget{

  final String title;

  SplashPage({Key key, this.title}) : super(key : key);

  final _bgColor = <Color>[Colors.yellow, Colors.brown, Colors.green];

  final _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              itemBuilder: (context, index){
                return Container(
                  constraints: BoxConstraints.expand(width: double.infinity, height: double.infinity),
                  color: _bgColor[index],
                  alignment: Alignment.center,
                  child: Text("Page $index", textScaleFactor: 2),
                );
              },
              onPageChanged: (index){  },
            ),
          ),
          Indicator(
            count: 3,
          )
        ],
      )
    );
  }

}