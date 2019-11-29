import 'package:flutter/material.dart';

///
/// Desc           :  banner指示器
/// Author         :  Jetictors
/// Time           :  2019/11/28 17:04
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class Indicator extends StatelessWidget{

  Indicator({
    this.count : 0,
    this.direction : Axis.horizontal,
    this.currentIndex = 0,
    this.alignment : MainAxisAlignment.center,
    this.width = double.infinity,
    this.height = 24,
    this.size : 8.0,
    this.bgColor : Colors.transparent,
    this.normalColor : Colors.blue,
    this.selectColor : Colors.red,
    this.spacing : 4.0
  });

  // 点个数
  final int count;

  // 指示器方向
  final Axis direction;

  // 指示器宽度
  final double width;

  // 指示器高度
  final double height;

  // 点大小
  final double size;

  // 点 选中颜色
  final Color selectColor;

  // 点 未选中颜色
  final Color normalColor;

  // 指示器背景色
  final Color bgColor;

  // 当前选中的下标
  int currentIndex;

  // 点与点之间的间距
  final double spacing;

  // 对齐方式
  final MainAxisAlignment alignment;

  Widget _dot(int index){
    // 是否是当前页面被选中
    bool isCurrentPageSelected = index == this.currentIndex;

    var widthSize = this.direction == Axis.horizontal ? size : size + (2 * this.spacing);
    var heightSize = this.direction == Axis.horizontal ? size + (2 * this.spacing) : size;

    return new Container(
      height: widthSize,
      width: heightSize,
      child: new Center(
        child: new Material(
          color: isCurrentPageSelected ? this.selectColor : this.normalColor,
          type: MaterialType.circle,
          child: new Container(
            width: size,
            height: size,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(this.direction == Axis.horizontal){
      return Container(
        constraints: BoxConstraints.expand(width: this.width, height: this.height),
        padding: EdgeInsets.all(size),
        color: this.bgColor,
        child: Row(
          mainAxisAlignment: this.alignment,
          children: List<Widget>.generate(this.count, (index){
            return _dot(index);
          })
        ),
      );
    }else{
      return Container(
        constraints: BoxConstraints.expand(width: this.width, height: this.height),
        padding: EdgeInsets.all(size),
        color: this.bgColor,
        child: Column(
            mainAxisAlignment: this.alignment,
            children: List<Widget>.generate(this.count, (index){
              return _dot(index);
            })
        ),
      );
    }
  }

}