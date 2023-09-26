import 'package:flutter/material.dart';
import 'CalcScreen.dart';


void main(){

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: Calc(),
    );
  }
}
