import 'package:flutter/material.dart';

class lab7_1 extends StatelessWidget {
  const lab7_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lab7_1"),
      ),
      body: Center(
        child: Image.asset("assets/photo-1526779259212-939e64788e3c.jpg"),
      ),
    );
  }
}
