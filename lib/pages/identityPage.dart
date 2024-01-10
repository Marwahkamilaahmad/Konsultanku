import 'package:flutter/material.dart';

class IdentityPage extends StatefulWidget {
  @override
  _IdentityPageState createState() => _IdentityPageState();
}

class _IdentityPageState extends State<IdentityPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Row(
              children: [
                Text("Nama: "),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        // Set other styles as needed
                      ),
                      controller: TextEditingController(
                        text: "John Doe",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Row(
              children: [
                Text("Nama: "),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        // Set other styles as needed
                      ),
                      controller: TextEditingController(
                        text: "John Doe",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Row(
              children: [
                Text("Nama: "),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        // Set other styles as needed
                      ),
                      controller: TextEditingController(
                        text: "John Doe",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Row(
              children: [
                Text("Nama: "),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        // Set other styles as needed
                      ),
                      controller: TextEditingController(
                        text: "John Doe",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Row(
              children: [
                Text("Nama: "),
                SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                        // Set other styles as needed
                      ),
                      controller: TextEditingController(
                        text: "John Doe",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
