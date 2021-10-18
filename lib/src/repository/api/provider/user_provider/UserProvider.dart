import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserDetailModel.dart';
import 'package:vnu_app/src/repository/api/provider/ApiProvider.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class UserProvider extends BaseProvider {
  Future<UserDetailModel> buildGetUserById({
    @required int userId,
    @required BuildContext context,
  }) async {
    final respon = await ApiProvider().fetchApiHandle(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.hrm,
      ),
      method: Method.post,
      url: ConfigUnit.getUserDetailById,
      body: {'idNhanSu': userId},
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (respon.statusCode != 200) {
      return null;
    }
    Map<String, dynamic> responMap = jsonDecode(respon.body);
    if (responMap.containsKey('${ConfigUnit.result}')) {
      Map<String, dynamic> result = responMap['${ConfigUnit.result}'];
      return UserDetailModel.fromJson(result);
    }
    return null;
  }
}
