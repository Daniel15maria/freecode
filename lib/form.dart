import 'package:flutter/material.dart';

class form extends StatefulWidget {
  const form({super.key});

  @override
  State<form> createState() => _FormPageState();
}

class _FormPageState extends State<form> {
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';

  final _formkey = GlobalKey<FormState>();

  /////////////--------------functions---------------////
  void trysubmit() {
    final isvalid = _formkey.currentState!.validate();
    if (isvalid) {
      _submitForm();
      _formkey.currentState!.reset(); // Reset the form fields
      setState(() {
        firstname = '';
        lastname = '';
        email = '';
        password = '';
      });
    } else {
      print('error');
    }
  }

  bool isPasswordStrong(String password) {
    // Adjust criteria as needed
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= 8;

    return hasUppercase &&
        hasLowercase &&
        hasDigits &&
        hasSpecialCharacters &&
        hasMinLength;
  }

  void _submitForm() {
    _formkey.currentState!.save();
    // Perform the desired actions with the form data
    print('First Name: $firstname');
    print('Last Name: $lastname');
    print('Email: $email');
    print('Password: $password');
    // Show a success message or navigate to another page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Form",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "First Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        key: ValueKey('firstname'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'First name should not be empty';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          firstname = value.toString();
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Last Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        key: ValueKey('lastname'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Last name should not be empty';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          lastname = value.toString();
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        key: ValueKey('email'),
                        validator: (value) {
                          if (value == null || !value.contains('@')) {
                            return 'Enter a proper email id';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          email = value.toString();
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        key: ValueKey('password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          } else if (!isPasswordStrong(value)) {
                            return 'Password should be at least 8 characters long and include uppercase letters, lowercase letters, digits, and special characters.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value.toString();
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          trysubmit();
                        },
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: form()));
