import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/ReviewFormPageModelRequest/ReviewFormPageModelRequest.dart';
import 'package:vnu_app/src/repository/api/provider/DetailPolicyPageProvider/DetailPolicyPageProvider.dart';
import 'package:vnu_app/src/repository/api/provider/ReviewFormProvider/ReviewFormProvider.dart';
import 'package:vnu_app/src/utils/BaseBloc.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/IntUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class DetailPolicyPageBloc extends BaseProvider with BaseBloc {
  DetailPolicyPageBloc() {
    setVisibleFloatButton(true);
  }

  BehaviorSubject<DetailPolicyPageModel> _setDetailPolicyPageModel =
      BehaviorSubject<DetailPolicyPageModel>();

  Stream<DetailPolicyPageModel> get getDetailPolicyPageModel =>
      _setDetailPolicyPageModel.stream;

  setDetailPolicyPageModel(
      DetailPolicyPageModel model, BuildContext context) async {
    if (model?.lyDoNghiPheps != null && model.lyDoNghiPheps.length > 0) {
      ResponseApiUtil result = await fetchApiListReasonProvider(
          context: context,
          domain: ConfigUnit()
              .getHost(hostType: HostType.cmd, hostApi: HostApi.qlns),
          url: '${ConfigUnit.reasonList}');
      if (result.statusCode == 200) {
        List<ReasonModel> listModel = [];
        json.decode(result.body)['${ConfigUnit.result}'].forEach((v) {
          listModel.add(ReasonModel.fromJson(v));
        });
        model.lyDoNghiPhepsString = model.lyDoNghiPheps
            .map(
                (item) => listModel.firstWhere((element) => element.id == item))
            .map((e) => e.ten)
            .join(', ');
      }
    }
    _setDetailPolicyPageModel.sink.add(model);
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

  fetchApiBloc({BuildContext context, int id, int type, bool isPop}) async {
    print('object$type');
    String url;
    switch (type) {
      case IntUnit.leaveWorkStatus:
        url = ConfigUnit.donTuNghiViecById;
        break;

      case IntUnit.annualLeaveStatus:
        url = ConfigUnit.donTuNghiPhepById;
        break;

      case IntUnit.retirementStatus:
        url = ConfigUnit.donTuNghiHuusById;
        break;
      default:
        url = '';
        break;
    }
    ResponseApiUtil result = await DetailPolicyPageProvider()
        .fetchApiDetailPolicyProvider(context, id, url);
    switch (result.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        var data = json.decode(result.body)['${ConfigUnit.result}'];
        DetailPolicyPageModel model;
        if (data != null) {
          model = DetailPolicyPageModel.fromJson(data);
        }
        setDetailPolicyPageModel(model, context);
        Navigator.pop(context);
        if (isPop == true) {
          Navigator.pop(context, true);
        }
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

  fetchApiReview(
      {BuildContext context, ReviewFormPageModelRequest modelRequest}) async {
    ResponseApiUtil result = await ReviewFormProvider()
        .fetchApiReview(context: context, modelRequest: modelRequest);
    switch (result.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        fetchApiBloc(
            context: context,
            id: modelRequest.id,
            type: modelRequest.loaiDon,
            isPop: true);
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

  void dispose() {
    _setDetailPolicyPageModel.close();
  }
}
