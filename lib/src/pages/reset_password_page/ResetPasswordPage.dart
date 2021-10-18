import 'package:flutter/material.dart';
import 'package:vnu_app/src/pages/reset_password_page/components/ResetPasswordComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController passwordController = new TextEditingController();
  TextEditingController rePasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              WordUtil.titlePageReset,
              style: TextStyle(
                fontSize: 20,
                fontFamily: ConfigUnit.roboto,
              ),
            ),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            SizedBox(
              width: 40,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: MyHexColor(ColorUtil.colorLv7),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 32,
                ),
                ResetPasswordComponent().handleInput(
                  passwordController: passwordController,
                  rePasswordController: rePasswordController,
                  context: context,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
