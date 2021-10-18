import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/FilesResponseModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/OptionLeaveModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/RequestApiUpdateModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/UpdateFileApiModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonOfLeave.dart';
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

class FormRequestBloc extends BaseBloc with BaseComponent {
  BehaviorSubject<List<FilesResponseModel>> _setListFiles =
      BehaviorSubject<List<FilesResponseModel>>();

  Stream<List<FilesResponseModel>> get getListFiles => _setListFiles.stream;

  Future<void> setListFiles(List<FilesResponseModel> list) {
    _setListFiles.sink.add(list);
  }

  BehaviorSubject<List<UserModel>> _setListReceiver =
      BehaviorSubject<List<UserModel>>();
  Stream<List<UserModel>> get listReceiverStream => _setListReceiver.stream;

  Future<void> setListReceiver(List<UserModel> list) {
    _setListReceiver.sink.add(list);
  }

  BehaviorSubject<List<OptionLeaveModel>> _setListOptionLeave =
      BehaviorSubject<List<OptionLeaveModel>>();
  Stream<List<OptionLeaveModel>> get getListOptionLeave =>
      _setListOptionLeave.stream;

  Future<void> setListOptionLeave(List<OptionLeaveModel> list) {
    _setListOptionLeave.sink.add(list);
  }

  BehaviorSubject<UserModel> _setReceiver = BehaviorSubject<UserModel>();
  Stream<UserModel> get receiverStream => _setReceiver.stream;

  Future<void> setReceiver(UserModel userModel) {
    _setReceiver.sink.add(userModel);
  }

  BehaviorSubject<UserModel> _setHandOver = BehaviorSubject<UserModel>();
  Stream<UserModel> get handOverStream => _setHandOver.stream;

  Future<void> setHandOver(UserModel userModel) {
    _setHandOver.sink.add(userModel);
  }

  BehaviorSubject<OptionLeaveModel> _setOptionLeaveModel =
      BehaviorSubject<OptionLeaveModel>();
  Stream<OptionLeaveModel> get getOptionLeaveModel =>
      _setOptionLeaveModel.stream;

  Future<void> setOptionLeaveModel(OptionLeaveModel model) {
    _setOptionLeaveModel.sink.add(model);
  }

  BehaviorSubject<List<UserModel>> _setListHandOver = BehaviorSubject<List<UserModel>>();
  Stream<List<UserModel>> get listHandOverStream => _setListHandOver.stream;

  void setListHandOver(List<UserModel> list) => _setListHandOver.sink.add(list);

  void dispose(){
    _setListHandOver.close();
  }


  BehaviorSubject<List<UserModel>> _setListCC =
      BehaviorSubject<List<UserModel>>();
  Stream<List<UserModel>> get getListCC => _setListCC.stream;

  Future<void> setListCC(List<UserModel> list) {
    _setListCC.sink.add(list);
  }

  BehaviorSubject<List<ReasonModel>> _setListReason =
      BehaviorSubject<List<ReasonModel>>();
  Stream<List<ReasonModel>> get getListReason => _setListReason.stream;

  Future<void> setListReason(List<ReasonModel> list) {
    _setListReason.sink.add(list);
  }

  BehaviorSubject<DateTime> _setDate = BehaviorSubject<DateTime>();
  Stream<DateTime> get dateStream => _setDate.stream;

  Future<void> setDate(DateTime dateTime) {
    _setDate.sink.add(dateTime);
  }

  BehaviorSubject<DateTime> _setDateLeave = BehaviorSubject<DateTime>();
  Stream<DateTime> get getDateLeave => _setDateLeave.stream;

  Future<void> setDateLeave(DateTime dateTime) {
    _setDateLeave.sink.add(dateTime);
  }

  BehaviorSubject<DateTime> _setDateTwo = BehaviorSubject<DateTime>();
  Stream<DateTime> get dateTwoStream => _setDateTwo.stream;

  Future<void> setDateTwo(DateTime dateTime) {
    _setDateTwo.sink.add(dateTime);
  }

  Future<void> updateReasonCheckBox({bool isCheck, int index}) {
    var model = _setListReason.stream.value;
    model[index].isCheck = isCheck;
    _setListReason.sink.add(model);
  }

  Future<void> updateReasonCheckBoxUpdate({List<ReasonOfLeave> listId}) {
    var model = _setListReason.stream.value;
    for (int i = 0; i < model.length; i++) {
      for (int j = 0; j < listId.length; j++) {
        if (model[i].id == listId[j].idLyDoNghiPhep) {
          model[i].isCheck = true;
        }
      }
    }
    _setListReason.sink.add(model);
  }

  Future<void> updateCcCheckBox({bool isCheck, int index}) {
    var model = _setListCC.stream.value;
    model[index].isCheck = isCheck;
    _setListCC.sink.add(model);
  }

  Future<void> updateCcCheckBoxUpdate({List<int> listId}) {
    var model = _setListCC.stream.value;
    for (int i = 0; i < model.length; i++) {
      for (int j = 0; j < listId.length; j++) {
        if (model[i].userId == listId[j]) {
          model[i].isCheck = true;
        }
      }
    }
    _setListCC.sink.add(model);
  }

  Future<void> updateCcCheckBoxRemove({UserModel userModel}) {
    var model = _setListCC.stream.value;
    for (int i = 0; i < model.length; i++) {
      if (model[i].userId == userModel.userId) {
        model[i].isCheck = false;
      }
    }

    _setListCC.sink.add(model);
  }

  Future<void> updateReasonCheckBoxRemove({ReasonModel reasonModel}) {
    var model = _setListReason.stream.value;
    for (int i = 0; i < model.length; i++) {
      if (model[i].id == reasonModel.id) {
        model[i].isCheck = false;
      }
    }

    _setListReason.sink.add(model);
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
        setListCC(listModel);
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

  fetchApiListReasonBloc({@required BuildContext context}) async {
    ResponseApiUtil result = await RequestLeaveProvider()
        .fetchApiListReasonProvider(
            context: context,
            domain: ConfigUnit()
                .getHost(hostType: HostType.cmd, hostApi: HostApi.qlns),
            url: '${ConfigUnit.reasonList}');
    switch (result.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        List<ReasonModel> listModel = [];
        json.decode(result.body)['${ConfigUnit.result}'].forEach((v) {
          listModel.add(ReasonModel.fromJson(v));
        });

        print(result.body);
        setListReason(listModel);

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
        print(result.body);
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
      RequestApiUpdateModel requestApiUpdateModel,
      FolderServerMedia folderServerMedial}) async {
    ResponseApiUtil result = await RequestLeaveProvider().createFormApiProvider(
        context: context,
        domain: ConfigUnit().getHost(
          hostType: HostType.cmd,
          hostApi: HostApi.qlns,
        ),
        body: requestApiUpdateModel.toJson(),
        url: '${folderServerMedial.url}');
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

  // createFormApiBloc(
  //     {@required BuildContext context,
  //       RequestApiUpdateModel requestApiUpdateModel, FolderServerMedia folderServerMedial}) async {
  //   ResponseApiUtil result = await RequestLeaveProvider().createFormApiProvider(
  //       context: context,
  //       domain: WordUtil().getHost(
  //         hostType: HostType.cmd,
  //         hostApi: HostApi.qlns,
  //       ),
  //       body: requestApiUpdateModel.toJson(),
  //       url: '${folderServerMedial.url}'
  //   );
  //   switch (result.statusCode) {
  //     case WordUtil.statusCodeSuccess:
  //       print(result.body);
  //       Navigator.pop(context);
  //
  //       Navigator.pop(context, true);
  //       break;
  //
  //     default:
  //       Navigator.pop(context);
  //       dialogWarning(
  //         context: context,
  //         isWarning: false,
  //         title: '${WordError.warning}',
  //         description: '${WordError.errorWrongSomethings}',
  //         buttonTitle: 'Xác nhận',
  //         function: () {
  //           Navigator.pop(context);
  //         },
  //       );
  //       break;
  //   }
  // }

}
