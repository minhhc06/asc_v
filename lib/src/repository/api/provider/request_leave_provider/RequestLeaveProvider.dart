import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBlocV2.dart';

import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/RequestApiUpdateModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/UpdateFileApiModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/DateTimeOfLeave.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/InfoUserRetirement.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/MediaModelResponse.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonOfLeave.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/RequestLeaveReaquestModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/RequestListUserModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/RequestUploadMediaModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ResignationReaquestModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';
import 'package:vnu_app/src/repository/api/provider/ApiProvider.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/IntUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class RequestLeaveProvider extends BaseProvider {
  fetchApiListProvider(
      {@required BuildContext context,
      Map<String, dynamic> body,
      String domain,
      String url}) async {
    final response = await fetchApiUtil(
      context: context,
      domain: domain,
      url: ConfigUnit.receiverList,
      body: body,
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    return response;
  }

  fetchApiListReasonProvider(
      {@required BuildContext context,
      Map<String, dynamic> body,
      String domain,
      String url}) async {
    final response = await fetchApiUtil(
      context: context,
      domain: domain,
      url: url,
      body: body,
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    return response;
  }

  buildReceiverList({
    @required BuildContext context,
    @required RequestLeaveBlocV2 requestLeaveBloc,
    int manHinh,
  }) async {
    final request = RequestListUserModel(
      pageSize: 100,
      pageNumber: 1,
      sortName: 'Id',
      keyControl: "DONTU_003",
      sortByASC: false,
      manHinh: manHinh,
    );
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.hrm,
      ),
      url: ConfigUnit.receiverList,
      body: request.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon == null) {
      requestLeaveBloc.setListReceiver([]);
      return;
    }
    if (respon.statusCode != ConfigUnit.statusCodeSuccess) {
      requestLeaveBloc.setListReceiver([]);
      return;
    }
    Map<String, dynamic> responMap = jsonDecode(respon.body);
    if (responMap.containsKey('${ConfigUnit.result}')) {
      Map<String, dynamic> result = responMap['${ConfigUnit.result}'];
      if (result.containsKey('${ConfigUnit.pagingItems}')) {
        Map<String, dynamic> pagingItems = result['${ConfigUnit.pagingItems}'];
        if (pagingItems.containsKey('${ConfigUnit.items}')) {
          List<dynamic> list = pagingItems['${ConfigUnit.items}'];
          List<UserModel> listUserModel = [];
          for (var user in list) {
            listUserModel.add(new UserModel.fromJson(user));
          }
          requestLeaveBloc.setListReceiver(listUserModel);
          return;
        }
      }
    }
  }

  buildHandOverList({
    @required BuildContext context,
    @required RequestLeaveBlocV2 requestLeaveBloc,
  }) async {
    final request = RequestListUserModel(
      pageSize: 100,
      pageNumber: 1,
      sortName: 'Id',
      sortByASC: false,
    );
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.hrm,
      ),
      url: ConfigUnit.receiverList,
      body: request.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon == null) {
      requestLeaveBloc.setListHandOver([]);
      return;
    }
    if (respon.statusCode != ConfigUnit.statusCodeSuccess) {
      requestLeaveBloc.setListHandOver([]);
      return;
    }
    Map<String, dynamic> responMap = jsonDecode(respon.body);
    if (responMap.containsKey('${ConfigUnit.result}')) {
      Map<String, dynamic> result = responMap['${ConfigUnit.result}'];
      if (result.containsKey('${ConfigUnit.pagingItems}')) {
        Map<String, dynamic> pagingItems = result['${ConfigUnit.pagingItems}'];
        if (pagingItems.containsKey('${ConfigUnit.items}')) {
          List<dynamic> list = pagingItems['${ConfigUnit.items}'];
          List<UserModel> listUserModel = [];
          for (var user in list) {
            listUserModel.add(new UserModel.fromJson(user));
          }
          requestLeaveBloc.setListHandOver(listUserModel);
          return;
        }
      }
    }
  }

  Future<bool> buildCreateRequestLeave({
    @required BuildContext context,
    RequestLeaveModelState requestLeaveState,
    TextEditingController titleController,
    TextEditingController noteController,
    List<MediaModelResponse> listFiles,
  }) async {
    final request = RequestLeaveReaquestModel(
      idNhanSuNhanBanGiao: requestLeaveState?.handOver?.nhanSuId,
      idsFileDinhKem: listFiles?.map((e) => e.fileId)?.toList(),
      idsNhanSuNhan: [requestLeaveState?.receiver?.nhanSuId ?? 0],
      lyDoNghiPheps: [
        ...requestLeaveState.listReasonModel
            .map((item) => new ReasonOfLeave(idLyDoNghiPhep: item.id))
            .toList()
      ],
      ngayNhanBanGiao: null,
      noiDung: noteController.text,
      thoiGian: null,
      thoiGianDen: null,
      thoiGianNghiPheps: [
        ...requestLeaveState.listReasonTime
            .map((e) => new DateTimeOfLeave(
                  caNghi: e.session.index + 1,
                  ngayNghi: _formatISOTime(date: e.time),
                ))
            .toList()
      ],
      tieuDe: titleController.text,
    );
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.qlns,
        hostType: HostType.cmd,
      ),
      url: ConfigUnit.requestLeave,
      body: request.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon == null) return false;
    if (respon.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<InfoUserRetirement> getInfoUserRetirement({
    @required BuildContext context,
    int idNhanSu = 0,
  }) async {
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.qlns,
        hostType: HostType.cmd,
      ),
      url: ConfigUnit.getInfoUserRetirement,
      body: {'idNhanSu': idNhanSu},
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon == null) {
      return null;
    }
    if (respon.statusCode != ConfigUnit.statusCodeSuccess) {
      return null;
    }
    Map<String, dynamic> responMap = jsonDecode(respon.body);
    if (responMap.containsKey('${ConfigUnit.result}')) {
      Map<String, dynamic> result = responMap['${ConfigUnit.result}'];

      return InfoUserRetirement.formJson(result);
    }
    return null;
  }

  buildCreateRequestRetirement({
    @required BuildContext context,
    RequestRetirementModelState modelState,
    TextEditingController titleController,
    TextEditingController noteController,
    List<MediaModelResponse> listFiles,
  }) async {
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.qlns,
        hostType: HostType.cmd,
      ),
      url: ConfigUnit.requestResignation,
      body: {
        'tieuDe': titleController.text,
        'ngayHuongBHXH': _formatISOTime(date: modelState?.endDay),
        'noiNhan': noteController.text,
        'idNhanSuNghiHuu': modelState?.handOver?.nhanSuId ?? 0,
        'idNhanSuDuyet': modelState?.receiver?.nhanSuId ?? 0,
        'idsFileDinhKem': listFiles?.map((e) => e.fileId)?.toList(),
        'coQuanNSNH': modelState?.infoUserRetirementReceiver?.tenCoQuan,
        'gioiTinhNSNH': modelState?.infoUserRetirementReceiver?.tenGioiTinh,
        'loaiDon': 3,
        'tenChucVuNSDuyet': modelState?.infoUserRetirementHandOver?.tenChucVu,
        'tenChucVuNSNH': modelState?.infoUserRetirementReceiver?.tenChucVu,
        'tenNgachNSNH': modelState?.userDetailModelReceiver?.tenNgachCongChuc,
        'tuoiHuuTheoQD':
            modelState?.infoUserRetirementReceiver?.tuoiNghiHuuTheoQuyDinh,
        'tuoiHuuTheoTB': modelState?.retirementChange,
      },
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon.statusCode == 200) {
      return true;
    }
    return false;
  }

  buildCreateRequestResignation(
      {@required BuildContext context,
      RequestResignationModelState modelState,
      TextEditingController titleController,
      TextEditingController noteController,
      List<MediaModelResponse> listFiles,
      ResignationReaquestModel modelRequest}) async {
    final request = ResignationReaquestModel(
      idNhanSuNhanBanGiao: modelState?.handOver?.nhanSuId,
      idsFileDinhKem: listFiles?.map((e) => e.fileId)?.toList(),
      idsNhanSuNhan: [modelState?.receiver?.nhanSuId ?? 0],
      ngayNhanBanGiao: _formatISOTime(date: modelState?.endDay),
      noiDung: noteController.text,
      thoiGian: _formatISOTime(date: modelState?.finishDay),
      tieuDe: titleController.text,
      id: 0,
      idNhanSuNhan: null,
      loaiDon: 1,
      ngayDuyet: null,
      trangThai: null,
    );
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.qlns,
        hostType: HostType.cmd,
      ),
      url: ConfigUnit.requestResignation,
      body: modelRequest.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<MediaModelResponse>> buildUploadMedias({
    @required BuildContext context,
    List<File> files,
    FolderServerMedia folderServerMedia,
  }) async {
    final RequestUploadMediaModel requestUploadMediaModel =
        new RequestUploadMediaModel(
      fileSize: 0,
      files: files,
      folderName: folderServerMedia.values,
    );
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.hrm,
      ),
      url: '${ConfigUnit.uploadMediaApi}${requestUploadMediaModel.toString()}',
      files: requestUploadMediaModel.files,
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon == null) return [];
    if (respon.statusCode != ConfigUnit.statusCodeSuccess) {
      return [];
    }
    Map<String, dynamic> responMap = jsonDecode(respon.body);
    if (responMap.containsKey('${ConfigUnit.result}')) {
      Map<String, dynamic> result = responMap['${ConfigUnit.result}'];
      if (result.containsKey('${ConfigUnit.files}')) {
        List<dynamic> list = result['${ConfigUnit.files}'];
        List<MediaModelResponse> listMediaModel = [];
        for (var file in list) {
          listMediaModel.add(new MediaModelResponse.fromJson(file));
        }
        return listMediaModel;
      }
    }
    return [];
  }

  buildReasonList({
    @required BuildContext context,
    @required RequestLeaveBlocV2 requestLeaveBloc,
  }) async {
    final respon = await ApiProvider().fetchApi(
      context: context,
      domain:
          ConfigUnit().getHost(hostApi: HostApi.qlns, hostType: HostType.cmd),
      url: ConfigUnit.reasonList,
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon == null) {
      requestLeaveBloc.setListReason([]);
      return;
    }
    if (respon.statusCode != 200) {
      requestLeaveBloc.setListReason([]);
      return;
    }
    Map<String, dynamic> responMap = jsonDecode(respon.body);
    if (responMap.containsKey('${ConfigUnit.result}')) {
      List<dynamic> result = responMap['${ConfigUnit.result}'];
      List<ReasonModel> listReason = [];
      for (var reason in result) {
        listReason.add(new ReasonModel.fromJson(reason));
      }
      requestLeaveBloc.setListReason(listReason);
    }
  }

  String _formatISOTime({DateTime date}) {
    if (date == null) return null;
    var duration = date.timeZoneOffset;
    if (duration.isNegative)
      return (date.toIso8601String() +
          "-${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    else
      return (date.toIso8601String() +
          "+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  }

  Future<ResponseApiUtil> updateFileProvider({
    @required BuildContext context,
    UpdateFileApiModel modelRequest,
    String domain,
    String url,
    File file,
    FolderServerMedia folderServerMedia,
  }) async {
    ///request api
    final response = await uploadFileApi(
      context: context,
      domain: domain,
      url: '$url',
      file: modelRequest.file,
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    return response;
  }

  Future<ResponseApiUtil> updateFormApiProvider(
      {@required BuildContext context,
      RequestApiUpdateModel requestApiUpdateModel,
      String domain,
      String url,
      String method}) async {
    ///request api
    final response = await fetchApiUtil(
      context: context,
      domain: domain,
      url: '$url',
      method: method,
      body: requestApiUpdateModel.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    return response;
  }

  Future<ResponseApiUtil> createFormApiProvider(
      {@required BuildContext context,
      Map<String, dynamic> body,
      String domain,
      String url,
      String method}) async {
    ///request api
    final response = await fetchApiUtil(
      context: context,
      domain: domain,
      url: '$url',
      body: body,
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    return response;
  }
}
