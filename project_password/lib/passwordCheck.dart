import 'package:project_password/main.dart';

double passwordCheck(String password) {

  // For debug purposes (check that things are behaving nicely)
  //print('The password is: $password');
  //print('hasUppercase: $hasUppercase hasLowercase: $hasLowercase hasNumber: $hasNumber hasSpecialChar: $hasSpecialChar');

  int minLength = 4;
  int goodLength = 8;
  int godLength = 12;

  // If password field is empty or short length, then the bar should be empty
  if(password.length < minLength) {
    acceptedLength = false;
    return 0.0;
  }

  // 'At least 8 characters' turns green
  if(password.length >= goodLength){
    acceptedLength = true;
  }

  // RED (WEAK) <=20% of the bar:
  // Letters only
  if (RegExp(r'^[a-zA-Z]*$').hasMatch(password)) {
    hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    hasNumber = false;
    hasSpecialChar = false;
    return weak;
  }
  // Letters & numbers but too short
  else if(RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password) && password.length < goodLength) {
    hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    hasNumber = RegExp(r'[0-9]').hasMatch(password);
    acceptedLength = false;
    return weak;
  }
  // YELLOW (GOOD) <=50% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  length>=8
  else if (RegExp(r'^[a-zA-Z0-9]*$').hasMatch(password) && password.length >= goodLength) {
    hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    hasNumber = RegExp(r'[0-9]').hasMatch(password);
    return good;
  }
  // GREEN (STRONG) <=85% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  common special characters  AND  ch.>=8
  else if (RegExp(r'^[a-zA-Z0-9\-_!?]*$').hasMatch(password) && password.length >= goodLength) {
    hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    hasNumber = RegExp(r'[0-9]').hasMatch(password);
    hasSpecialChar = RegExp(r'[\-_!?]').hasMatch(password);
    return strong;
  }
  // DARK GREEN (UNBEATABLE) 100% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  more special characters  AND  ch.>=12
  else if (RegExp(r'^[a-zA-Z0-9"#%&()*+,:;<=>^]*$').hasMatch(password) &&  password.length >= godLength) {
    hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    hasNumber = RegExp(r'[0-9]').hasMatch(password);
    hasSpecialChar = RegExp(r'[\-_!?"#%&()*+,:;<=>^]').hasMatch(password);
    return unbeatable;
  }
  // If length < 8
  else {
    return weak;
  }
}