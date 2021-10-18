import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/repository/api/model/login_model/LoginModelResponseApi.dart';
import 'package:vnu_app/src/repository/api/provider/ApiProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordErrorUtil.dart';
import 'package:http/http.dart' as http;

class BaseProvider extends BaseComponent {
  Future<ResponseApiUtil> refreshToken({@required BuildContext context}) async {
    ResponseApiUtil model = new ResponseApiUtil();
    String refreshToken = await SharePreferenceUtil()
        .getStringSharePreference(ConfigUnit.refreshToken);
    final response = await ApiProvider().createRequest(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.acl,
        hostType: HostType.cmd,
      ),
      url: ConfigUnit.refreshTokenApi,
      body: <String, String>{
        "refreshToken": "$refreshToken",
      },
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (response == null) return model;

    model.statusCode = response.statusCode;
    model.body = await response?.stream?.bytesToString();

    return model;
  }

  Future<ResponseApiUtil> _refreshToken({
    @required BuildContext context,
  }) async {
    ResponseApiUtil model = new ResponseApiUtil();
    String refreshToken = await SharePreferenceUtil()
        .getStringSharePreference(ConfigUnit.refreshToken);
    final response = await ApiProvider().createRequest(
      context: context,
      domain: ConfigUnit().getHost(
        hostApi: HostApi.acl,
        hostType: HostType.cmd,
      ),
      url: ConfigUnit.refreshTokenApi,
      body: <String, String>{
        "refreshToken": "$refreshToken",
      },
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    if (response == null) return null;

    model.statusCode = response.statusCode;
    model.body = await response?.stream?.bytesToString();

    return model;
  }

  Future<bool> handleRefreshToken({BuildContext context}) async {
    ResponseApiUtil responseApiUtil = await _refreshToken(context: context);

    if (responseApiUtil?.statusCode == ConfigUnit.statusCodeSuccess) {
      var data = json.decode(responseApiUtil.body)['${ConfigUnit.result}'];
      LoginModelResponseApi model = LoginModelResponseApi.fromJson(data);

      await SharePreferenceUtil().setStringSharePreference(
          key: ConfigUnit.accessToken, value: model.accessToken);

      await SharePreferenceUtil().setStringSharePreference(
          key: ConfigUnit.refreshToken, value: model.refreshToken);

      return true;
    } else {
      // Navigator.pop(context);
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const SelectTypeLoginPage(),
        ),
      );
      return false;
    }
  }

  Map<String, String> _requestHeaders = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };

  Future<ResponseApiUtil> fetchApiUtil({
    @required BuildContext context,
    String method = Method.post,
    @required String domain,
    @required String url,
    Map<String, dynamic> body,
    String token,
    List<File> files,
  }) async {
    if (await checkInternet() == InternetStatus.notconnected) {
      dialogWarning(
        context: context,
        isWarning: true,
        title: '${WordError.warning}',
        description: '${WordError.errorInternet}',
        buttonTitle: '${ConfigUnit.ok}',
        function: () => Navigator.pop(context),
      );
      return null;
    }
    try {
      if (![Method.get, Method.post, Method.put, Method.delete]
          .any((element) => method == element)) throw ('method is not valid');
      var response = await createRequestUtil(
        context: context,
        body: body,
        domain: domain,
        method: method,
        token: token,
        url: url,
        files: files,
      );
      if (response.statusCode == 401) {
        bool responseApiUtil = await handleRefreshToken(context: context);
        if (responseApiUtil == true) {
          response = await createRequestUtil(
            context: context,
            body: body,
            domain: domain,
            method: method,
            token: await SharePreferenceUtil()
                .getStringSharePreference(ConfigUnit.accessToken),
            url: url,
          );
        } else {
          Navigator.pop(context);

          await Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SelectTypeLoginPage(),
            ),
          );
        }
      }
      ResponseApiUtil model = new ResponseApiUtil();
      model.statusCode = response.statusCode;
      model.body = await response?.stream?.bytesToString();

      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ResponseApiUtil> _fetchApiHandle(
      {@required BuildContext context,
      String method = Method.post,
      String domain = '',
      String url = '',
      Map<String, dynamic> body,
      List<File> files,
      String token}) async {
    try {
      if (![Method.get, Method.post, Method.put, Method.delete]
          .any((element) => method == element)) throw ('method is not valid');
      var response = await createRequestUtil(
        context: context,
        body: body,
        domain: domain,
        method: method,
        token: token,
        url: url,
        files: files,
      );
      if (response.statusCode == 401) {
        bool responseApiUtil = await handleRefreshToken(context: context);
        if (responseApiUtil == true) {
          response = await createRequestUtil(
            context: context,
            body: body,
            domain: domain,
            method: method,
            token: await SharePreferenceUtil()
                .getStringSharePreference(ConfigUnit.accessToken),
            url: url,
          );
        } else {
          Navigator.pop(context);

          await Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SelectTypeLoginPage(),
            ),
          );
        }
      }
      ResponseApiUtil model = new ResponseApiUtil();
      model.statusCode = response.statusCode;
      model.body = await response?.stream?.bytesToString();

      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<http.StreamedResponse> createRequestUtil({
    @required BuildContext context,
    String method = Method.post,
    String domain = '',
    String url = '',
    Map<String, dynamic> body,
    String token,
    List<File> files,
  }) async {
    var uri = Uri.parse('$domain/$url');
    if (files == null) {
      var request = http.Request(
        method,
        uri,
      );
      request.headers.addAll(_requestHeaders);
      if (token != null)
        request.headers.addAll({'Authorization': 'Bearer $token'});
      if (body != null) {
        request.body = jsonEncode(body);
      }

      return await request.send().timeout(const Duration(seconds: TIME_OUT),
          onTimeout: () {
        print('timeout request');
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
    } else {
      var request = http.MultipartRequest(Method.post, uri);
      if (token != null)
        request.headers.addAll({'Authorization': 'Bearer $token'});

      for (final file in files) {
        request.files
            .add(await http.MultipartFile.fromPath('formFiles', file.path));
      }

      return await request.send().timeout(const Duration(seconds: TIME_OUT),
          onTimeout: () {
        print('timeout request');
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
    }
  }

  Future<ResponseApiUtil> uploadFileApi({
    @required BuildContext context,
    String method = Method.post,
    @required String domain,
    @required String url,
    Map<String, dynamic> body,
    String token,
    File file,
  }) async {
    if (await checkInternet() == InternetStatus.notconnected) {
      dialogWarning(
        context: context,
        isWarning: true,
        title: '${WordError.warning}',
        description: '${WordError.errorInternet}',
        buttonTitle: '${ConfigUnit.ok}',
        function: () => Navigator.pop(context),
      );
      return null;
    }
    try {
      if (![Method.get, Method.post, Method.put, Method.delete]
          .any((element) => method == element)) throw ('method is not valid');

      ///request api
      var response = await createRequestFileUtil(
        context: context,
        body: body,
        domain: domain,
        method: method,
        token: token,
        url: url,
        file: file,
      );
      if (response.statusCode == 401) {
        bool responseApiUtil = await handleRefreshToken(context: context);
        if (responseApiUtil == true) {
          response = await createRequestUtil(
            context: context,
            body: body,
            domain: domain,
            method: method,
            token: await SharePreferenceUtil()
                .getStringSharePreference(ConfigUnit.accessToken),
            url: url,
          );
        } else {
          Navigator.pop(context);

          await Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => SelectTypeLoginPage(),
            ),
          );
        }
      }
      ResponseApiUtil model = new ResponseApiUtil();
      model.statusCode = response.statusCode;
      model.body = await response?.stream?.bytesToString();
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<http.StreamedResponse> createRequestFileUtil({
    @required BuildContext context,
    String method = Method.post,
    String domain = '',
    String url = '',
    Map<String, dynamic> body,
    String token,
    File file,
  }) async {
    var uri = Uri.parse('$domain/$url');
    var request = http.MultipartRequest(Method.post, uri);
    if (token != null)
      request.headers.addAll({'Authorization': 'Bearer $token'});
    request.files
        .add(await http.MultipartFile.fromPath('formFiles', file.path));

    return await request.send().timeout(const Duration(seconds: TIME_OUT),
        onTimeout: () {
      print('timeout request');
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
  }
}

const TIME_OUT = 7;
