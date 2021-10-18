import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/bloc/AccountBloc/AccountBloc.dart';
import 'package:vnu_app/src/pages/AccountPage/components/AccountPageComponents.dart';
import 'package:vnu_app/src/pages/changeToPasswordPage/ChangeToPasswordPage.dart';
import 'package:vnu_app/src/pages/formPage/FormPage.dart';
import 'package:vnu_app/src/pages/infomationPage/InformationPage.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/constants.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with BaseComponent {
  AccountBloc accountBloc;
  @override
  void initState() {
    super.initState();

    accountBloc = new AccountBloc();

    SharePreferenceUtil()
        .getStringSharePreference(ConfigUnit.avatar)
        .then((value) {
      if (value != null) {
        accountBloc.setAvatar(value);
      }
    });

    SharePreferenceUtil()
        .getStringSharePreference(WordUtil.fullName)
        .then((value) {
      if (value != null) {
        accountBloc.setFullName(value);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("$backgroundAppBar"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 200,
                  // width: MediaQuery.of(context).size.width,
                ),
                Positioned.fill(
                    child: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AccountPageComponents()
                        .buildAvatar(context, accountBloc: accountBloc),
                    SizedBox(
                      height: DoubleUtil.padding8,
                    ),
                    StreamBuilder<String>(
                        stream: accountBloc.getFullName,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data != null ? snapshot.data : '',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          );
                        }),
                    Text(
                      'Trưởng khoa',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ))),
              ],
            ),
            // Image.asset('$backgroundAppBar', width: 10000,),
            AccountPageComponents().buildFeatureAccountPage(
                title: WordUtil.information,
                iconTitle: SvgPicture.asset('$iconInformation'),
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformationPage()),
                  );
                }),
            AccountPageComponents().buildFeatureAccountPage(
                title: WordUtil.resetPassword,
                iconTitle: SvgPicture.asset('$iconChangeToPassword'),
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeToPasswordPage()),
                  );
                }),
            AccountPageComponents().buildFeatureAccountPage(
                title: WordUtil.viewForm,
                iconTitle: SvgPicture.asset('$iconForm'),
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormPage()),
                  );
                }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: DoubleUtil.padding16),
              child: Container(
                height: 1,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            AccountPageComponents().buildLogout(
              context: context,
              title: WordUtil.logout,
              iconTitle: SvgPicture.asset('$iconLogout'),
            ),
          ],
        ),
      ),
    );
  }
}
