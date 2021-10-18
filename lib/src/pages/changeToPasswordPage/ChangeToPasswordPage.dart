import 'package:flutter/material.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ChangeToPasswordPage extends StatefulWidget {
  @override
  _ChangeToPasswordPageState createState() => _ChangeToPasswordPageState();
}

class _ChangeToPasswordPageState extends State<ChangeToPasswordPage> with BaseComponent {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(title: WordUtil.resetPassword, context: context, iconDataBack: Icons.arrow_back_ios),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding16),
          child: Column(
            children: [
              buildInputUtil(title: WordUtil.passwordOld),
              SizedBox(height: DoubleUtil.padding8,),
              buildInputUtil(title: WordUtil.newPassword),
              SizedBox(height: DoubleUtil.padding8,),
              buildInputUtil(title: WordUtil.reNewPassword),
              SizedBox(height: DoubleUtil.padding8,),
              buildButton(title: WordUtil.save, titleColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
