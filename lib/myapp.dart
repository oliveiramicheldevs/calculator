import 'package:flutter/material.dart';

import 'screens/calculator.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator()
    );
  }
}