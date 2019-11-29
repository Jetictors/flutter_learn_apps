import 'package:flutter/material.dart';

///
/// Desc           :  PageView + BottomNavigationBar联动实现
/// Author         :  Jetictors
/// Time           :  2019/11/29 15:05
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class BottomBarAndPageView extends StatefulWidget{

  final String title;

  BottomBarAndPageView({Key key, this.title}) : super(key: key);

  _BottomBarAndPageViewState createState() => _BottomBarAndPageViewState();

}

class _BottomBarAndPageViewState extends State<BottomBarAndPageView>{

  PageController _pageController;

  final _tabName = <String>["首页", "发现", "其他", "我的"];

  final _tabIcon = <IconData>[Icons.home, Icons.find_replace,
    Icons.devices_other, Icons.supervised_user_circle];

  List<BottomNavigationBarItem> items;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();

    items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(_tabIcon[0]),
          title: Text(_tabName[0])
      ),
      BottomNavigationBarItem(
          icon: Icon(_tabIcon[1]),
          title: Text(_tabName[1])
      ),
      BottomNavigationBarItem(
          icon: Icon(_tabIcon[2]),
          title: Text(_tabName[2])
      ),
      BottomNavigationBarItem(
          icon: Icon(_tabIcon[3]),
          title: Text(_tabName[3])
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        backgroundColor: Colors.grey,
        onTap: (index){
          _pageController.jumpToPage(index);
        },
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _tabName.length,
        itemBuilder: (context, index){
          return Container(
            constraints: BoxConstraints.expand(width: double.infinity, height: double.infinity),
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(_tabName[index]),
          );
        },
        onPageChanged: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

}