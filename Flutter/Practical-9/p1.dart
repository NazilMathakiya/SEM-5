import 'package:flutter/material.dart';

class p9_1 extends StatelessWidget {
  const p9_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text("A feedback form typically includes sections for general",style: TextStyle(fontSize: 20,),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button1(butt: Icon(Icons.sentiment_satisfied,size: 30,color: Colors.green,)),
                  button1(butt: Icon(Icons.sentiment_neutral,size: 30,color: Colors.purple,)),
                  button1(butt: Icon(Icons.sentiment_dissatisfied,size: 30,color: Colors.redAccent,))
                ],
              ),
              SizedBox(height: 30,),
              Text("Give me Ratting",style: TextStyle(fontSize: 20)),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  button1(butt: Text("1",style: TextStyle(fontSize: 30),)),
                  button1(butt: Text("2",style: TextStyle(fontSize: 30))),
                  button1(butt: Text("3",style: TextStyle(fontSize: 30))),
                  button1(butt: Text("4",style: TextStyle(fontSize: 30))),
                  button1(butt: Text("5",style: TextStyle(fontSize: 30))),
                ],
              ),
              SizedBox(height: 30,),
              Text("Your feedback",style: TextStyle(fontSize: 20)),
              SizedBox(height: 30,),
              TextField(
                maxLines: 5,
                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submited")));}, child: Text("Submit"))
            ],
            
          ),
        ),
      ),

    );
  }
}

Widget button1({required butt}){
  return TextButton(onPressed: (){

  },
      style: TextButton.styleFrom(shape:CircleBorder()),
      child: butt);
}
