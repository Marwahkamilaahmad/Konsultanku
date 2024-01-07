import 'package:flutter/material.dart';
import 'package:konsultanku/pages/signup.dart';


// class MyHomePage extends StatefulWidget {
//  MyHomePage({Key? key, required this.title}) : super(key: key);

//  final String title;

//  @override
//  _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//  TextEditingController _usernameController = TextEditingController();
//  TextEditingController _passwordController = TextEditingController();

//  @override
//  Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                  labelText: 'Username',
//                  border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                  labelText: 'Password',
//                  border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                  // Handle login functionality here
//                 },
//                 child: Text('Sign In'),
//               ),
//               SizedBox(height: 16),
//               TextButton(
//                 onPressed: () {
//                  // Handle forgot password functionality here
//                 },
//                 child: Text('Forgot Your Password?'),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => SignUpPage()));
//                 },
//                 child: Text('Sign Up'),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.purple, // Set background color to purple
//                  onPrimary: Colors.white, 
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//  }
// }


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle login functionality here
                    },
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Handle forgot password functionality here
                    },
                    child: Text('Forgot Your Password?'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
