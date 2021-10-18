import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordErrorUtil.dart';

const TIME_OUT = 7;

Map<String, String> _requestHeaders = {
  "Accept": "application/json",
  "Content-Type": "application/json"
};

class Method {
  static const get = 'get';
  static const post = 'post';
  static const put = 'put';
  static const delete = 'delete';
}

class ApiProvider extends BaseProvider {
  Future<ResponseApiUtil> fetchApi({
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
    return fetchApiHandle(
      context: context,
      files: files,
      body: body,
      domain: domain,
      method: method,
      token: token,
      url: url,
    );
  }

  Future<ResponseApiUtil> fetchApiHandle(
      {@required BuildContext context,
      String method = Method.get,
      String domain = '',
      String url = '',
      Map<String, dynamic> body,
      List<File> files,
      String token}) async {
    try {
      if (![Method.get, Method.post, Method.put, Method.delete]
          .any((element) => method == element)) throw ('method is not valid');
      var response = await createRequest(
        context: context,
        body: body,
        domain: domain,
        method: method,
        token: token,
        url: url,
        files: files,
      );
      if (response == null || response.statusCode == 401) {
        bool responseApiUtil = await handleRefreshToken(context: context);
        if (responseApiUtil == true) {
          response = await createRequest(
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
          Navigator.pushReplacement<void, void>(
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

  Future<http.StreamedResponse> createRequest({
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

  Future<http.StreamedResponse> createRequestV2({
    @required BuildContext context,
    String method = Method.post,
    String domain = '',
    String url = '',
    Map<String, dynamic> body,
    String token,
    List<File> files,
  }) async {
    BaseComponent().showDialogProcessingUtil(
      context: context,
    );
    var uri = Uri.parse('$domain/$url');
    var requestClient;
    if (files == null) {
      requestClient = http.Request(
        method,
        uri,
      );
      requestClient.headers.addAll(_requestHeaders);
      if (token != null)
        requestClient.headers.addAll({'Authorization': 'Bearer $token'});
      if (body != null) {
        requestClient.body = jsonEncode(body);
      }
    } else {
      requestClient = http.MultipartRequest(Method.post, uri);
      if (token != null)
        requestClient.headers.addAll({'Authorization': 'Bearer $token'});

      for (final file in files) {
        requestClient.files
            .add(await http.MultipartFile.fromPath('formFiles', file.path));
      }
    }

    return requestClient.send().timeout(
          const Duration(seconds: TIME_OUT),
        );
  }

  Future<ResponseApiUnit> fetchApRequest({
    @required BuildContext context,
    String method = Method.post,
    String domain = '',
    String url = '',
    Map<String, dynamic> body,
    String token,
    List<File> files,
  }) async {
    BaseComponent().showDialogProcessingUtil(
      context: context,
    );
    var responseData = await createRequest(
      context: context,
      body: body,
      domain: domain,
      method: method,
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
      url: url,
    );

    try {
      switch (responseData.statusCode) {
        case 200:
          return ResponseApiUnit(
            status: StatusCodeApi.success,
            data: await responseData?.stream?.bytesToString(),
          );
          break;
        case 400:
          return ResponseApiUnit(
            status: StatusCodeApi.badrequest,
          );
          break;
        case 401:
          bool responseApiUtil = await handleRefreshToken(context: context);
          if (responseApiUtil == true) {
            responseData = await createRequest(
              context: context,
              body: body,
              domain: domain,
              method: method,
              token: await SharePreferenceUtil()
                  .getStringSharePreference(ConfigUnit.accessToken),
              url: url,
            );
            if (responseData.statusCode == 200)
              return ResponseApiUnit(
                status: StatusCodeApi.success,
                data: await responseData?.stream?.bytesToString(),
              );
          } else {
            Navigator.pop(context);
            Navigator.pushReplacement<void, void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => SelectTypeLoginPage(),
              ),
            );
          }
          break;
        default:
      }
    } on TimeoutException catch (_) {
      return ResponseApiUnit(status: StatusCodeApi.timeout);
    } on SocketException catch (_) {
      return ResponseApiUnit(status: StatusCodeApi.nointernet);
    } on Error catch (_) {
      return ResponseApiUnit(status: StatusCodeApi.error);
    }
  }
}

enum StatusCodeApi {
  success,
  timeout,
  nointernet,
  unauthenticated,
  badrequest,
  internalserver,
  error,
}

class ResponseApiUnit {
  final StatusCodeApi status;
  final dynamic data;

  ResponseApiUnit({this.status, this.data});
}
