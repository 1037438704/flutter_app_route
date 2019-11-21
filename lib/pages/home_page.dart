import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String goodsId;

  HomePage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('第二个界面：${goodsId}'),
      ),

    );
  }
}

