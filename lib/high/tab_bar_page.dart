import 'package:flutter/material.dart';

///
/// Desc           :  flutter 顶部导航标签组件（TabBar）学习
/// Author         :  Jetictors
/// Time           :  2019/10/24 17:00
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class TabBarPage extends StatefulWidget{

  TabBarPage({Key key, this.title}) : super(key : key);

  final String title;

  _TabBarPageState createState() => _TabBarPageState();

}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin{

  final _titleStyle = TextStyle(color: Colors.red);

  final _tabName = <String>["步行", "单车", "摩托车", "汽车"];
  final _tabIcon = <IconData>[Icons.directions_walk, Icons.directions_bike
    , Icons.motorcycle, Icons.directions_car];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.title),
      ),
    );
  }

}