import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/OptionLeaveModel.dart';

class DropDownBloc{
  BehaviorSubject<OptionLeaveModel> _setOptionLeaveModel = BehaviorSubject<OptionLeaveModel>();
  Stream<OptionLeaveModel> get getOptionLeaveModel => _setOptionLeaveModel.stream;

  Future<void> setOptionLeaveModel(OptionLeaveModel model) {
    _setOptionLeaveModel.sink.add(model);
  }
}