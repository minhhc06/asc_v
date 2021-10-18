import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/repository/api/model/FormModel/FormModel.dart';

class FormPageBloc {
  BehaviorSubject<List<FormModel>> subjectListForm =
      BehaviorSubject<List<FormModel>>();

  Stream<List<FormModel>> get getListFom => subjectListForm.stream;

  setListForm(List<FormModel> fullName) {
    subjectListForm.sink.add(fullName);
  }

  void dispose() {
    subjectListForm.close();
  }
}
