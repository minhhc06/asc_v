import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/reset_password_bloc/ResetPasswordBloc.dart';

import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ResetPasswordComponent extends BaseComponent {
  Widget handleInput({
    TextEditingController passwordController,
    TextEditingController rePasswordController,
    ResetPassBloc resetPasswordBloc,
    BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ///password
          _buildInputFromTextFromField(
            label: WordUtil.titleNewPass,
            hintText: WordUtil.hindPass,
            controller: passwordController,
            context: context,
            resetPassBloc: resetPasswordBloc,
          ),
          SizedBox(height: DoubleUtil.height8Login),

          ///re password
          _buildInputFromTextFromField(
            label: WordUtil.titleReNewPass,
            hintText: WordUtil.hindPass,
            controller: rePasswordController,
            resetPassBloc: resetPasswordBloc,
            context: context,
          ),
          SizedBox(height: DoubleUtil.height16Login),

          buildTextButton(
            context: context,
            text: WordUtil.btnSaveResetPassPage,
            textColor: Colors.white,
            buttonColor: MyHexColor(ColorUtil.green),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildInputFromTextFromField({
    @required String label,
    @required String hintText,
    @required TextEditingController controller,
    String warningText,
    ResetPassBloc resetPassBloc,
    @required BuildContext context,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: ConfigUnit.bold,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: controller,
                validator: (value) {
                  if (value.length == 0) return '$warningText';
                  return null;
                },
                style: TextStyle(
                  fontSize: DoubleUtil.fontSizeLogin,
                  decoration: TextDecoration.none,
                ),
                autocorrect: false,
                obscuringCharacter: '*',
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey),
                  alignLabelWithHint: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
