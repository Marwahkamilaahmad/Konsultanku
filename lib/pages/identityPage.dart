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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Text(
              "Nama",
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 25),
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
          SizedBox(width: 24),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 25),
            child: Text("ID"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
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
         
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Text("Role "),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
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
         
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 25),
            child: Text("Since"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
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
         
          // UMKM ONLY
          // Padding(
          //   padding: EdgeInsets.symmetric( horizontal: 25),
          //   child: Text("Nama pemilik Usaha"),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          //   child: SizedBox(
          //     height: 40,
          //     child: TextField(
          //       textAlignVertical: TextAlignVertical.top,
          //       readOnly: true,
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //       ),
          //       style: TextStyle(
          //         fontSize: 14.0,
          //         // Set other styles as needed
          //       ),
          //       controller: TextEditingController(
          //         text: "Yati",
          //       ),
          //     ),
          //   ),
          // ),
         
          // Padding(
          //   padding: EdgeInsets.symmetric( horizontal: 25),
          //   child: Text("Nama Usaha"),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          //   child: SizedBox(
          //     height: 40,
          //     child: TextField(
          //       textAlignVertical: TextAlignVertical.top,
          //       readOnly: true,
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //       ),
          //       style: TextStyle(
          //         fontSize: 14.0,
          //         // Set other styles as needed
          //       ),
          //       controller: TextEditingController(
          //         text: "Beeds Bracelets",
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric( horizontal: 25),
          //   child: Text("Jenis Usaha"),
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
          //   child: SizedBox(
          //     height: 40,
          //     child: TextField(
          //       textAlignVertical: TextAlignVertical.top,
          //       readOnly: true,
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //       ),
          //       style: TextStyle(
          //         fontSize: 14.0,
          //         // Set other styles as needed
          //       ),
          //       controller: TextEditingController(
          //         text: "Accecories",
          //       ),
          //     ),
          //   ),
          // ),


          // STUDENT
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 25),
            child: Text("Asal Universitas"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
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
                  text: "Universitas Negeri Malang",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 25),
            child: Text("Jurusan"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
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
                  text: "Pend Kimia",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric( horizontal: 25),
            child: Text("Angkatan"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
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
                  text: "2022",
                ),
              ),
            ),
          ),






        ],
      ),
    );
  }
}
