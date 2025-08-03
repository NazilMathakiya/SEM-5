import 'package:flutter/material.dart';
import 'package:nazil_210/lab_16/p2.dart';

class Login extends StatefulWidget {

  Login({super.key});

  @override
  State<Login> createState() => _SixOneState();
}

class _SixOneState extends State<Login> {
  bool showText = true;

  final formKey = GlobalKey<FormState>();

  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Login screen",
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Colors.green),



      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            width: 500,
            child: Column(
              children: [
                SizedBox(height: 10,),
                Text("Email Address"),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final emailPattern = RegExp(r'^[\w.-]+@[\w]+\.+[\w]{2,4}$');
                    if (value == null || value.isEmpty)
                    {
                      return "Enter Email Address";
                    }
                    else if (!emailPattern.hasMatch(value))
                    {
                      return "Enter Proper Email Address";
                    }
                    else
                    {
                      return null;
                    }
                  },
                ),
                Text("Password"),
                TextFormField(
                  obscureText: showText,
                  controller: _password,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed:(){
                      setState((){
                        showText = !showText;
                      });
                    }, icon:Icon(showText?Icons.visibility_off:Icons. visibility)),
                    labelText: "Password",
                    hintText: "Enter Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    final passwordPattern = RegExp(
                      r"^(?=.[a-z])(?=.[A-Z])(?=.\d)(?=.[@$!%?&])[A-Za-z\d@$!%?&]{8,}$",
                    );
                    if (value == null || value.isEmpty)
                    {
                      return "Please enter password";
                    }
                    else if (value.length < 8)
                    {
                      return "Password must be of 8 characters or more";
                    }
                    else if (!passwordPattern.hasMatch(value))
                    {
                      return "invalid format";
                    }
                    else
                    {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 10,),


                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("Form Succesfully submited");
                    }
                  },
                  child: Text("Submit"),
                ),                SizedBox(height: 10,),

                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register(),));
                }, child: Text("Register")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}