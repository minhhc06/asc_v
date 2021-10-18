import 'package:flutter/cupertino.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class DetailPolicyPageProvider extends BaseProvider {
  Future<ResponseApiUtil> fetchApiDetailPolicyProvider(
      BuildContext context, int id, String url) async {
    ResponseApiUtil responseApiUtil = await fetchApiUtil(
      context: context,
      domain:
          ConfigUnit().getHost(hostType: HostType.cmd, hostApi: HostApi.qlns),
      url: url,
      body: toJson(id),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    return responseApiUtil;
  }

  Map<String, dynamic> toJson(int id) => {
        'id': id,
      };
}
