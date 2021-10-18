import 'package:rxdart/rxdart.dart';

class MultiSelectModelBloc<T> {
  List<T> listData;
  BehaviorSubject<List<T>> subjectListData;
  MultiSelectModelBloc({
    this.listData,
  }) {
    subjectListData = new BehaviorSubject<List<T>>.seeded(this.listData);
  }

  Stream<List<T>> get listDataStream => subjectListData.stream;

  void setListData(List<T> list) => subjectListData.sink.add(list);

  void dispose() {
    subjectListData.close();
  }
}
