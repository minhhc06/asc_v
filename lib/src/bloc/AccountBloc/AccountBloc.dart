import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AccountBloc {
  BehaviorSubject<ImageProvider> _setImage = BehaviorSubject<ImageProvider>();

  Stream<ImageProvider> get getImage => _setImage.stream;

  void setImage(ImageProvider image) {
    _setImage.sink.add(image);
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
    _setImage.close();
  }
}
