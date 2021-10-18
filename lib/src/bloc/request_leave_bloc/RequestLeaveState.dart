import 'dart:io';

import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';

class RequestLeaveState {
  DateTime date;
  DateTime dateTwo;
  List<File> files;
  UserModel receiver;
  UserModel handOver;
  String session;
  ReasonModel reasonModel;
  RequestLeaveState({
    this.date,
    this.files,
    this.handOver,
    this.reasonModel,
    this.receiver,
    this.dateTwo,
    this.session,
  });
}
