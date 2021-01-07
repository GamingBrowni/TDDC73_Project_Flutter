/* AUTHOR: Ivanna Maric -- GamingBrowni @ GitHub
*  TDDC73 - Interactive programming
*
*  Project: Account Registration
*
* */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_accountreg/success_page.dart';

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

  // VARIABLES, BOOLS, STRINGS

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  bool checkboxValue = false;

  String _name, _password, _confirmPassword, _email, _year, _month, _day;

  List monthList = [
    "MM", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"
  ];

  List dayList = [
    "DD", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21",
    "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Account Registration',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // --- ENTER NAME -------------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    'Enter name',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 70, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))],
                    validator: (String name) {
                      if (name.isEmpty) {
                        return 'Must enter name';
                      }
                      return null;
                    },
                    onSaved: (String name) {
                      _name = name;
                    },
                    decoration: InputDecoration(
                      hintText: 'Name',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),

                // --- ENTER PASSWORD ---------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('Enter password'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 70, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (passwordInput) {
                      setState(() {
                        _password = passwordInput;
                      });
                    },
                    validator: (_password) {
                      if (_password.isEmpty) {
                        return 'Must enter password';
                      }
                      return null;
                    },
                    onSaved: (String passwordInput) {
                      _password = passwordInput;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),

                // --- CONFIRM PASSWORD -------------------------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('Confirm password'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 70, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (passwordInput) {
                      setState(() {
                        _confirmPassword = passwordInput;
                      });
                    },
                    validator: (confirmPassword) {
                      if (_confirmPassword != _password) {
                        return 'Does not match!';
                      }
                      return null;
                    },
                    onSaved: (String passwordInput) {
                      _confirmPassword = passwordInput;
                    },
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),

                // --- ENTER EMAIL [validation: example@example.com] --------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('Enter E-mail'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 70, 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (String email) {
                      if (email.isEmpty) {
                        return 'Must enter E-mail';
                      }
                      if (!RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,5}').hasMatch(email)) {
                        return 'Please use format: example@example.com';
                      }
                      return null;
                    },
                    onSaved: (String email) {
                      _email = email;
                    },
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),

                // --- ENTER DATE OF BIRTH [YYYY/MM/DD] ---------------------
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text('Date of birth'),
                ),

                Row(
                  children: [
                    SizedBox(width: 10.0),
                    Text(
                      'Year - 19XX   20XX',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 45.0),
                    Text(
                      'Month',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 70.0),
                    Text(
                      'Day',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                // --- YEAR, YYYY -------------------------------------------
                Row(
                  children: [
                    // YEAR, YYYY
                    // if yearInput != valid → "Invalid year"
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0, 8.0, 3.0),
                      child: Container(
                        width: 120.0,
                        height: 70.0,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(4)],
                          // Set 4 values only, first: 19XX or 200X
                          validator: (String year) {
                            if (year.isEmpty) {
                              return 'Enter valid year';
                            }
                            // if _day begins with 19 or 20
                            if (RegExp('^19|20').stringMatch(year) == null) {
                              return 'Invalid year';
                            }
                            return null;
                          },
                          onSaved: (String year) {
                            _year = year;
                          },
                          decoration: InputDecoration(
                            hintText: 'YYYY',
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10.0),

                    // --- MONTH, MM ----------------------------------------
                    // if monthInput == MM → Invalid month
                    Padding(
                      padding: EdgeInsets.fromLTRB(7.0, 0, 7.0, 0),
                      child: Container(
                        width: 90.0,
                        height: 70.0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            hint: Text('MM'),
                            //isExpanded: true,
                            iconSize: 15,
                            value: _month,
                            onChanged: (month) {
                              setState(() {
                                _month = month;
                                print(_month);
                              });
                            },
                            onSaved: (month) {
                              _month = month;
                            },
                            items: monthList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                            validator: (_month) {
                              if (_month == 'MM') {
                                return 'Enter month';
                              }
                              if (_month == null) {
                                return 'Enter month';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // --- DAY, DD ------------------------------------------
                    // February: 1-29 valid
                    // April, June, September, November: 1-30 valid
                    Padding(
                      padding: EdgeInsets.fromLTRB(7.0, 0, 7.0, 0),
                      child: Container(
                        width: 85.0,
                        height: 70.0,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField(
                            hint: Text('DD'),
                            //isExpanded: true,
                            iconSize: 15,
                            value: _day,
                            onChanged: (day) {
                              setState(() {
                                _day = day;
                                print(_day);
                              });
                            },
                            onSaved: (day) {
                              _day = day;
                            },
                            items: dayList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                            validator: (_day) {
                              if (_day == 'DD') {
                                return 'Enter day';
                              }
                              if (_day == null) {
                                return 'Enter day';
                              }
                              // if _month == '02' → day != 30, 31
                              if (_month == '02' && RegExp('^30|31').stringMatch(_day) != null) {
                                return 'Invalid';
                              }
                              // if _month == '04, 06, 09, 11' → day != 31
                              if (_day == '31' && RegExp('^04|06|09|11').stringMatch(_month) != null) {
                                return 'Invalid';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // --- ACCEPTED TERMS CONDITION CHECK -------------------------
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 6, 5),
                      child: Checkbox(
                        value: checkboxValue,
                        onChanged: (bool value) {
                          setState(() {
                            checkboxValue = value;
                          });
                        },
                      ),
                    ),
                    Text('I solemnly swear that I am up to no good.'),
                  ],
                ),

                // -- BUTTON [validates if inputs are correct] ----------------
                Padding(
                  padding: const EdgeInsets.only(left: 130.0),
                  child: SizedBox(
                    width: 120.0,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          // input correct
                          if (checkboxValue) {
                            print('Successful!');
                            // Change page
                            Navigator.push(context, new MaterialPageRoute(builder: (context) => SuccessPage()));
                          }
                          return;
                        } else {
                          // input incorrect
                          print('Unsuccessful!');
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      textColor: Colors.white,
                      child: Text('Register!'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
