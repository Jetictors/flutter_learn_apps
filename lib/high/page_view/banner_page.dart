import 'package:flutter/material.dart';
import 'package:flutter_learn_app/high/page_view/indicator_widget.dart';
import 'package:oktoast/oktoast.dart';

///
/// Desc           :  flutter 列表组件（GridView）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class BannerPage extends StatefulWidget{

  BannerPage({Key key, this.title}) : super(key : key);

  final String title;

  _BannerPageState createState() => _BannerPageState();

}

class _BannerPageState extends State<BannerPage>{

  final _titleStyle = TextStyle(color: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            _first(),
            Divider(),
            _second()
          ],
        )
    );
  }

  ///
  /// 实现横向的pageView
  ///
  Widget _first(){

    int currentPage = 0;
    final _controller = PageController();

    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("1、实现横向滑动的banner", style: _titleStyle),
          Container(
            constraints: BoxConstraints.expand(width: double.infinity, height: 140),
            color: Colors.green,
            alignment: Alignment.center,
            child: PageView.builder(
                controller: _controller,
                itemCount: 5,
                itemBuilder: (context, index){
                  return GestureDetector(
                    child: Container(
                      constraints: BoxConstraints.expand(width: double.infinity, height: 140),
                      alignment: Alignment.center,
                      child: Text("页面${index + 1}", style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    onTap: (){ showToast("实例1：页面${index + 1}被点击"); },
                  );
                },
              onPageChanged: (index){
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Indicator(
            count: 5,
            bgColor: Colors.green,
            alignment: MainAxisAlignment.end,
            direction: Axis.horizontal,
            currentIndex: currentPage,
          ),
        ],
      ),
    );
  }

  ///
  /// 实现横向的pageView
  ///
  Widget _second(){
    final _controller = PageController();
    int currentPage = 0;

    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("2、实现纵向滑动的banner", style: _titleStyle),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(width: double.infinity, height: 164),
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: Container(
                          constraints: BoxConstraints.expand(width: double.infinity, height: 164),
                          alignment: Alignment.center,
                          child: Text("页面${index + 1}", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ),
                        onTap: (){ showToast("实例2：页面${index + 1}被点击"); },
                      );
                    },
                    onPageChanged: (index){
                      setState(() {
                        currentPage = index;
                      });
                    },
                  ),
                ),
              ),
              Indicator(
                currentIndex: currentPage,
                count: 5,
                bgColor: Colors.green,
                alignment: MainAxisAlignment.end,
                direction: Axis.vertical,
                height: 164,
                width: 24,
              ),
            ],
          )
        ],
      ),
    );
  }

}