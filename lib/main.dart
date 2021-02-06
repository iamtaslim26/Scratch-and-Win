import 'package:ScratchAndWin/HomePage.dart';
import 'package:flutter/material.dart';

void main(){

runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Scratch And Win Game",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(

        primarySwatch: Colors.lightBlue,
      ),
      home: HomePage(),
      
    );
  }
}