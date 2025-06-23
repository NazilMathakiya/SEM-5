// 4.3 W.A.P. to divide the vertical space of the screen into 3 different equal parts with different colors. (A)

import 'package:flutter/material.dart';
import 'package:project_flutter/%5Bflutter%5Dlab_04/lab-04%20manual.dart';

class Vertical extends StatelessWidget {
  const Vertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Container(color: Colors.yellowAccent)),
          Expanded(child: Container(color: Colors.black87)),
          Expanded(child: Container(color: Colors.yellowAccent)),
        ],
      ),
    );
  }
}

//import 'dart:ui';
//import 'package:flutter/material.dart';
//
// import '[flutter]lab_04/4.2.dart';
// import '[flutter]lab_04/4.3.dart';
// import '[flutter]lab_04/4.4.dart';
//
// void main()
// {
//   runApp(const MyApp());
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Vertical(),
//     );
//   }
// }