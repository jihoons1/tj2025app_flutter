// lib/example/day02/example2.dart

import 'package:flutter/material.dart';

// [2] 최초로 실행할 위젯 , main 함수 안에서 runApp 함수 이용한 위젯 실행
// 상단바에서 실행할 환경 선택 ( web 또는 mobile )
void main() { runApp(MyApp() ); }
// [1] 상태가 없는 위젯 = 재 랜더링 없을때 사용


class MyApp extends StatelessWidget{ // [ 1-1] StatelessWidget 상속 받는다.@override
  // [ 1-3] 이벤트
  int count = 0;
  void increment () { count++; print(count); } // 함수
  // [ 1-2 ] build 함수 재구현
  Widget build(BuildContext context) {
    return MaterialApp( home: Scaffold(
      appBar: AppBar(title: Text("상단제목"),) , // 상단바
      body: Center( child: Column(children: [
        Text("세로 정렬 첫번쨰 위젯") ,
        Text("세로 정렬 두번째 위젯") ,
        TextButton(onPressed: increment , child: Text("세로정렬 세번쨰 위젯"), ) ,
        // 리액트 <button onClick = { increment } > 세로 정렬 세번째 위젯 </button>
        Text("세로 정렬 네번째 위젯4 Count : ${count} ")
      ],),)
    ) , );
  }
}