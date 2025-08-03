import 'package:flutter/material.dart';

import 'p1.dart';
enum gender {Male,Female}
class Register extends StatefulWidget {
  const Register({super.key});


  @override
  State<Register> createState() => _loginState();
}

TextEditingController email = TextEditingController();
TextEditingController pass = TextEditingController();
String? selectedcity;
gender? selectedgender;
GlobalKey<FormState> formkey = GlobalKey();
List<String> hobbies=['playing','writing','Learning'];
List<String> selectedhobbies=[];

List<String> cities = ["Rajkot", "Morbi", "Jamnagar", "Wankaner"];

class _loginState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Register screen",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.green),
      body:Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Plese enter email";
                    }
                    if (!RegExp(r'^[\w.]+@[\w]+\.[\w]{2,4}$').hasMatch(value)) {
                      return "Enter valid email";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Enter email ",
                    hintText: "Enter your email here",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  controller: pass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Plese enter password";
                    }
                    if (value.length <= 6) {
                      return "Enter valid minimun of length 6";
                    }
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Enter password ",
                      hintText: "Enter your password here",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      prefixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off_outlined))),
                )),
            SizedBox(height: 10,),
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "Select city",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                ),
              ),
              value: selectedcity,
              items: cities.map(
                    (e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                },
              ).toList(),
              onChanged: (value) {
                setState(() {
                  selectedcity = value!;
                });
              },
            ),
            Row(
              children: [
                Radio<gender>(value:gender.Male,
                  groupValue:selectedgender,
                  onChanged: (val){
                    setState(() {
                      selectedgender=val;
                    });
                  },
                ),
                Text("Male"),
                Radio<gender>(value:gender.Female ,
                  groupValue:selectedgender,
                  onChanged: (val){
                    setState(() {
                      selectedgender=val;
                    });
                  },
                ),
                Text("Female"),
              ],
            ),
            Column(
              children: hobbies.map((hobbie) {
                return CheckboxListTile(
                    title: Text(hobbie),
                    value: selectedhobbies.contains(hobbie),
                    onChanged:(bool? selected){
                      setState(() {
                        if(selected !)
                        {
                          selectedhobbies.add(hobbie);
                        }
                        else{
                          selectedhobbies.remove(hobbie);
                        }
                      });
                    });
              },).toList(),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    print(email.text);
                    print(pass.text);
                    // print(selectedcity);
                  }
                },
                child: Text("Sign up")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(),));
            }, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
