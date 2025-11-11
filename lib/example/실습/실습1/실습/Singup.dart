// lib/example/실습/실습1/실습/Singup.dart

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Singup extends StatefulWidget {
  @override
  State<Singup> createState() => SingupState();
}

class SingupState extends State<Singup> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  dynamic loglist = [];

  // POST (등록)
  void singsave() async {
    print(title.text);
    final obj = {'ptitle': title.text, 'pcontent': content.text};
    print(obj);
    try {
      final dio = Dio();
      final respon =
      await dio.post("http://10.41.222.46:8080/api/practice", data: obj);
      final data = respon.data;
      print("등록 성공: $data");
      logAll(); // 등록 후 목록 갱신
    } catch (e) {
      print("등록 중 오류: $e");
    }
  }

  // GET (전체 조회)
  void logAll() async {
    try {
      final dio = Dio();
      final respon = await dio.get("http://10.41.222.46:8080/api/practice/list");
      final data = respon.data;
      print("조회 결과: $data");
      setState(() {
        loglist = data;
      });
    } catch (e) {
      print("조회 오류: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    logAll(); // 최초 화면 로드 시 목록 불러오기
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TODO 등록 페이지")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(labelText: "제목 입력"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: content,
              decoration: const InputDecoration(labelText: "내용 입력"),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: singsave,
                child: const Text("등록하기"),
              ),
            ),
            const Divider(height: 30),
            const Text(
              "등록된 목록",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: loglist.length,
                itemBuilder: (context, index) {
                  final todo = loglist[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.task_alt),
                      title: Text(todo['ptitle'] ?? ""),
                      subtitle: Text(todo['pcontent'] ?? ""),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
