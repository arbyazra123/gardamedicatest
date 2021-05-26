class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  // static final RegExp _passwordRegExp = RegExp(
  //   r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  // );

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    return password.length>0;
  }
  static isValidPhoneNumber(String phoneNum) {
    return phoneNum.length>0;
  }
  static isValid(String value,{int limiter=0}) {
    return value.length>limiter;
  }
}
