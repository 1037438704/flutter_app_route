import 'package:shared_preferences/shared_preferences.dart';

class Sp{
  //存入数据
  static void add(String key,var value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(value is int){
      sharedPreferences.setInt(key, value);
    }
    if(value is String){
      sharedPreferences.setString(key, value);
    }
    if(value is bool){
      sharedPreferences.setBool(key, value);
    }
    if(value is double){
      sharedPreferences.setDouble(key, value);
    }
    if(value is List<String>){
      sharedPreferences.setStringList(key, value);
    }
  }


  //读取数据  需要有返回值
  static Future getValue(String key) async{
    var value1;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getInt(key) != null){
      value1 = sharedPreferences.getString(key);
    }
    return value1;
  }

  //清除所有的存储
  static void clean() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  //删除指定的key
  static void cls(var key1) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key1);
  }
}