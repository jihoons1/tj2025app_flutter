// lib/example/실습/실습1/실습/MainHoom.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainHoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: Text("플로터 연결 실습"),),
      body: Center(
        child: ElevatedButton(onPressed: (){ Navigator.pushNamed(context, "/singup"); }, child: Text("회원가입 페이지로 이동")),
      ),
    );
  }
}