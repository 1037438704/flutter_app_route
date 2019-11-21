import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app_route/routers/router_handler.dart';


class Routes{
  static String root ="/";
  static String homePage = "/home_page";
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> parames){
        //如果说找不到路径应该去跳转到一个空界面
      print('ERROR ====> ROUTE WAS NOT FONUND !!!!');
    }
    );
    router.define(homePage, handler: homeHandler);
  }
}