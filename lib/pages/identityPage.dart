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
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Row(
              children: [
                Text("Name:"),
                SizedBox(width: 5),
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
                        text: "ALDINI MUKTI",
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
                Text("ID: "),
                SizedBox(width: 24),
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
                        text: "019982",
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
                Text("Role: "),
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
                        text: "MSME",
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
                Text("Since"),
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
                        text: "23 juni 2024",
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
