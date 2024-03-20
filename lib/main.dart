import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 디버그 관련 모드 배너 On Off
      theme: ThemeData.dark(),
      title: '회원 관련 테스팅',
      home: const HmoePage(),
    );
  }
}
