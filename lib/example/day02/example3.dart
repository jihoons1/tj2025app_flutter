// lib/example/day02/example3.dart

import 'package:flutter/material.dart';

void main() { runApp(MyApp() ); }


// [*] 상태(state)가 있는 위젯

class MyApp extends StatefulWidget { // 1.상태가 있는 위젯 상속 받기
  // (1) extends StatefulWidget 위젯으로 부터 상속받는다.
  // (2) 상태를 관리할 하위 위젯들을 등록
  // * 하위 위젯들은 extends State< 상위위젯 >
  // 등록할 위젯명 createState() => 등록할위젯명();
  MyAppState createState() => MyAppState();
}

// 2. 상태를 사용하는 위젯 선언
class MyAppState extends State< MyApp >{
  int count = 0 ; // 변수
  // =++++++++++++ 상태변경 / 재랜더링 +++++++++++
  // setState( () {새로운값; ) );
  void increment () { setState( () { count++; } ); print(count); }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("상단제목"),),
        body: Center(
          child: Column(
            children: [
              Text("count : ${count} "),
              Text("count : ${count - 1} "),
              Text("count : ${count - 2} "),
              Text("count : ${count - 3} "),
              Text("count : ${count - 4} "),
              Text("count : ${count - 5} "),
              TextButton(onPressed: increment, child: Text("버튼"))

            ],
           ),
      ), )
    );
  }
}