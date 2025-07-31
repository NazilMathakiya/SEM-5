import 'package:flutter/material.dart';

class p10_1 extends StatelessWidget {
  const p10_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Lab 10_1")),backgroundColor: Colors.grey,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            task(task:"task1",checked: true),
            task(task:"task2"),
            task(task:"task3",checked: true),
            task(task:"task4"),
          ],
        ),
      ),
    );
  }
}
Widget task({required String? task, bool checked=false}){
  return ListTile(
    title: Text(task!),
    trailing: Checkbox(value: checked, onChanged: (value){}),
  );
}