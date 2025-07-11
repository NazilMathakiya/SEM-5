import 'package:flutter/material.dart';

class p8_1 extends StatelessWidget {
  const p8_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child: Container(
            width: 450,
            height: 700,
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Text("0" , style: TextStyle(fontSize: 30),),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [button(text: "Ac")],),
                  
                      Column(children: [button(text: "()")],),
                  
                      Column(children: [button(text: "%")],),
                  
                      Column(children: [button(text: "/")],),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [button(text: "7")],),
          
                    Column(children: [button(text: "8")],),
          
                    Column(children: [button(text: "9")],),
          
                    Column(children: [button(text: "X")],),
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [button(text: "4")],),
          
                    Column(children: [button(text: "5")],),
          
                    Column(children: [button(text: "6")],),
          
                    Column(children: [button(text: "-")],),
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [button(text: "1")],),
          
                    Column(children: [button(text: "2")],),
          
                    Column(children: [button(text: "3")],),
          
                    Column(children: [button(text: "+")],),
                  ],
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(children: [button(text: "00")],),
          
                    Column(children: [button(text: "0")],),
          
                    Column(children: [button(text: ".")],),
          
                    Column(children: [button(text: "=")],),
                  ],
                )
              ],
          
          
            ),
          ),
        ),
      ),

    );
  }
}

ElevatedButton button({required text,bg=Colors.white})
{
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        shape: CircleBorder(),
        padding: EdgeInsets.all(36)

    ),
    onPressed: (){},
    child: Text(text, style:TextStyle(fontSize: 40) ,),
  );
}


