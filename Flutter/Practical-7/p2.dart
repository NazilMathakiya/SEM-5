import 'package:flutter/material.dart';

class lab7_2 extends StatelessWidget {
  const lab7_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/photo-1526779259212-939e64788e3c.jpg"),
          Positioned(
            top:0,
            left: 300,
            child: Text(
              "hello",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
