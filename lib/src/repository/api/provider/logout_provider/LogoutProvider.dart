import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/repository/api/model/logout_model/LogoutModelRequest.dart';
import 'package:vnu_app/src/repository/api/provider/ApiProvider.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class LogoutProvider extends BaseProvider {
  Future logoutRequestApiProvider({
    @required BuildContext context,
  }) async {
    /// get token, session
    LogoutModelRequestApi logoutModelRequestApi = new LogoutModelRequestApi(
      listOfSessionCode: [
        await SharePreferenceUtil()
            .getStringSharePreference(ConfigUnit.sessionApiLogin)
      ],
      isCurrentUserLogout: true,
    );

    final response = await ApiProvider().fetchApiUtil(
      context: context,
      domain: ConfigUnit().getHost(hostType: HostType.cmd),
      url: ConfigUnit.logoutApi,
      body: logoutModelRequestApi.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    if (response.statusCode == ConfigUnit.statusCodeSuccess) {
      await SharePreferenceUtil().removeStringSharePreference(
        key: ConfigUnit.accessToken,
      );
      await SharePreferenceUtil().removeStringSharePreference(
        key: ConfigUnit.sessionApiLogin,
      );

      Navigator.pop(context);

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => SelectTypeLoginPage(),
        ),
      );
      return true;
    } else {
      // Navigator.pop(context);
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => SelectTypeLoginPage(),
        ),
      );
    }
  }
}
