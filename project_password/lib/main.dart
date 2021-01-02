import 'package:flutter/material.dart';
import 'package:project_password/passwordCheck.dart';

// GLOBAL CONSTANTS - values of 'barValue' which passwordCheck.dart also uses
const double weak = 40.0;
const double good = 100.0;
const double strong = 175.0;
const double unbeatable = 200.0;

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
  String passwordStrength = '';

  Color barColor = Color(0xFFD6D6D6); // grey[350]
  Color barColorDefault = Color(0xFFD6D6D6); // grey[350]
  Color barColorRed = Color(0xFFF44336); // red
  Color barColorYellow = Color(0xFFFFFF00); // yellowAccent (yellow : EB3B)
  Color barColorGreen = Color(0xFF76FF03); // lightGreenAccent
  Color barColorDarkGreen = Color(0xFF1B5E20); // green[900]

  double barValue = 0.0;

  bool buttonEnabled = false;

  @override
  Widget build(BuildContext context) {
    // Enable/disable button
    var _onPressed;
    if (buttonEnabled) {
      _onPressed = () {};
    }

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
                    padding: EdgeInsets.fromLTRB(15.0, 5.0, 0, 5.0),
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
                    padding: EdgeInsets.fromLTRB(15.0, 0, 0, 5.0),
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
                          setState(() {
                            // CALL passwordCheck & GET barValue
                            // 'barValue' determines the strength of the password
                            // Depending on 'barValue', change the appearance
                            // & colors of text & strength-bar
                            barValue = passwordCheck(passwordInput);

                            // DEFAULT / NO INPUT YET
                            if (barValue == 0.0) {
                              barColor = barColorDefault;
                              passwordStrength = '';
                              buttonEnabled = false;
                            }

                            // WEAK
                            if (barValue == weak) {
                              // Change barColor
                              barColor = barColorRed;
                              // Change passwordStrength
                              passwordStrength = 'Weak';
                              // Change buttonEnabled true/false
                              // if >OK → enable button, else false
                              buttonEnabled = false;
                            }

                            // GOOD
                            if (barValue == good) {
                              // Change barColor
                              barColor = barColorYellow;
                              // Change passwordStrength
                              passwordStrength = 'Good';
                              // Change buttonEnabled true/false
                              // if >OK → enable button, else false
                              buttonEnabled = true;
                            }

                            // STRONG
                            if (barValue == strong) {
                              // Change barColor
                              barColor = barColorGreen;
                              // Change passwordStrength
                              passwordStrength = 'Strong';
                              // Change buttonEnabled true/false
                              // if >OK → enable button, else false
                              buttonEnabled = true;
                            }

                            // UNBEATABLE
                            if (barValue == unbeatable) {
                              // Change barColor
                              barColor = barColorDarkGreen;
                              // Change passwordStrength
                              passwordStrength = 'Unbeatable';
                              // Change buttonEnabled true/false
                              // if >OK → enable button, else false
                              buttonEnabled = true;
                            }
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                          Container(
                            width: barValue,
                            height: 15.0,
                            decoration: BoxDecoration(
                              color: barColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                        alignment: Alignment.topLeft,
                        //color: Colors.blue[100],

                        child: Text(
                          passwordStrength,
                          style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            color: barColor,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0.0, 0.0),
                                blurRadius: 1.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 2.0,
                                color: Color.fromARGB(100, 0, 0, 255),
                              ),
                            ],
                          ),

                        /*
                        Text(
                          passwordStrength,
                          style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 2.0,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2.0
                                ..color = Colors.grey[600]),
                        ),
                        ),*/
                        ),
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
                      onPressed: _onPressed,
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
