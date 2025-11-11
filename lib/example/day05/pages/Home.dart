// lib/example/day05/Home.dart

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();
class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home>{
  @override // 1. 위젯이 최초로 열렸을때 실행되는 함수
  void initState() {
    findAll();

  }
  List< dynamic > todoList = []; // 가져온 todo 목록
  void findAll() async{ // 2. Spring 서버로 부터 todo 목록 가져오기
    try{

      final response = await dio.get("http://10.41.222.46:8080/api/todo");
      final data = await response.data;
      setState(() {
        todoList = data;
      });
      print(data);
    }catch(e) { print(e); }
  }
  void delete(int id) async{ // 4. Spring 서버로 부터 if 개별 삭제
    try{
      final response = await dio.delete("http://10.41.222.46:8080/api/todo?id=${id}");
      final data = await response.data;
      if( data == true ) { findAll(); } // 4. 삭제 성공하면 할일 목록 재호출
    }catch(e) {print(e); }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( title: Text("TODO"),),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ListView( // Expanded 세로 스크롤 제공
              // children: [], // 반복문을 이용하여 ListView에 여러개 Cart 대입
              // todoList.map( (반복변수명) {return 반환위젯() } ).tiList();
              children : todoList.map( (todo){ // map 반복문은 dynamic 타입
                return Card( child: ListTile(
                  title: Text(todo['title']), // Cart 제목 부분
                  subtitle: Text( todo['content']),
                  trailing: Row( // Row : 가로 배치 위젯
                    mainAxisSize: MainAxisSize.min, // Row 배치 에서 오른쪽 버튼(위젯)들의 넓이를 자동으로 최소 크기 할당
                    children: [
                      IconButton(onPressed: (){ delete(todo['id'] ); }, icon: Icon(Icons.delete ) ),

                      IconButton(
                          onPressed: (){ Navigator.pushNamed(context, "/update" , arguments: todo["id"] ); },
                          icon: Icon(Icons.edit ) ),

                      IconButton( // Navigator.pushNamed( context{현위젯} , "{이동할경로}", argyments : {매개변수} );
                          onPressed: (){Navigator.pushNamed(context, "/detail" , arguments: todo['id'] ); } ,
                          icon: Icon(Icons.info ) ),
                    ],
                     ),
                ),);
              }).toList(), // map end
            )),
          ],
        ),
      ),
    );
  }
}
