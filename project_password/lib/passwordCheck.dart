double passwordCheck(String password) {

  // If password field is empty, then the bar should be empty
  if(password.isEmpty){
    return 0.0;
}

  // RED (WEAK) <=20% of the bar:
  // Letters a-zA-Z  OR  numbers only  AND  characters<8

  // YELLOW (OK) <50% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  characters>=8

  // GREEN (STRONG) <=85% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  1 special character  AND  ch.>=8

  // DARK GREEN (UNBEATABLE) >85% of the bar:
  // Letters a-zA-Z  AND  numbers  AND  >1 special characters  AND  ch.>=10

  return 1.0;
}