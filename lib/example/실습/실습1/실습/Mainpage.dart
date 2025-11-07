// lib/example/실습/실습1/실습/Mainpage.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tj2025app_flutter/example/%EC%8B%A4%EC%8A%B5/%EC%8B%A4%EC%8A%B51/%EC%8B%A4%EC%8A%B5/MainHoom.dart';
import 'package:tj2025app_flutter/example/%EC%8B%A4%EC%8A%B5/%EC%8B%A4%EC%8A%B51/%EC%8B%A4%EC%8A%B5/Singup.dart';

class Mainpage extends StatefulWidget {
  MainPageState create() => MainPageState();
}

class MainPageState extends State<Mainpage> {
  int page = 0 ; // 화면 인덱스 번호

  dynamic pages = [
    MainHoom(),
    Singup(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: IndexedStack( index: page , children: pages ),
          bottomNavigationBar : BottomNavigationBar(
        currentIndex: page,
      onTap: (index) {setState(() { page = index; } ); } ,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home) ,
        label: "메인") ,
        BottomNavigationBarItem(icon: Icon(Icons.add) ,
        label: "가입") ,
        BottomNavigationBarItem(icon: Icon(Icons.list) ,
        label: "정보 리스트"),
      ]
    ),

    );
  }

}