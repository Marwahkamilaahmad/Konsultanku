import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Rectangle-30.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Progress',
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Progress Konsultasi",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText:
                                              'sampai manakah progress anda ?',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == "") {
                                          return 'enter your progress';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'detail progress',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == "") {
                                          return 'enter your progress';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                  SizedBox(height: 32),
                                  Text(
                                    "Feedback Konsultasi",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'student username',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == "") {
                                          return 'enter your freedback';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'feedback student',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == "") {
                                          return 'enter your freedback';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText: 'rating student',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == "") {
                                          return '';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                  SizedBox(height: 32),
                                  Text(
                                    "Feedback Aplikasi",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText:
                                              'apakah anda terbantu dengan Konsultanku ?',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == "") {
                                          return '';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          labelText:
                                              'apa yang bisa kami tingkatkan ?',
                                          border: OutlineInputBorder()),
                                      validator: (value) {
                                        if (value == "") {
                                          return '';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {},
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    height: 35,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                          Color.fromRGBO(101, 98, 253, 1),
                                        ),
                                      ),
                                      onPressed: () {
                                        if (_formKey.currentState!
                                            .validate()) {}
                                      },
                                      child: Text(
                                        'tambahkan',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // --------------------------------------------------
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        )
      ],
    ));
  }
}
