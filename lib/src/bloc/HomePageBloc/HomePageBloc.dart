import 'package:rxdart/rxdart.dart';

class HomePageBloc {
  HomePageBloc() {
    setIndexNavigationBar(0);
  }

  BehaviorSubject<int> _setIndexNavigationBar = BehaviorSubject<int>();

  Stream<int> get getIndexNavigationBar => _setIndexNavigationBar.stream;

  setIndexNavigationBar(int index) {
    _setIndexNavigationBar.sink.add(index);
  }

  BehaviorSubject<String> _setAvatar = BehaviorSubject<String>();

  Stream<String> get getAvatar => _setAvatar.stream;

  setAvatar(String avatar) {
    _setAvatar.sink.add(avatar);
  }

  BehaviorSubject<String> _setFullName = BehaviorSubject<String>();

  Stream<String> get getFullName => _setFullName.stream;

  setFullName(String fullName) {
    _setFullName.sink.add(fullName);
  }

  void dispose() {
    _setFullName.close();
    _setAvatar.close();
    _setIndexNavigationBar.close();
  }
}
