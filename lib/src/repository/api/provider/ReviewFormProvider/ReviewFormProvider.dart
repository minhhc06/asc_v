import 'package:flutter/material.dart';
import 'package:vnu_app/src/repository/api/model/ReviewFormPageModelRequest/ReviewFormPageModelRequest.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/IntUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class ReviewFormProvider extends BaseProvider {
  Future<ResponseApiUtil> fetchApiReview(
      {BuildContext context, ReviewFormPageModelRequest modelRequest}) async {
    String url;
    switch (modelRequest.loaiDon) {
      case IntUnit.leaveWorkStatus:
        url = ConfigUnit.duyetDonTuNghiViec;
        break;

      case IntUnit.annualLeaveStatus:
        url = ConfigUnit.duyetDonTuNghiPhep;
        break;

      case IntUnit.retirementStatus:
        url = ConfigUnit.duyetDonTuNghiHuus;
        break;
    }

    ResponseApiUtil responseApiUtil = await fetchApiUtil(
      context: context,
      domain:
          ConfigUnit().getHost(hostType: HostType.cmd, hostApi: HostApi.qlns),
      url: url,
      body: modelRequest.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    return responseApiUtil;
  }
}
