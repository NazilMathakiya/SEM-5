import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EntryScreen extends StatefulWidget {
  @override
  _EntryScreenState createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();



  final String apiUrl =
      'https://68b95c176aaf059a5b574211.mockapi.io/contact_details';

  Future<void> submitData() async {
    if (_formKey.currentState!.validate()) {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {
              'name': nameController.text,
              'email': emailController.text,
              'message': messageController.text,
            }),
      );

      if (response.statusCode == 201 ||
          response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text("Data submitted successfully!")),
        );

        nameController.clear();
        emailController.clear();
        messageController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Text("Failed to submit data.")),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""
          "Contact us Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildTextField(
                  controller: nameController,
                  label: "Name"),
              buildTextField(
                  controller: emailController,
                  label: "email"),
              buildTextField(
                  controller: messageController,
                  label: "message"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitData,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
 



  Widget buildTextField(
      {required TextEditingController controller,
        required String label,
        bool readOnly = false,
        VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green)
            )
        ),
        onTap: onTap,
        validator: (value) =>
        value == null || value.isEmpty ? 'Enter $label' : null,
      ),
    );
  }
}
