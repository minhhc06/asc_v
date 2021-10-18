import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/login_bloc/LoginBloc.dart';
import 'package:vnu_app/src/repository/components/login_component/LoginComponet.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class LoginPage extends StatefulWidget {
  final LoginType loginType;
  LoginPage({Key key, this.loginType}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with BaseComponent {
  TextEditingController usernameController =
      new TextEditingController(text: 'khoand');
  TextEditingController passwordController =
      new TextEditingController(text: '1111');
  LoginBloc loginBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    init();
    return SafeArea(
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                panelLogoUniversity(context: context),
                SizedBox(
                  height: 32,
                ),
                Expanded(
                    flex: 5,
                    child: LoginComponent().handleInput(
                        key: _formKey,
                        usernameController: usernameController,
                        passwordController: passwordController,
                        steamIsInvisiblePassword:
                            loginBloc.getIsInvisiblePassword,
                        loginBloc: loginBloc,
                        context: context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  init() {
    loginBloc = new LoginBloc();
  }
}
