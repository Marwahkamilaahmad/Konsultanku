import 'package:flutter/material.dart';
import 'package:konsultanku/main.dart';
import 'package:konsultanku/pages/signup.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(101, 98, 253, 1),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(),
            ),
            Expanded(
              flex: 9,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 35,
                        child: Image.asset(
                          
                          '/images/konsultanku-1.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Text(
                      //   'Login Konsultanku',
                      //   style: GoogleFonts.inter(
                      //     fontSize: 24.0,
                      //     color: const Color.fromARGB(255, 98, 98, 98),
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _usernameController,
                          style: GoogleFonts.inter(
                            fontSize: 16.0,
                            color: const Color(0xFF15224F),
                          ),
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        alignment: Alignment.center,
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: _passwordController,
                          style: GoogleFonts.inter(
                            fontSize: 16.0,
                            color: const Color(0xFF15224F),
                          ),
                          maxLines: 1,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        height: 35,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(5),
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(101, 98, 253, 1),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NavigateApp()),
                            );
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("have'nt registered yet ?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()),
                              );
                            },
                            child: Text('Sign up here'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
