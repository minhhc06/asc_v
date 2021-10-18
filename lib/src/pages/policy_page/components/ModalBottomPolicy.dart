import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/policy_bloc/PolicyBloc.dart';
import 'package:vnu_app/src/pages/policy_page/components/ButtonNotification.dart';
import 'package:vnu_app/src/pages/policy_page/components/RadioListItem.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ModalBottomPolicy extends StatelessWidget {
  const ModalBottomPolicy({
    Key key,
    @required this.listStatus,
    @required this.policyBloc,
    @required this.scaffoldKey,
    @required this.functionReceive,
    @required this.functionSent,
    @required this.functionApproved,
  }) : super(key: key);
  final List<TrangThai> listStatus;
  final PolicyBloc policyBloc;
  final BuildContext scaffoldKey;
  final Function functionReceive;
  final Function functionSent;
  final Function functionApproved;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ButtonNotification(
              imagePath: AssetUnit.assetsReceivedApplication,
              buttonName: WordUtil.receivedApplication,
              count: '15 mới',
              borderCount: true,
              borderBottom: true,
              function: functionReceive,
            ),
            ButtonNotification(
              imagePath: AssetUnit.assetsSendApplication,
              buttonName: WordUtil.sendApplication,
              count: '150',
              borderBottom: true,
              function: functionSent,
            ),
            ButtonNotification(
              imagePath: AssetUnit.assetsAllApplication,
              buttonName: WordUtil.allApplication,
              count: '300',
              function: functionApproved,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                WordUtil.sortStatus,
                style: TextStyle(
                  fontFamily: ConfigUnit.roboto,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listStatus
                  .map(
                    (item) => RadioListItem(
                      policyBloc: policyBloc,
                      buttonName: item,
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
