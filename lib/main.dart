import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/pages/stopwatch_page.dart';

void main() {
  // Change statusBar color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated stopwatch',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const StopwatchPage(),
    );
  }
}
