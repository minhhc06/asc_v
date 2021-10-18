import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveState.dart';
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/FilesResponseModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/RequestApiUpdateModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/UpdateFileApiModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/RequestListUserModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';
import 'package:vnu_app/src/repository/api/provider/ApiProvider.dart';
import 'package:vnu_app/src/repository/api/provider/request_leave_provider/RequestLeaveProvider.dart';
import 'package:vnu_app/src/utils/BaseBloc.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordErrorUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class RequestLeaveBloc extends BaseBloc with BaseComponent {
  List<File> files;
  DateTime date;
  DateTime dateTwo;

  UserModel receiver;
  UserModel handOver;
  String session;
  ReasonModel reasonModel;
  List<UserModel> listReceiver;
  List<UserModel> listHandOver;
  List<ReasonModel> listReasonModel;

  BehaviorSubject<DateTime> subjectDate = new BehaviorSubject<DateTime>();
  BehaviorSubject<DateTime> subjectDateTwo = new BehaviorSubject<DateTime>();
  BehaviorSubject<List<File>> subjectFiles;

  BehaviorSubject<UserModel> subject;
  BehaviorSubject<String> subjectSession;
  BehaviorSubject<UserModel> subjectHandOver;
  BehaviorSubject<ReasonModel> subjectReasonModel;
  BehaviorSubject<List<UserModel>> subjectListReceiver;
  BehaviorSubject<List<UserModel>> subjectListHandOver;
  BehaviorSubject<List<ReasonModel>> subjectListReason;

  RequestLeaveBloc({
    this.receiver,
    this.handOver,
    this.listReceiver,
    this.session,
    this.listReasonModel,
    this.reasonModel,
    this.files,
  }) {
    subjectFiles = new BehaviorSubject<List<File>>.seeded(this.files);

    subject = new BehaviorSubject<UserModel>.seeded(this.receiver);
    subjectSession = new BehaviorSubject<String>.seeded(this.session);
    subjectHandOver = new BehaviorSubject<UserModel>.seeded(this.handOver);
    subjectReasonModel =
        new BehaviorSubject<ReasonModel>.seeded(this.reasonModel);
    subjectListReason =
        new BehaviorSubject<List<ReasonModel>>.seeded(this.listReasonModel);
    subjectListHandOver = new BehaviorSubject<List<UserModel>>();
    subjectListReceiver =
        new BehaviorSubject<List<UserModel>>.seeded(this.listReceiver);
  }

  Stream<List<File>> get filesStream => subjectFiles.stream;

  Stream<DateTime> get dateStream => subjectDate.stream;

  Stream<DateTime> get dateTwoStream => subjectDateTwo.stream;

  Stream<RequestLeaveState> get requestLeaveStateStream => Rx.combineLatest6(
          filesStream,
          receiverStream,
          handOverStream,
          sessonStream,
          reasonStream,
          dateStream, (
        List<File> files,
        UserModel receiver,
        UserModel handOver,
        String session,
        ReasonModel reasonModel,
        DateTime date,
      ) {
        return RequestLeaveState(
          files: files,
          handOver: handOver,
          reasonModel: reasonModel,
          receiver: receiver,
          date: date,
          session: session,
          dateTwo: dateTwo,
        );
      });

  Stream<RequestLeaveState> get requestRequestResignationStateStream =>
      Rx.combineLatest5(filesStream, receiverStream, handOverStream, dateStream,
          dateTwoStream, (
        List<File> files,
        UserModel receiver,
        UserModel handOver,
        DateTime date,
        DateTime dateTwo,
      ) {
        return RequestLeaveState(
          files: files,
          handOver: handOver,
          receiver: receiver,
          date: date,
          dateTwo: dateTwo,
        );
      });

  Stream<RequestLeaveState> get requestRetirementStateStream =>
      Rx.combineLatest4(filesStream, receiverStream, handOverStream, dateStream,
          (
        List<File> files,
        UserModel receiver,
        UserModel handOver,
        DateTime date,
      ) {
        return RequestLeaveState(
          files: files,
          handOver: handOver,
          receiver: receiver,
          date: date,
        );
      });

  Stream<UserModel> get receiverStream => subject.stream;

  Stream<String> get sessonStream => subjectSession.stream;

  Stream<UserModel> get handOverStream => subjectHandOver.stream;

  Stream<ReasonModel> get reasonStream => subjectReasonModel.stream;

  Stream<List<UserModel>> get listReceiverStream => subjectListReceiver.stream;

  void setListReceiver(List<UserModel> receivers) =>
      subjectListReceiver.sink.add(receivers);

  Stream<List<UserModel>> get listHandOverStream => subjectListHandOver.stream;
  void setListHandOver(List<UserModel> handOvers) =>
      subjectListHandOver.sink.add(handOvers);

  Stream<List<ReasonModel>> get listReasonStream => subjectListReason.stream;

  void setFiles(List<File> files) => subjectFiles.sink.add(files);

  void setDate(DateTime date) => subjectDate.sink.add(date);

  void setDateTwo(DateTime date) => subjectDateTwo.sink.add(date);

  void setReceiver(UserModel receiver) => subject.sink.add(receiver);

  void setSession(String session) => subjectSession.sink.add(session);

  void setHandOver(UserModel handOver) => subjectHandOver.sink.add(handOver);

  void setReason(ReasonModel reasonModel) =>
      subjectReasonModel.sink.add(reasonModel);

  void setListReason(List<ReasonModel> reasons) =>
      subjectListReason.sink.add(reasons);

  BehaviorSubject<DetailPolicyPageModel> _setDetailPolicyPageModel =
      BehaviorSubject<DetailPolicyPageModel>();

  Stream<DetailPolicyPageModel> get getDetailPolicyPageModel =>
      _setDetailPolicyPageModel.stream;

  setDetailPolicyPageModel(DetailPolicyPageModel model) {
    _setDetailPolicyPageModel.sink.add(model);
  }

  BehaviorSubject<List<FilesResponseModel>> _setListFiles =
      BehaviorSubject<List<FilesResponseModel>>();

  Stream<List<FilesResponseModel>> get getListFiles => _setListFiles.stream;

  setListFiles(List<FilesResponseModel> list) {
    _setListFiles.sink.add(list);
  }

  fetchApiList({@required BuildContext context, int manHinh}) async {
    final request = RequestListUserModel(
      pageSize: 100,
      pageNumber: 1,
      sortName: 'Id',
      keyControl: "DONTU_003",
      sortByASC: false,
      manHinh: manHinh,
    );

    ResponseApiUtil result = await RequestLeaveProvider().fetchApiListProvider(
        context: context,
        domain: ConfigUnit().getHost(
          hostApi: HostApi.hrm,
        ),
        body: request.toJson(),
        url: '${ConfigUnit.receiverList}');
    switch (result.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        List<UserModel> listModel = [];
        json
            .decode(result.body)['${ConfigUnit.result}']
                ['${ConfigUnit.pagingItems}']['${ConfigUnit.items}']
            .forEach((v) {
          listModel.add(UserModel.fromJson(v));
        });
        setListReceiver(listModel);
        setListHandOver(listModel);

        Navigator.pop(context);
        break;

      default:
        Navigator.pop(context);
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SelectTypeLoginPage(),
          ),
        );
        break;
    }
  }

  updateFileBloc(
      {@required BuildContext context,
      File file,
      FolderServerMedia folderServerMedia}) async {
    final UpdateFileApiModel model = new UpdateFileApiModel(
      fileSize: 0,
      file: file,
      folderName: folderServerMedia.values,
    );

    ResponseApiUtil result = await RequestLeaveProvider().updateFileProvider(
        context: context,
        domain: ConfigUnit().getHost(
          hostApi: HostApi.hrm,
        ),
        modelRequest: model,
        url: '${ConfigUnit.uploadMediaApi}${model.toString()}');
    switch (result.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        List<FilesResponseModel> listModel = [];
        json
            .decode(result.body)['${ConfigUnit.result}']['${ConfigUnit.files}']
            .forEach((v) {
          listModel.add(FilesResponseModel.fromJson(v));
        });
        setListFiles(listModel);
        Navigator.pop(context);
        break;

      default:
        Navigator.pop(context);
        Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => SelectTypeLoginPage(),
          ),
        );
        break;
    }
  }

  updateFormApiBloc(
      {@required BuildContext context,
      TypeFormName typeFormName,
      RequestApiUpdateModel requestApiUpdateModel}) async {
    ResponseApiUtil result = await RequestLeaveProvider().updateFormApiProvider(
        method: Method.put,
        context: context,
        domain: ConfigUnit().getHost(
          hostApi: HostApi.qlns,
          hostType: HostType.cmd,
        ),
        requestApiUpdateModel: requestApiUpdateModel,
        url: '${typeFormName.values}');
    switch (result.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        // List<FilesResponseModel> listModel = [];
        // json.decode(result.body)['${WordUtil.result}']['${WordUtil.files}'].forEach((v) {
        //   listModel.add(FilesResponseModel.fromJson(v));
        // });
        //
        // setListFiles(listModel);

        Navigator.pop(context);
        dialogWarning(
          context: context,
          isWarning: false,
          title: '${WordError.warning}',
          description: '${WordUtil.success}',
          buttonTitle: WordUtil.confirm,
          function: () {
            Navigator.pop(context);
          },
        );

        break;

      default:
        Navigator.pop(context);
        dialogWarning(
          context: context,
          isWarning: false,
          title: '${WordError.warning}',
          description: '${WordError.errorWrongSomethings}',
          buttonTitle: WordUtil.confirm,
          function: () {
            Navigator.pop(context);
          },
        );
        break;
    }
  }

  createFormApiBloc(
      {@required BuildContext context,
      RequestApiUpdateModel requestApiUpdateModel}) async {
    ResponseApiUtil result = await RequestLeaveProvider().createFormApiProvider(
        context: context,
        domain: ConfigUnit().getHost(
          hostType: HostType.cmd,
          hostApi: HostApi.qlns,
        ),
        body: requestApiUpdateModel.toJson(),
        url: '${ConfigUnit.donTuNghiViec}');
    switch (result.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        print(result.body);
        Navigator.pop(context);

        Navigator.pop(context, true);
        break;

      default:
        Navigator.pop(context);
        dialogWarning(
          context: context,
          isWarning: false,
          title: '${WordError.warning}',
          description: '${WordError.errorWrongSomethings}',
          buttonTitle: WordUtil.confirm,
          function: () {
            Navigator.pop(context);
          },
        );
        break;
    }
  }

  void dispose() {
    subjectFiles.close();
    subjectDate.close();
    _setListFiles.close();
    _setDetailPolicyPageModel.close();
    subjectDateTwo.close();

    subject.close();
    subjectSession.close();
    subjectHandOver.close();
    subjectReasonModel.close();
    subjectListReason.close();
    subjectListHandOver.close();
    subjectListReceiver.close();
  }
}
