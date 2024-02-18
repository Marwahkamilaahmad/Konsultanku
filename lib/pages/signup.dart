import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konsultanku/main.dart';
import 'package:konsultanku/pages/loginpage.dart';
import 'package:http/http.dart' as http;
import 'package:konsultanku/pages/signup2.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool clickedMSME = false;
  bool clickedStud = false;
  final _formKey = GlobalKey<FormState>();
  String? _role = "",
      _email = "",
      _username = "",
      _password = "",
      _phone_number = "";

  void RegisterUser() async {
    Map<String, dynamic> registrationData = {
      "email": _email,
      "name": _username,
      "phone_number": _phone_number,
      "password": _password,
    };

    var response = await http.post(
        Uri.parse("http://localhost:8080/api/v1/auth/register"),
        body: registrationData);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage()),
      );
    } else {
      print("Registration failed. Status code: ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(101, 98, 253, 1),
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
                          color: const Color.fromARGB(255, 98, 98, 98),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        padding: const EdgeInsets.all(8.0),
                                        onPressed: () {
                                          !clickedStud
                                              ? setState(() {
                                                  clickedMSME = !clickedMSME;
                                                })
                                              : false;
                                        },
                                        child: Text("I'm a msme"),
                                        shape: OutlineInputBorder(
                                          borderSide: clickedMSME
                                              ? BorderSide(
                                                  color: Colors.blue.shade900,
                                                  width: 2)
                                              : BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MaterialButton(
                                        onPressed: () {
                                          !clickedMSME
                                              ? setState(() {
                                                  clickedStud = !clickedStud;
                                                })
                                              : false;
                                        },
                                        child: Text("I'm a student"),
                                        shape: OutlineInputBorder(
                                          borderSide: clickedStud &&
                                                  !clickedMSME
                                              ? BorderSide(
                                                  color: Colors.blue.shade900,
                                                  width: 2)
                                              : BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == "") {
                                    return 'Please enter your phone';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _phone_number = value;
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
                                    Color.fromRGBO(101, 98, 253, 1),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    if (clickedMSME) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignUpPage2("msme")),
                                      );
                                    }
                                    if (clickedStud) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignUpPage2("student")),
                                        );
                                      }
                                  }

                                  //   RegisterUser();
                                  //   _formKey.currentState!.save();
                                  // }
                                },
                                child: Text(
                                  'Continue',
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
