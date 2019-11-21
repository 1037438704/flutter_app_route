import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_route/routers/routes.dart';
import 'package:flutter_app_route/utils/SPutils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../routers/application.dart';

class HomeAty extends StatefulWidget {
  @override
  _HomeAtyState createState() => _HomeAtyState();
}

class _HomeAtyState extends State<HomeAty> {
  int _count = 0;


  @override
  void initState() {
    super.initState();
    setState(() {
      Sp.getValue('count').then((value) {
        if(value == null){
          _count = 0;
        }else{
          _count = value;
        }
      });
    });
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
        body: Column(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.message),
                onPressed: () {
                  Application.router.navigateTo(context,"${Routes.homePage}?id=${Uri.encodeComponent("哈哈哈")}");
                }),
            Expanded(
              child: Text("$_count"),
            ),
            GestureDetector(
              onTap: () {
                print("点击了");
                Sp.add("count", _count++);
                setState(() {
                  Sp.getValue('count').then((value) {
                    _count = value;
                  });
                });
              },
              child: Icon(Icons.add_box),
            )
          ],
        ),
      ),
    );
  }
}
