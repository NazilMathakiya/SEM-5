//4.4 . W.A.P. to divide the whole screen into 9 (equal size and different size) with different colors. (B)

import 'package:flutter/material.dart';
import 'package:project_flutter/%5Bflutter%5Dlab_04/lab-04%20manual.dart';

class Four extends StatelessWidget {
  const Four({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 2, child: Container(color: Colors.yellowAccent)),
                Expanded(child: Container(color: Colors.lightGreen)),
                Expanded(child: Container(color: Colors.pink)),
              ],
            ),
          ),
//--------------------------------------------------------------------------------------------
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.purple)),
                Expanded(flex: 2, child: Container(color: Colors.black87)),
                Expanded(child: Container(color: Colors.blue)),
              ],
            ),
          ),
//--------------------------------------------------------------------------------------------
          Expanded(
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.brown)),
                Expanded(child: Container(color: Colors.cyanAccent)),
                Expanded(flex: 2, child: Container(color: Colors.deepOrange)),
              ],
            ),
          ),
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
//       home: Four(),
//     );
//   }
// }
