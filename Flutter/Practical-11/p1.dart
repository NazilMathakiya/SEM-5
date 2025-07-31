import 'package:flutter/material.dart';
class lab11_1 extends StatefulWidget {
  const lab11_1({super.key});

  @override
  State<lab11_1> createState() => _lab11_1State();
}

class _lab11_1State extends State<lab11_1> {
  List<int> num =[101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List"),),
      body: ListView(
      children: num.map((e) {
        return ListTile(title: Text("$e"),);
      },).toList()

      ),
    );
  }
}
