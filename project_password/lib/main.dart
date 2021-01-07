/* AUTHOR: Ivanna Maric -- GamingBrowni @ GitHub
*  TDDC73 - Interactive programming
*
*  Project: Password strength meter
*  NOTE: This is like the least effective way of doing this, fyi.
* */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_password/passwordCheck.dart';

// Global bools - used to change colors of the password criteria
bool hasUppercase = false;
bool hasLowercase = false;
bool hasNumber = false;
bool hasSpecialChar = false;
bool acceptedLength = false;

// GLOBAL CONSTANTS - values of 'barValue' which passwordCheck.dart also uses
const double weak = 40.0;         // 20% of the bar
const double good = 100.0;        // 50% of the bar
const double strong = 170.0;      // 85% of the bar
const double unbeatable = 200.0;  // 100% of the bar

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
  String passwordStrength = 'Too short';

  // Colors of the bar:
  Color barColor = Color(0xFFD6D6D6); // grey[350]
  Color barColorDefault = Color(0xFFD6D6D6); // grey[350]
  Color barColorRed = Color(0xFFF44336); // red
  Color barColorYellow = Color(0xFFFFFF00); // yellowAccent (yellow : EB3B)
  Color barColorGreen = Color(0xFF76FF03); // lightGreenAccent
  Color barColorDarkGreen = Color(0xFF1B5E20); // green[900]

  // Colors of the password criteria:
  Color defaultColor = Color(0xFFD6D6D6);
  Color acceptedColor = Color(0xFF1B5E20);
  Color letterColor = Color(0xFFD6D6D6);
  Color charColor = Color(0xFFD6D6D6);
  Color numberColor = Color(0xFFD6D6D6);
  Color specCharColor = Color(0xFFD6D6D6);

  double barValue = 0.0;

  // 'Password passed!' button enabler
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
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\-_!?"#%&()*+,:;<=>^]'))],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (passwordInput) {
                          setState(() {
                            // CALL 'passwordCheck' & GET 'barValue'
                            // 'barValue' determines the strength of the password
                            // Depending on 'barValue', change the appearance
                            // & colors of text, strength-bar & criteria:
                            barValue = passwordCheck(passwordInput);

                            // For debugging purposes
                            //print('barValue is: $barValue');

                            // DEFAULT / NO INPUT YET -------------------------
                            if (barValue == 0.0) {
                              barColor = barColorDefault;
                              passwordStrength = 'Too short';
                              buttonEnabled = false;

                              // Change color of the password criteria text:
                              letterColor = defaultColor;
                              charColor = defaultColor;
                              numberColor = defaultColor;
                              specCharColor = defaultColor;

                              if(hasUppercase && hasLowercase){
                                letterColor = acceptedColor;
                              }
                              if(hasNumber){
                                numberColor = acceptedColor;
                              }
                              if(hasSpecialChar){
                                specCharColor = acceptedColor;
                              }
                              if(!acceptedLength){
                                charColor = defaultColor;
                              }
                            }

                            // WEAK -------------------------------------------
                            if (barValue == weak) {
                              // Change barColor
                              barColor = barColorRed;
                              // Change passwordStrength
                              passwordStrength = 'Weak';
                              // Change buttonEnabled true/false
                              // if >=GOOD → enable button, else false
                              buttonEnabled = false;

                              // PASSWORD CRITERIA COLORS:
                              if(hasUppercase && hasLowercase){
                                letterColor = acceptedColor;
                              }
                              if(hasNumber){
                                numberColor = acceptedColor;
                              }
                              if(hasSpecialChar){
                                specCharColor = acceptedColor;
                              }
                              if(acceptedLength){
                                charColor = acceptedColor;
                              }
                              else {
                                charColor = defaultColor;
                              }
                            }

                            // GOOD -------------------------------------------
                            if (barValue == good) {
                              // Change barColor
                              barColor = barColorYellow;
                              // Change passwordStrength
                              passwordStrength = 'Good';
                              // Change buttonEnabled true/false
                              // if >=GOOD → enable button, else false
                              buttonEnabled = true;

                              // PASSWORD CRITERIA COLORS:
                              charColor = acceptedColor;
                              if(hasUppercase && hasLowercase){
                                letterColor = acceptedColor;
                              }
                              if(hasNumber){
                                numberColor = acceptedColor;
                              }
                              if(hasSpecialChar){
                                specCharColor = acceptedColor;
                              }
                            }

                            // STRONG -----------------------------------------
                            if (barValue == strong) {
                              // Change barColor
                              barColor = barColorGreen;
                              // Change passwordStrength
                              passwordStrength = 'Strong';
                              // Change buttonEnabled true/false
                              // if >=GOOD → enable button, else false
                              buttonEnabled = true;

                              // PASSWORD CRITERIA COLORS:
                              charColor = acceptedColor;
                              if(hasUppercase && hasLowercase){
                                letterColor = acceptedColor;
                              }
                              if(hasNumber){
                                numberColor = acceptedColor;
                              }
                              if(hasSpecialChar){
                                specCharColor = acceptedColor;
                              }
                            }

                            // UNBEATABLE -------------------------------------
                            if (barValue == unbeatable) {
                              // Change barColor
                              barColor = barColorDarkGreen;
                              // Change passwordStrength
                              passwordStrength = 'Unbeatable';
                              // Change buttonEnabled true/false
                              // if >=GOOD → enable button, else false
                              buttonEnabled = true;

                              // PASSWORD CRITERIA COLORS:
                              charColor = acceptedColor;
                              if(hasUppercase && hasLowercase){
                                letterColor = acceptedColor;
                              }
                              if(hasNumber){
                                numberColor = acceptedColor;
                              }
                              if(hasSpecialChar){
                                specCharColor = acceptedColor;
                              }
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
                        ),
                      ),
                    ],
                  ),

                  // --- HINT -------------------------------------------------
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text(
                              'Your password should contain:',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8.0),

                            Text(
                              'At least 8 characters',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: charColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              'Uppercase & lowercase letters',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: letterColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              'At least 1 number',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: numberColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              'Special characters: - _ ! ? " # %  & ( ) * + , : ; < = > ^',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: specCharColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50.0),

                  // --- BUTTON -----------------------------------------------
                  // IF PASSWORD >= GOOD → ENABLE BUTTON
                  RaisedButton(
                    onPressed: _onPressed,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(0.0),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      //alignment: Alignment.center,
                      color: Colors.green,
                      child: Text('Password passed!'),
                      //color: Colors.blue[100],
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
