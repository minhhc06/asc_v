import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/utils/BaseBloc.dart';

class LoginBloc extends BaseBloc {
  BehaviorSubject<bool> _setIsInvisiblePassword = BehaviorSubject<bool>();

  Stream<bool> get getIsInvisiblePassword => _setIsInvisiblePassword.stream;

  setIsInvisiblePassword(bool isInvisible) {
    _setIsInvisiblePassword.sink.add(isInvisible);
  }

  void dispose() {
    _setIsInvisiblePassword.close();
  }
}
