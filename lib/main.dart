import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zarkony_task/feature/presentation/view/common/botoom_navigation_controller.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
        Controller()
      // CartPage(),
      // MyHomePage(),
    );
  }
}