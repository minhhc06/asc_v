import 'package:flutter/material.dart';
import 'package:vnu_app/src/pages/LoginSSoPage/LoginSSoPage.dart';
import 'package:vnu_app/src/pages/select_login_type/components/LineWidget.dart';
import 'package:vnu_app/src/pages/select_login_type/components/TitleWellcome.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

import '../../utils/BaseComponent.dart';
import '../../utils/word/WordUtil.dart';
import '../login_page/LoginPage.dart';

class SelectTypeLoginPage extends StatefulWidget {
  const SelectTypeLoginPage({Key key}) : super(key: key);

  @override
  _SelectTypeLoginPageState createState() => _SelectTypeLoginPageState();
}

class _SelectTypeLoginPageState extends State<SelectTypeLoginPage>
    with BaseComponent {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          panelLogoUniversity(context: context),
          Container(
            padding: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height * .8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  WordUtil.titlePage,
                  style: TextStyle(
                    color: MyHexColor(ColorUtil.green),
                    decoration: TextDecoration.none,
                    fontSize: 26,
                    fontFamily: ConfigUnit.bold,
                  ),
                ),
                TitleWellcome(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildTextButton(
                    context: context,
                    text: WordUtil.btnLoginSSO,
                    textColor: Colors.white,
                    buttonColor: MyHexColor(ColorUtil.green),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginSSO(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: LineWidget(
                    text: WordUtil.titleOr,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildTextButton(
                    context: context,
                    text: WordUtil.btnLoginHRM,
                    textColor: MyHexColor(ColorUtil.black),
                    buttonColor: Colors.white,
                    borderColor: MyHexColor(ColorUtil.green),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(
                          loginType: LoginType.hrm,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
