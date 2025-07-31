import 'package:flutter/material.dart';
class p9_2 extends StatefulWidget {
  const p9_2({super.key});

  @override
  State<p9_2> createState() => _p9_2State();
}

class _p9_2State extends State<p9_2> {

  Widget quoteCard({required String qoute,
    String? author}){
    return Card(
      color: Colors.white60,
      child: ListTile(
        title: Text(qoute,style: TextStyle(
          fontWeight: FontWeight.bold,),),
        subtitle: Text(
            "author:${author} "),
        trailing: IconButton(onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("copy to clipboard")));
        }, icon: Icon(Icons.copy)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Qoute card"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              quoteCard(qoute: "rtfryhftugftguaec",author: "abc"),
              quoteCard(qoute: "rtfryhftugftguaec",author: "abc"),
              quoteCard(qoute: "rtfryhftugftguaec",author: "abc"),

            ],
          ),
        ),
      ),
    );
  }
}

