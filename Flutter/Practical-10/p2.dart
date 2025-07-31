import 'package:flutter/material.dart';

class p10_2 extends StatelessWidget {
  const p10_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          width: 500,
          height: 400,
          child: Card(

            child: Column(
              children: [
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.album,size: 100,),

                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Music",style: TextStyle(fontSize: 30),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text("Music"),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                LinearProgressIndicator(value: 0.7,borderRadius: BorderRadius.circular(10),minHeight: 5,color: Colors.lightBlue,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.skip_previous,size: 30,),),
                    IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow_outlined,size: 30)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.skip_next,size: 30))
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
