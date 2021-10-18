import 'dart:typed_data';

import 'package:rxdart/rxdart.dart';

class DisplayPicturePageBloc {
  Uint8List imageCrop;
  BehaviorSubject<Uint8List> subject;

  DisplayPicturePageBloc({
    this.imageCrop,
  }) {
    subject = new BehaviorSubject<Uint8List>.seeded(this.imageCrop);
    setVisible(false);
  }

  Stream<Uint8List> get imageCropStream => subject.stream;

  void setimageCrop(Uint8List imageCrop) => subject.sink.add(imageCrop);

  BehaviorSubject<bool> _setVisible = BehaviorSubject<bool>();

  Stream<bool> get getVisible => _setVisible.stream;

  void setVisible(bool isVisible) {
    _setVisible.sink.add(isVisible);
  }

  void dispose() {
    subject.close();
    _setVisible.close();
  }
}
