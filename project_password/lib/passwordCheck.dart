import 'package:project_password/main.dart';

double passwordCheck(String password) {


  // RED (WEAK) <=20% of the bar:
  // Letters a-zA-Z  OR  numbers only  AND  characters<8
  if (password.length < 3 && password.length > 1) {
    return weak;
  }
  // YELLOW (OK) <=50% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  characters>=8
  else if (password.length < 5 && password.length > 2) {
    return good;
  }
  // GREEN (STRONG) <=85% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  1 special character  AND  ch.>=8
  else if (password.length < 7 && password.length > 4) {
    return strong;
  }
  // DARK GREEN (UNBEATABLE) 100% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  >=1 special characters  AND  ch.>=12
  else if (password.length > 6) {
    return unbeatable;
  }
  // If password field is empty, then the bar should be empty
  else {
    return 0.0;
  }
}