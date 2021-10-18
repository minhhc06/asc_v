import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/policy_bloc/PolicyBloc.dart';
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/repository/api/model/policy_model/PolicyRequestModel.dart';
import 'package:vnu_app/src/repository/api/provider/ApiProvider.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';
import 'package:vnu_app/src/utils/model/ListItemsModelUtil.dart';
import 'package:vnu_app/src/utils/model/ResponseApiUtil.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordErrorUtil.dart';

class PolicyProvider extends BaseProvider {
  buildListPolicy(
      {@required BuildContext context,
      @required PolicyBloc policyBloc,
      int page,
      String url}) async {
    final request = PolicyReqyestModel(
      pageSize: 20,
      pageNumber: page,
      sortName: 'Id',
    );
    ResponseApiUtil responseApiUtil = await ApiProvider().fetchApi(
      context: context,
      domain:
          ConfigUnit().getHost(hostApi: HostApi.qlns, hostType: HostType.cmd),
      // url: WordUtil.receivedListPolicy,
      url: url,
      body: request.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );
    switch (responseApiUtil.statusCode) {
      case ConfigUnit.statusCodeSuccess:
        final List<ListItemsModelUtil> result = [];
        json
            .decode(responseApiUtil.body)['${ConfigUnit.result}']
                ['${ConfigUnit.items}']
            .forEach((v) {
          result.add(ListItemsModelUtil.fromJson(v));
        });
        policyBloc.setListItemsModelUtil(result, context);
        // Navigator.pop(context);
        break;

      case ConfigUnit.statusCodeFail401:
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

  buildSentListPolicy(
      {@required BuildContext context,
      @required PolicyBloc policyBloc,
      int page}) async {
    final request = PolicyReqyestModel(
        pageSize: 20, pageNumber: page, sortName: 'Id', sortASC: false);
    ResponseApiUtil responseApiUtil = await ApiProvider().fetchApi(
      context: context,
      domain:
          ConfigUnit().getHost(hostApi: HostApi.qlns, hostType: HostType.cmd),
      url: ConfigUnit.sentListPolicy,
      body: request.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    if (responseApiUtil.statusCode == ConfigUnit.statusCodeSuccess) {
      final List<ListItemsModelUtil> result = [];
      json
          .decode(responseApiUtil.body)['${ConfigUnit.result}']
              ['${ConfigUnit.items}']
          .forEach((v) {
        result.add(ListItemsModelUtil.fromJson(v));
      });
      policyBloc.setListItemsModelUtil(result, context);
      // Navigator.pop(context);
    } else {
      Navigator.pop(context);
      dialogWarning(
          context: context,
          isWarning: true,
          title: '${WordError.warning}',
          description: '${WordError.errorTokenDoesNotExist}',
          buttonTitle: '${ConfigUnit.ok}',
          function: () {
            Navigator.pop(context);
          });
    }
  }

  buildApprovedListPolicy(
      {@required BuildContext context,
      @required PolicyBloc policyBloc,
      int page}) async {
    final request = PolicyReqyestModel(
      pageSize: 20,
      pageNumber: 1,
      sortName: 'Id',
    );
    ResponseApiUtil responseApiUtil = await ApiProvider().fetchApi(
      context: context,
      domain:
          ConfigUnit().getHost(hostApi: HostApi.qlns, hostType: HostType.cmd),
      url: ConfigUnit.approvedListPolicy,
      body: request.toJson(),
      token: await SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.accessToken),
    );

    if (responseApiUtil.statusCode == ConfigUnit.statusCodeSuccess) {
      final List<ListItemsModelUtil> result = [];
      json
          .decode(responseApiUtil.body)['${ConfigUnit.result}']
              ['${ConfigUnit.items}']
          .forEach((v) {
        result.add(ListItemsModelUtil.fromJson(v));
      });
      policyBloc.setListItemsModelUtil(result, context);
      // Navigator.pop(context);
    } else {
      Navigator.pop(context);
      dialogWarning(
          context: context,
          isWarning: true,
          title: '${WordError.warning}',
          description: '${WordError.errorTokenDoesNotExist}',
          buttonTitle: '${ConfigUnit.ok}',
          function: () {
            Navigator.pop(context);
          });
    }
  }
}
