import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeAty extends StatefulWidget {
  @override
  _HomeAtyState createState() => _HomeAtyState();
}

class _HomeAtyState extends State<HomeAty> {

  int _count = 0;

  @override
  void initState() {
    super.initState();
    _show();
  }
//定时器
  Timer _timer;
  DateTime _lastPressedAt;


  @override
  Widget build(BuildContext context) {

    //上次点击时间

//将Scaffold 作为WillPopScope的子控件
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 2)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          Fluttertoast.showToast(msg: '再按一次退出');
          return false;
        } else {
          exit(0);
          _timer.cancel();
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('轻量级存储')),
        body:  Column(
          children: <Widget>[
            Expanded(
              child: Text("$_count"),
            ),
            GestureDetector(
              onTap: () {
                _add();
              },
              child: Icon(Icons.add_box),
            )
          ],

        ),
      ),
    );

  }

  void _add() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _count++;
    sharedPreferences.setInt("count", _count);
    print("第$_count条");
    _show();
  }
  void _show() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if(sharedPreferences.getInt('count') != null){
      setState(() {
        _count = sharedPreferences.getInt('count');
        Fluttertoast.showToast(msg: _count.toString());
      });
    }
  }
  void _clean() async{
    //清除所有的存储
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
  void cls() async{
    //删除指定的key
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('count');
  }
}