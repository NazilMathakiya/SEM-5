import 'package:flutter/material.dart';

class lab12_1 extends StatelessWidget {
  const lab12_1({super.key});


  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>>Contacts=[
      {'name': 'Dhoni', 'Initial': 'D'},
      {'name': 'Virat', 'Initial': 'V'},
      {'name': 'Jadeja', 'Initial': 'J'},
      {'name': 'Bumrah', 'Initial': 'B'},
    ];
    return Scaffold(
      appBar:AppBar(title: Text("Contact List"),),
      body: ListView.builder(
        itemCount: Contacts.length,
          itemBuilder: (context, i){
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(Contacts[i]["Initial"]!),),
              title: Text(Contacts[i]["name"]!),
              trailing: Icon(Icons.phone),
            ),
          );
          }),
    );
  }
}
