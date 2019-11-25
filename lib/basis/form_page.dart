import 'package:flutter/material.dart';
import 'package:flutter_learn_app/util/utils.dart';
import 'package:oktoast/oktoast.dart';

///
/// Desc           :  flutter 表单组件（Form）学习
/// Author         :  Jetictors
/// Time           :  2019/10/17 15:35
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class FormPage extends StatefulWidget{

  FormPage({Key key, this.title}) : super(key : key);

  final String title;

  @override
  _FormPageState createState() => _FormPageState();

}

class _FormPageState extends State<FormPage>{

  TextEditingController _userController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: _contentWidget(),
        )
    );
  }

  Widget _contentWidget(){
    return Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _userController,
              decoration: InputDecoration(
                hintText: "请输入手机号",
                icon: Icon(Icons.phone),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue, width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red, width: 1)
                ),
              ),
              validator: (phoneNum){
                if(phoneNum.isEmpty) return "请输入用户名";

                if(!CommonUtil.isPhoneNum(phoneNum)) return "请输入正确的手机号";

                return null;
              }
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                hintText: "请输入密码",
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.blue, width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.red, width: 1)
                ),
              ),
              obscureText: true,
              validator: (pwd){
                if(pwd.isEmpty) return "请输入密码";
                if(pwd.length < 6 || pwd.length > 16) return "请输入6到16位密码";
                return null;
              },
            ),
            Builder(builder: (context){
              return RaisedButton(
                child: Text("验证"),
                color: Colors.red,
                textColor: Colors.white,
                onPressed: (){
                  bool validate = Form.of(context).validate();
                  if(validate){
                    showToast("恭喜您！验证成功");
                    // 清空
                    Form.of(context).reset();
                  }else{
                    showToast("验证失败");
                  }
                },
              );
            })
          ],
        )
    );
  }

}