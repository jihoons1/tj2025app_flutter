// lib/example/실습/실습1/실습/Singup.dart

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Singup extends StatefulWidget{
  SingupState createstate() => SingupState();
}
class SingupState extends State<Singup>{
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  void singsave() async {
    print(title.text);
    final obj = { 'ptitle': title.text, 'pcontent': content.text};
    print(obj);
    try {
      final dio = Dio();
      final respon = await dio.post(
          "http://localhost:8080/api/practice", data: obj);
      final data = respon.data;
      print(data);
      logAll();
    } catch (e) {
      print(e);
    }
  }
  void logAll() async {
    try {
      final dio = Dio();
      final respon = await dio.get("http://localhost:8080/api/practice/list");
      final data = respon.data;
      print(data);
      setState(() {
        loglist = data;
      });
    } catch (e) { print(e)}
  }
  @override
  void
    }
    }
  }
  

