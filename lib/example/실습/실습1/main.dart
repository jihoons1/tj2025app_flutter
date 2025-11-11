// lib/example/실습/실습1/main.dart

import 'package:flutter/material.dart';
import 'package:tj2025app_flutter/example/%EC%8B%A4%EC%8A%B5/%EC%8B%A4%EC%8A%B51/%EC%8B%A4%EC%8A%B5/Loginlist.dart';
import 'package:tj2025app_flutter/example/%EC%8B%A4%EC%8A%B5/%EC%8B%A4%EC%8A%B51/%EC%8B%A4%EC%8A%B5/MainHoom.dart';
import 'package:tj2025app_flutter/example/%EC%8B%A4%EC%8A%B5/%EC%8B%A4%EC%8A%B51/%EC%8B%A4%EC%8A%B5/Singup.dart';

void main() { runApp( MyApp() ); }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: "/", // 시작(최초) 경로 지정
      routes: {
        "/" : (context) => MainHoom() ,
        "/singup" : (context) => Singup() ,
        "/loginlist" : (context) => Loginlist() ,

      },
    ); // Mater end
  } //build end
} // class end