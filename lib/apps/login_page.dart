import 'package:flutter/material.dart';

///
/// Desc           :  实现一个登录页面
/// Author         :  Jetictors
/// Time           :  2019/11/12 12:13
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _userController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.red),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.blue[100],
        padding: EdgeInsets.symmetric(horizontal: 36),
        child: Center(
          child: Column(
            children: <Widget>[
              _logoWidget(),
              _contentWidget(),
              _bottomWidget(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _logoWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 48),
      child: Image.asset("imgs/ic_lock_close.png", width: 72, height: 72),
    );
  }

  Widget _contentWidget() {
    return Expanded(
      flex: 2,
      child: Column(
        children: <Widget>[
          _inputUser(),
          _inputPwd(),
          _forgetPwdButton(),
          _loginButton(),
          _registerButton(),
        ],
      ),
    );
  }

  Widget _inputUser() {
    return Padding(
      padding: EdgeInsets.only(top: 48),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12, top: 6, bottom: 6),
          prefixIcon: Icon(Icons.people),
          hintText: "请输入手机号",
          hintStyle: TextStyle(fontSize: 12),
          suffixIcon: IconButton(
            icon: Icon(Icons.close, size: 12),
            onPressed: _clearUser,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
        ),
        cursorColor: Colors.red,
        cursorWidth: 1,
        controller: _userController,
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget _inputPwd() {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12, top: 6, bottom: 6),
          prefixIcon: Icon(Icons.lock),
          hintText: "请输入密码",
          suffixIcon: IconButton(
            icon: Icon(Icons.close, size: 12),
            onPressed: _clearPwd,
          ),
          hintStyle: TextStyle(fontSize: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
        ),
        cursorColor: Colors.red,
        cursorWidth: 1,
        controller: _pwdController,
        obscureText: true,
      ),
    );
  }

  Widget _forgetPwdButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton(
          child: Text("忘记密码？"),
          onPressed: _forgetPwd,
        )
      ],
    );
  }

  Widget _loginButton() {
    return ListTile(
      subtitle: RaisedButton(
        child: Text("登录", style: TextStyle(color: Colors.white, fontSize: 16)),
        color: Colors.red[400],
        onPressed: _login,
      ),
    );
  }

  Widget _registerButton() {
    return ListTile(
      subtitle: RaisedButton(
        child: Text("注册", style: TextStyle(color: Colors.white, fontSize: 16)),
        color: Colors.red[400],
        onPressed: _register,
      ),
    );
  }

  Widget _bottomWidget() {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("------ 其他登录方式------"),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.motorcycle, size: 36, color: Colors.redAccent),
                  onPressed: _otherLoginFirst
                ),
                IconButton(
                  icon: Icon(Icons.directions_bike, size: 36, color: Colors.redAccent),
                  onPressed: _otherLoginSecond
                ),
                IconButton(
                  icon: Icon(Icons.card_travel, size: 36, color: Colors.redAccent),
                  onPressed: _otherLoginThird
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  bool _isPhoneNum(String phoneNum){
    RegExp mobile = new RegExp(r"1[0-9]\d{9}$");
    return mobile.hasMatch(phoneNum);
  }

  void _clearUser(){
      _userController.clear();
  }

  void _clearPwd(){
    _pwdController.clear();
  }

  void _forgetPwd(){
    _showDialog("点击了 忘记密码 按钮");
  }

  void _login(){

    final phoneNum = _userController.text;
    final pwd = _pwdController.text;

    if(phoneNum.isEmpty){
      _showDialog("请输入手机号");
      return;
    }

    if(!_isPhoneNum(phoneNum)){
      _showDialog("请输入正确的手机号");
      return;
    }

    if(pwd.isEmpty){
      _showDialog("请输入密码");
      return;
    }

    if(pwd.length > 16 || pwd.length < 6){
      _showDialog("请输入6~16位的密码");
      return;
    }

    _showDialog("恭喜您，登录成功！");

  }

  void _register(){
    _showDialog("点击了 注册 按钮");
  }

  void _otherLoginFirst(){
    _showDialog("点击了 其他登录方式一 按钮");
  }

  void _otherLoginSecond(){
    _showDialog("点击了 其他登录方式二 按钮");
  }

  void _otherLoginThird(){
    _showDialog("点击了 其他登录方式三 按钮");
  }

  void _showDialog(String strContent){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (content){
          return AlertDialog(
            title: Text("提示", style: TextStyle(color: Colors.red, fontSize: 20)),
            content: Text(strContent),
            actions: <Widget>[
              OutlineButton(
                child: Text("确定"),
                onPressed: (){ Navigator.of(content).pop(); }
              )
            ],
          );
        }
    );
  }

}
