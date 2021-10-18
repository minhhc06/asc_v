import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vnu_app/src/bloc/login_bloc/LoginBloc.dart';
import 'package:vnu_app/src/repository/api/model/login_model/LoginModelRequestApi.dart';
import 'package:vnu_app/src/repository/api/model/login_model/LoginModelResponseApi.dart';
import 'package:vnu_app/src/pages/home_page/HomePage.dart';
import 'package:vnu_app/src/repository/api/model/login_model/PayloadJwtLoginPageModel.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/jwt.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordErrorUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class LoginProvider extends BaseComponent {
  Future loginRequestApiProvider({
    @required LoginModelRequestApi loginModelRequestApi,
    LoginBloc bloc,
    @required BuildContext context,
  }) async {
    if (await checkInternet() == InternetStatus.notconnected) {
      Navigator.pop(context);
      dialogWarning(
        context: context,
        isWarning: true,
        title: '${WordError.warning}',
        description: WordUtil.errInternet,
        buttonTitle: '${ConfigUnit.ok}',
        function: () => Navigator.pop(context),
      );
      return;
    }
    // String url = WordUtil.hostApi + "${WordUtil.loginApi}";
    String url =
        "${ConfigUnit().getHost(hostType: HostType.cmd, hostApi: HostApi.acl)}/${ConfigUnit.loginApi}";
    final response = await http
        .post(Uri.parse('$url'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              '${ConfigUnit.usernameApiLogin}':
                  '${loginModelRequestApi.username}',
              '${ConfigUnit.passwordApiLogin}':
                  '${loginModelRequestApi.password}',
              '${ConfigUnit.sessionApiLogin}':
                  '${loginModelRequestApi.sessionCode}',
            }))
        .timeout(Duration(seconds: WordError.timeOut), onTimeout: () {
      Navigator.pop(context);
      dialogWarning(
        context: context,
        isWarning: true,
        title: '${WordError.warning}',
        description: '${WordError.errorTimeOut}',
        buttonTitle: '${ConfigUnit.ok}',
        function: () => Navigator.pop(context),
      );
      return null;
    });

    if (response.statusCode == ConfigUnit.statusCodeSuccess) {
      var data = json.decode(response.body)['${ConfigUnit.result}'];
      LoginModelResponseApi loginModelResponseApi =
          LoginModelResponseApi.fromJson(data);

      await SharePreferenceUtil().setStringSharePreference(
          key: ConfigUnit.accessToken,
          value: loginModelResponseApi.accessToken);

      await SharePreferenceUtil().setStringSharePreference(
          key: ConfigUnit.refreshToken,
          value: loginModelResponseApi.refreshToken);

      PayloadJwtLoginPageModel payload = PayloadJwtLoginPageModel.fromJson(
          Jwt.parseJwt(loginModelResponseApi.accessToken));

      await SharePreferenceUtil().setStringSharePreference(
          key: ConfigUnit.doiTuongIdSharePreference, value: payload.doiTuongId);

      await SharePreferenceUtil().setStringSharePreference(
          key: ConfigUnit.avatar, value: payload.avatar);

      await SharePreferenceUtil().setStringSharePreference(
        key: WordUtil.fullName,
        value:
            '${payload.firstName != null ? payload.firstName : ''} ${payload.lastName != null ? payload.lastName : ''}',
      );

      Navigator.pop(context);

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => HomePage(),
        ),
      );
      return true;
    } else {
      if (response.statusCode == ConfigUnit.statusCodeFail400) {
        final List<LoginModelResponseApi> result = [];

        json.decode(response.body)['${ConfigUnit.errorMessages}'].forEach((v) {
          result.add(LoginModelResponseApi.fromJson(v));
        });

        Navigator.pop(context);
        switch (result[0].errorCode) {
          case WordError.errorUC21Login:
            dialogWarning(
                context: context,
                isWarning: true,
                title: '${WordError.warning}',
                description: '${WordError.errorDoNotExist}',
                buttonTitle: '${ConfigUnit.ok}',
                function: () {
                  Navigator.pop(context);
                });
            break;
          case WordError.errorUC24Loign:
            dialogWarning(
                context: context,
                isWarning: true,
                title: '${WordError.warning}',
                description: '${WordError.errorWrongPassword}',
                buttonTitle: '${ConfigUnit.ok}',
                function: () {
                  Navigator.pop(context);
                });
            break;

          default:
            dialogWarning(
                context: context,
                isWarning: true,
                title: '${WordError.warning}',
                description: '${WordError.errorWrongSomethings}',
                buttonTitle: '${ConfigUnit.ok}',
                function: () {
                  Navigator.pop(context);
                });
            break;
        }
      } else {
        Navigator.pop(context);
        dialogWarning(
            context: context,
            isWarning: true,
            title: '${WordError.warning}',
            description: '${WordError.errorWrongSomethings}',
            buttonTitle: '${ConfigUnit.ok}',
            function: () {
              Navigator.pop(context);
            });
      }
    }
  }
}
