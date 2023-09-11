import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  String name = '';
  String email = '';
  String phone = '';
  String gender = '';
  String country = '';
  String state = '';
  String city = '';


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }


  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }


  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      
      print('Name: $name');
      print('Email: $email');
      print('Phone: $phone');
      print('Gender: $gender');
      print('Country: $country');
      print('State: $state');
      print('City: $city');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: validateName,
                onSaved: (value) => name = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: validateEmail,
                onSaved: (value) => email = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                validator: validatePhone,
                onSaved: (value) => phone = value ?? '',
              ),
             
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
