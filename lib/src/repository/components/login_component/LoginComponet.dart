import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/login_bloc/LoginBloc.dart';
import 'package:vnu_app/src/repository/api/model/login_model/LoginModelRequestApi.dart';
import 'package:vnu_app/src/repository/api/provider/login_provider/LoginProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';
import 'package:uuid/uuid.dart';
import 'package:vnu_app/src/validators/validators.dart';

import '../../../utils/word/WordUtil.dart';

class LoginComponent extends BaseComponent {
  Widget handleInput({
    TextEditingController usernameController,
    TextEditingController passwordController,
    Stream steamIsInvisiblePassword,
    LoginBloc loginBloc,
    GlobalKey<FormState> key,
    BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: key,
        child: Column(
          children: [
            ///username
            _buildInputFromTextFromFieldV2(
              validator: (String value) => LoginValidation().isUsername(value),
              label: '${WordUtil.username}',
              hintText: '${WordUtil.username}',
              context: context,
              icon: Icon(Icons.person),
              controller: usernameController,
            ),
            SizedBox(height: DoubleUtil.height8Login),

            ///password
            StreamBuilder<bool>(
                stream: steamIsInvisiblePassword,
                builder: (context, snapshot) {
                  return _buildInputFromTextFromFieldV2(
                    validator: (String value) =>
                        LoginValidation().isPassword(value),
                    label: '${WordUtil.password}',
                    hintText: '${WordUtil.password}',
                    isPassword: true,
                    controller: passwordController,
                    isInvisible: snapshot.data,
                    loginBloc: loginBloc,
                    icon: Icon(Icons.lock_rounded),
                    context: context,
                  );
                }),
            SizedBox(height: DoubleUtil.height16Login),

            ///button login
            buildTextButton(
              context: context,
              text: WordUtil.login,
              textColor: Colors.white,
              buttonColor: MyHexColor(ColorUtil.green),
              onPressed: () async {
                // loginBloc.setIsLoading(true);
                if (key.currentState.validate()) {
                  handleRequestApiLogin(
                      usernameController: usernameController,
                      passwordController: passwordController,
                      context: context,
                      bloc: loginBloc);
                }
              },
            ),
            SizedBox(height: 8),

            ///forgetPassword
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: MyHexColor(ColorUtil.green),
                          ),
                          Text(
                            '${WordUtil.back}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: ConfigUnit.roboto,
                              color: MyHexColor(ColorUtil.green),
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputFromTextFromField({
    String label,
    @required String hintText,
    bool isPassword,
    @required TextEditingController controller,
    String warningText,
    bool isInvisible,
    LoginBloc loginBloc,
  }) {
    return TextFormField(
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
      obscureText: isPassword == true
          ? isInvisible != null
              ? !isInvisible
              : true
          : false,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        suffixIcon: isPassword == true
            ? GestureDetector(
                child: InkWell(
                  onTap: () {
                    loginBloc.setIsInvisiblePassword(
                        isInvisible != null ? !isInvisible : true);
                  },
                  child: Container(
                    child: isInvisible == true
                        ? Icon(Icons.remove_red_eye_outlined)
                        : Icon(Icons.remove_red_eye),
                  ),
                ),
              )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        labelText: label != null ? label : null,
        labelStyle: label != null ? TextStyle(color: Colors.green) : null,
        alignLabelWithHint: true,
      ),
    );
  }

  Widget _buildInputFromTextFromFieldV2({
    @required String label,
    @required String hintText,
    bool isPassword,
    @required TextEditingController controller,
    bool isInvisible,
    LoginBloc loginBloc,
    @required BuildContext context,
    Icon icon,
    @required Function validator,
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
          TextFormField(
            controller: controller,
            validator: (String value) => validator(value),
            style: TextStyle(
              fontSize: DoubleUtil.fontSizeLogin16,
              decoration: TextDecoration.none,
            ),
            autocorrect: false,
            obscureText: isPassword == true
                ? isInvisible != null
                    ? !isInvisible
                    : true
                : false,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
              prefixIcon: icon,
              suffixIcon: isPassword == true
                  ? GestureDetector(
                      child: InkWell(
                        onTap: () {
                          loginBloc.setIsInvisiblePassword(
                              isInvisible != null ? !isInvisible : true);
                        },
                        child: Container(
                          child: isInvisible == true
                              ? Icon(Icons.remove_red_eye_outlined)
                              : Icon(Icons.remove_red_eye),
                        ),
                      ),
                    )
                  : null,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              alignLabelWithHint: true,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleRequestApiLogin(
      {TextEditingController usernameController,
      TextEditingController passwordController,
      BuildContext context,
      @required LoginBloc bloc}) {
    // bloc.setIsLoading(true);

    LoginModelRequestApi loginModelRequestApi = new LoginModelRequestApi(
        username: usernameController.text,
        password: passwordController.text,
        sessionCode: '${getUuid()}');
    dialogProcessing(context: context);

    LoginProvider loginProvider = new LoginProvider();
    loginProvider.loginRequestApiProvider(
        loginModelRequestApi: loginModelRequestApi,
        context: context,
        bloc: bloc);
    return null;
  }

  String getUuid() {
    var uuid = Uuid();
    var v1 = uuid.v1();
    return v1;
  }
}
