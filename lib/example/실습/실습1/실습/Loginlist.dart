// lib/example/실습/실습1/실습/Loginlist.dart

import 'package:flutter/material.dart';

class Loginlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("로그인 리스트 페이지")),
      body: const Center(
        child: Text(
          "로그인 리스트 화면입니다.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
