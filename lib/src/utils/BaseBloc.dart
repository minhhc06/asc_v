import 'package:rxdart/rxdart.dart';

class BaseBloc {
  BehaviorSubject<bool> _setIsLoading = BehaviorSubject<bool>();
  Stream<bool> get getIsLoading => _setIsLoading.stream;

  setIsLoading(bool isLoading) {
    _setIsLoading.sink.add(isLoading);
  }

  BehaviorSubject<bool> _setVisibleFloatButton = BehaviorSubject<bool>();

  Stream<bool> get getVisibleFloatButton => _setVisibleFloatButton.stream;

  void setVisibleFloatButton(bool isVisible) {
    _setVisibleFloatButton.sink.add(isVisible);
  }

  BehaviorSubject<DateTime> _setDateTime = BehaviorSubject<DateTime>();

  Stream<DateTime> get getDateTime => _setDateTime.stream;

  void setDateTime(DateTime value) {
    _setDateTime.sink.add(value);
  }
}
