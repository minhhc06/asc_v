import 'dart:io';

import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/InfoUserRetirement.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserDetailModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class ReasonTime {
  final Session session;
  final DateTime time;

  ReasonTime({this.session, this.time});
  bool isEmpty() => session != null && time != null;
}

class RequestLeaveModelState {
  final UserModel receiver;
  final List<ReasonModel> listReasonModel;
  final List<UserModel> listReceipientCarbonCopy;
  final String title;
  final List<ReasonTime> listReasonTime;
  final UserModel handOver;
  final String note;
  final List<File> files;

  RequestLeaveModelState({
    this.listReasonModel,
    this.note,
    this.receiver,
    this.listReceipientCarbonCopy,
    this.title,
    this.listReasonTime,
    this.handOver,
    this.files,
  });
  factory RequestLeaveModelState.clone(
          RequestLeaveModelState requestLeaveModelState) =>
      RequestLeaveModelState(
        files: requestLeaveModelState.files,
        handOver: requestLeaveModelState.handOver,
        listReasonTime: requestLeaveModelState.listReasonTime,
        listReceipientCarbonCopy:
            requestLeaveModelState.listReceipientCarbonCopy,
        note: requestLeaveModelState.note,
        receiver: requestLeaveModelState.receiver,
        title: requestLeaveModelState.title,
        listReasonModel: requestLeaveModelState.listReasonModel,
      );
  factory RequestLeaveModelState.cloneAndUpdate({
    RequestLeaveModelState requestLeaveModelState,
    RequestLeaveModelState requestLeaveModelStateUpdate,
  }) =>
      RequestLeaveModelState(
        files: requestLeaveModelStateUpdate?.files ??
            requestLeaveModelState?.files,
        handOver: requestLeaveModelStateUpdate?.handOver ??
            requestLeaveModelState?.handOver,
        listReasonTime: requestLeaveModelStateUpdate?.listReasonTime ??
            requestLeaveModelState?.listReasonTime,
        listReceipientCarbonCopy:
            requestLeaveModelStateUpdate?.listReceipientCarbonCopy ??
                requestLeaveModelState?.listReceipientCarbonCopy,
        note:
            requestLeaveModelStateUpdate?.note ?? requestLeaveModelState?.note,
        receiver: requestLeaveModelStateUpdate?.receiver ??
            requestLeaveModelState?.receiver,
        title: requestLeaveModelStateUpdate?.title ??
            requestLeaveModelState?.title,
        listReasonModel: requestLeaveModelStateUpdate?.listReasonModel ??
            requestLeaveModelState?.listReasonModel,
      );
}

class RequestResignationModelState {
  final UserModel receiver;
  final String title;
  final UserModel handOver;
  final DateTime endDay;
  final DateTime finishDay;
  final String note;
  final List<File> files;

  RequestResignationModelState({
    this.note,
    this.receiver,
    this.title,
    this.handOver,
    this.files,
    this.endDay,
    this.finishDay,
  });
  factory RequestResignationModelState.clone(
          RequestResignationModelState modelClone) =>
      RequestResignationModelState(
        files: modelClone.files,
        handOver: modelClone.handOver,
        note: modelClone.note,
        receiver: modelClone.receiver,
        title: modelClone.title,
        endDay: modelClone.endDay,
        finishDay: modelClone.finishDay,
      );
  factory RequestResignationModelState.cloneAndUpdate({
    RequestResignationModelState modelClone,
    RequestResignationModelState modelUpdate,
  }) =>
      RequestResignationModelState(
        files: modelUpdate?.files ?? modelClone?.files,
        handOver: modelUpdate?.handOver ?? modelClone?.handOver,
        note: modelUpdate?.note ?? modelClone?.note,
        receiver: modelUpdate?.receiver ?? modelClone?.receiver,
        title: modelUpdate?.title ?? modelClone?.title,
        endDay: modelUpdate?.endDay ?? modelClone?.endDay,
        finishDay: modelUpdate?.finishDay ?? modelClone?.finishDay,
      );
}

class RequestRetirementModelState {
  final UserModel receiver;
  final String title;
  final UserModel handOver;
  final DateTime endDay;
  final String note;
  final String retirementChange;
  final List<File> files;
  final InfoUserRetirement infoUserRetirementHandOver;
  final UserDetailModel userDetailModelReceiver;
  final InfoUserRetirement infoUserRetirementReceiver;

  RequestRetirementModelState({
    this.infoUserRetirementHandOver,
    this.userDetailModelReceiver,
    this.infoUserRetirementReceiver,
    this.retirementChange,
    this.note,
    this.receiver,
    this.title,
    this.handOver,
    this.files,
    this.endDay,
  });
  factory RequestRetirementModelState.clone(
          RequestRetirementModelState modelClone) =>
      RequestRetirementModelState(
        files: modelClone.files,
        handOver: modelClone.handOver,
        note: modelClone.note,
        receiver: modelClone.receiver,
        title: modelClone.title,
        endDay: modelClone.endDay,
        retirementChange: modelClone.retirementChange,
        infoUserRetirementHandOver: modelClone.infoUserRetirementHandOver,
        infoUserRetirementReceiver: modelClone.infoUserRetirementReceiver,
        userDetailModelReceiver: modelClone.userDetailModelReceiver,
      );
  factory RequestRetirementModelState.cloneAndUpdate({
    RequestRetirementModelState modelClone,
    RequestRetirementModelState modelUpdate,
  }) =>
      RequestRetirementModelState(
        files: modelUpdate?.files ?? modelClone?.files,
        handOver: modelUpdate?.handOver ?? modelClone?.handOver,
        note: modelUpdate?.note ?? modelClone?.note,
        receiver: modelUpdate?.receiver ?? modelClone?.receiver,
        title: modelUpdate?.title ?? modelClone?.title,
        endDay: modelUpdate?.endDay ?? modelClone?.endDay,
        infoUserRetirementHandOver: modelUpdate?.infoUserRetirementHandOver ??
            modelClone?.infoUserRetirementHandOver,
        infoUserRetirementReceiver: modelUpdate?.infoUserRetirementReceiver ??
            modelClone?.infoUserRetirementReceiver,
        userDetailModelReceiver: modelUpdate?.userDetailModelReceiver ??
            modelClone?.userDetailModelReceiver,
        retirementChange:
            modelUpdate?.retirementChange ?? modelClone?.retirementChange,
      );
}

class RequestLeaveBlocV2 {
  RequestLeaveModelState requestLeaveModelState;
  RequestResignationModelState requestResignationModelState;
  RequestRetirementModelState requestRetirementModelState;
  BehaviorSubject<RequestRetirementModelState>
      subjectRequestRetirementModelState =
      new BehaviorSubject<RequestRetirementModelState>();

  Stream<RequestRetirementModelState> get requestRetirementModelStateStream =>
      subjectRequestRetirementModelState.stream;

  void setRequestRetirementModelState(RequestRetirementModelState model) =>
      subjectRequestRetirementModelState.sink.add(model);

  BehaviorSubject<RequestResignationModelState>
      subjectRequestResignationModelState =
      new BehaviorSubject<RequestResignationModelState>();

  Stream<RequestResignationModelState> get requestResignationModelStateStream =>
      subjectRequestResignationModelState.stream;

  void setRequestResignationModelState(RequestResignationModelState model) =>
      subjectRequestResignationModelState.sink.add(model);

  BehaviorSubject<RequestLeaveModelState> subjectRequestLeaveModelState =
      new BehaviorSubject<RequestLeaveModelState>();

  Stream<RequestLeaveModelState> get requestLeaveModelStateStream =>
      subjectRequestLeaveModelState.stream;

  void setRequestLeaveModelState(
          RequestLeaveModelState requestLeaveModelState) =>
      subjectRequestLeaveModelState.sink.add(requestLeaveModelState);

  BehaviorSubject<List<UserModel>> subjectListReceiver =
      new BehaviorSubject<List<UserModel>>();
  void setListReceiver(List<UserModel> user) =>
      subjectListReceiver.sink.add(user);

  BehaviorSubject<List<UserModel>> subjectListHandOver =
      new BehaviorSubject<List<UserModel>>();
  void setListHandOver(List<UserModel> user) =>
      subjectListHandOver.sink.add(user);

  BehaviorSubject<List<ReasonModel>> subjectListReason =
      new BehaviorSubject<List<ReasonModel>>();
  void setListReason(List<ReasonModel> list) =>
      subjectListReason.sink.add(list);

  void dispose() {
    subjectRequestLeaveModelState.close();
    subjectRequestResignationModelState.close();
    subjectRequestRetirementModelState.close();

    subjectListReceiver.close();
    subjectListHandOver.close();
    subjectListReason.close();
  }
}
