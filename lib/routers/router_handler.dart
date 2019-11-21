import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/HomeAty.dart';


Handler homeHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String goodsId = params['id'].first;
    print('=========================================${goodsId}');
    return HomePage(goodsId);
  }

);









