import 'package:flutter/material.dart';

///
/// Desc           :  PageView + TabBar联动实现
/// Author         :  Jetictors
/// Time           :  2019/11/29 15:05
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class TabBarAndPageView extends StatefulWidget{

  final String title;

  TabBarAndPageView({Key key, this.title}) : super(key: key);

  _TabBarAndPageViewState createState() => _TabBarAndPageViewState();

}

class _TabBarAndPageViewState extends State<TabBarAndPageView> with SingleTickerProviderStateMixin{

  TabController _tabController;
  PageController _pageController;
  final _tabName = <String>["Java", "Koltin", "Dart", "Flutter"];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _tabName.length, vsync: this);
    _pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          tabs: _tabName.map((name) => Tab(child: Text(name))).toList(),
          onTap: (index){
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
        ),
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
        onPageChanged: (index){ _tabController.animateTo(index); },
      ),
    );
  }

}