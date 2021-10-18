import 'package:vnu_app/src/utils/word/WorkValidator.dart';

class LoginValidation {
  String isUsername(String username) {
    if (username.isEmpty || username == null)
      return WordValidator.userNameBlank;
    return null;
  }

  String isPassword(String password) {
    if (password.isEmpty || password == null)
      return WordValidator.passworkBlank;
    return null;
  }
}
