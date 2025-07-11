import 'package:flutter/material.dart';

class lab8_2 extends StatelessWidget {
  const lab8_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          shopping(image: "https://img-prd-pim.poorvika.com/product/Samsung-galaxy-s25-5g-navy-256gb-12gb-ram-Front-Back-View.png" ,
              title: "S25 Ultra",
              subtitle:"Best Flagship Phone",
              count: "2"
          ),
          shopping(image: "https://www.istudiobyspvi.com/cdn/shop/files/iPhone_15_Green_PDP_Image_Position-1__GBEN_5b84b0a1-7256-45b5-b42a-6b84e4c917ad.jpg?v=1718115339&width=823" ,
              title: "Iphone 15",
              subtitle:"Best Phone",
              count: "2"
          )
        ],
      ),
    ),
    );
  }
}
Card shopping({required image,required String title,String subtitle="no subtitle",String count="1"})
{
  return Card(
    child: Row(
      children: [
        Container(
          child: Image.network(image),
          height: 150,
          width: 150,
        ),
        Column(
          children: [
            Text(title, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Text(subtitle,style: TextStyle(fontSize: 15),),
            SizedBox(height: 80,),
            Row(
              children: [
                ElevatedButton(onPressed: () {}, child: Text("-"),style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), padding: EdgeInsets.all(10)
                ),),
                Text("$count"),
                ElevatedButton(onPressed: () {}, child: Text("+"),style: ElevatedButton.styleFrom(
                    shape: CircleBorder(), padding: EdgeInsets.all(10)

                ),),
                Icon(Icons.delete)
              ],
            )
          ],
        ),

      ],
    ),
  );
}
