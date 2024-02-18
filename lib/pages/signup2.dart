import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konsultanku/main.dart';
import 'package:konsultanku/pages/loginpage.dart';
import 'package:http/http.dart' as http;

class SignUpPage2 extends StatefulWidget {
  final String role;
  SignUpPage2(this.role);

  @override
  _SignUpPageState2 createState() => _SignUpPageState2();
}

class _SignUpPageState2 extends State<SignUpPage2> {
  final _formKey = GlobalKey<FormState>();
  String? _owner_name = "",
      _mse_name = "",
      _mse_type = "",
      _mse_since = "",
      _student_name = "",
      _tag_name = "",
      _date_of_birth = "",
      _major = "",
      _university = "",
      _class_of = "";

  void RegisterUser() async {
    Map<String, dynamic> registrationMsme = {
      "owner_name": _owner_name,
      "mse_name": _mse_name,
      "mse_type": _mse_type,
      "mse_since": _mse_since,
    };
    Map<String, dynamic> registrationStudent = {
      "student_name": _student_name,
      "tag_name": _tag_name,
      "date_of_birth": _date_of_birth,
      "major": _major,
      "university": _university,
      "class_of": _class_of,
    };

    if (widget.role == "student") {
      var response = await http.post(
          Uri.parse("http://localhost:8080/api/v1/student/registration"),
          body: registrationStudent);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        print("Registration failed. Status code: ${response.statusCode}");
      }
    }

    if (widget.role == "msme") {
      var response = await http.post(
          Uri.parse("http://localhost:8080/api/v1/mse/registration"),
          body: registrationMsme);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        print("Registration failed. Status code: ${response.statusCode}");
      }
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
                      if (widget.role == "msme")
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
                                      labelText: 'owner name',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _owner_name = value;
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
                                      labelText: 'mse name',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your mse name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _mse_name = value;
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
                                      labelText: 'mse type',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your mse type';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _mse_type = value;
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
                                      labelText: 'since',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _mse_since = value;
                                  },
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
                                      RegisterUser();
                                      _formKey.currentState!.save();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage()),
                                      );
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
                      // ---------------------------------------------------
                      if (widget.role == "student")
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
                                      labelText: 'student name',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _student_name = value;
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
                                      labelText: 'tag name',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your tag name';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _tag_name = value;
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
                                      labelText: 'date of birth',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your birth';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _date_of_birth = value;
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
                                      labelText: 'major',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your major type';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _major = value;
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
                                      labelText: 'university',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return 'enter your university';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _university = value;
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
                                      labelText: 'class of',
                                      border: OutlineInputBorder()),
                                  validator: (value) {
                                    if (value == "") {
                                      return '';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    _class_of = value;
                                  },
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
                                      RegisterUser();
                                      _formKey.currentState!.save();
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyHomePage()),
                                    );
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
