import 'package:flutter/material.dart';

class lab14_1 extends StatelessWidget {
  const lab14_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: PageController(
          viewportFraction: 0.8,
        ),
        children: [
          buildCard(title: "Page 1", bgcolor: Colors.green),
          buildCard(title: "Page 2", bgcolor: Colors.blue),
          buildCard(title: "Page 3", bgcolor: Colors.black),
          buildCard(title: "Page 4", bgcolor: Colors.red),
          buildCard(title: "Page 5", bgcolor: Colors.pink),
          buildCard(title: "Page 6", bgcolor: Colors.yellow),
          buildCard(title: "Page 7", bgcolor: Colors.purple),
          buildCard(title: "Page 8", bgcolor: Colors.orange),
          buildCard(title: "Page 9", bgcolor: Colors.brown),
          buildCard(title: "Page 10", bgcolor: Colors.cyan),
        ],
      ),
    );
  }
}

Widget buildCard({required String title, required bgcolor}) {
  return Card(
    color: bgcolor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: Text(title),
    ),
  );
}
