import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String password;
  Color barColor = Color(0xFFD6D6D6); // grey[350]
  Color barColorRed = Color(0xFFF44336); // red
  Color barColorYellow = Color(0xFFFFFF00); // yellowAccent (yellow : EB3B)
  Color barColorGreen = Color(0xFF76FF03); // lightGreenAccent
  Color barColorDarkGreen = Color(0xFF1B5E20); // green[900]
  String passwordStrength = '';
  int barValue = 0;
  bool buttonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // APPBAR W. TITLE
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Password strength meter',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          SizedBox(height: 20.0),

          // --- PASSWORD -----------------------------------------------------
          Flexible(
            flex: 1,
            child: Container(
              //color: Colors.amberAccent,

              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
                    alignment: Alignment.topLeft,
                    //color: Colors.blue,
                    child: Text(
                      'Enter password:',
                          style: TextStyle(
                        fontSize: 16.0,
                    ),
                    ),
                  ),

                  // -- PASSWORD INPUT ---
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.fromLTRB(10.0, 0, 0, 5.0),
                    //color: Colors.greenAccent,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 200.0,
                        maxWidth: 200.0,
                        minHeight: 35.0,
                        maxHeight: 35.0,
                      ),
                      child: TextField(
                        maxLines: 1,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),

                        onChanged: (passwordInput) {
                          setState((){
                            // Return barValue

                              // Change barColor

                              // Change passwordStrength

                              // if >OK → enable button

                          });
                        },
                        ),
                      ),
                  ),

                  // --- STRENGTH METER ---------------------------------------
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                        alignment: Alignment.topLeft,
                        //color: Colors.blue[100],
                        child: Text(
                          'Strength:',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // --- STRENGTH METER ---
                      Stack(
                        children: [
                          Container(
                            width: 200.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                          Container(
                            width: 40.0,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: barColor,
                              borderRadius: BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 50.0),

                  // --- BUTTON ---
                  // IF PASSWORD >= OK → ENABLE BUTTON
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 0, 5.0),
                    alignment: Alignment.center,
                    //color: Colors.blue[100],
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('Password passed!'),
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


