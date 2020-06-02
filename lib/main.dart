import 'package:flutter/material.dart';
import './screens/greet.dart';

void main() {
  runApp(new MaterialApp(
    theme: ThemeData.dark(),
    debugShowCheckedModeBanner: false,
    title: "Greet App",
    home: GreetApp(),
  ));
}
