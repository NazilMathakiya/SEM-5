import 'package:flutter/material.dart';

class lab7_3 extends StatelessWidget {
  const lab7_3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/birthday.jpg"),
          Positioned(
            top:320,
            left: 390,
            child: Text(
              "hello!!",
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
