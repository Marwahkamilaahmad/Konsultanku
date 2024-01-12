import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konsultanku/main.dart';
import 'package:konsultanku/pages/loginpage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? _role = "", _email = "", _username = "", _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 64, 204),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Register Konsultanku',
                        style: GoogleFonts.inter(
                          fontSize: 24.0,
                          color: const Color(0xFF15224F),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 45,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Sign Up As',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == "") {
                                    return 'enter your role';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _role = value;
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              alignment: Alignment.center,
                              height: 45,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value;
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              alignment: Alignment.center,
                              height: 45,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Username',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _username = value;
                                },
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              alignment: Alignment.center,
                              height: 45,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _password = value;
                                },
                                obscureText: true,
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              height: 35,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll(10),
                                  backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 41, 76, 193),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage()),
                                  );
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    // TODO: Perform sign up action
                                  }
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
