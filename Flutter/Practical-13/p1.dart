import 'package:flutter/material.dart';

class lab12_2 extends StatelessWidget {
   lab12_2({super.key});
  final List<Map<String, String>>Movies=[
  {'name': 'One Piece',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkabxRR3T-HdTkNdM6863GZAtafflGPmyRYA&s'},
  {'name': 'One Piece',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkabxRR3T-HdTkNdM6863GZAtafflGPmyRYA&s'},
  {'name': 'One Piece',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkabxRR3T-HdTkNdM6863GZAtafflGPmyRYA&s'},
  {'name': 'One Piece',
    'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkabxRR3T-HdTkNdM6863GZAtafflGPmyRYA&s'},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Poster"),),
      body: GridView.builder(
        itemCount: Movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index){
          var movie=Movies[index];
          return Card(
            child: Column(
              children: [
                Expanded(child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.network(movie['image']!,fit: BoxFit.cover,width: double.infinity,),

                )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
          child: Text(
          movie['name']!,
          overflow: TextOverflow.ellipsis,
          ),)
              ],
            ),
          );
        },
      ),
    );
  }
}
