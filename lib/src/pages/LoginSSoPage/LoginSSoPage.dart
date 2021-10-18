import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:uuid/uuid.dart';
import 'package:vnu_app/src/bloc/LoginSSoBloc/LoginSSoBloc.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class LoginSSO extends StatefulWidget {
  @override
  _LoginSSOState createState() => new _LoginSSOState();
}

class _LoginSSOState extends State<LoginSSO> with BaseComponent {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  LoginSSoBloc bloc;
  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  String token;

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (bloc == null) {
      bloc = LoginSSoBloc();
    }

    flutterWebviewPlugin.close();

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebviewPlugin.onDestroy.listen((_) {
      // print("destroy");
    });

    _onStateChanged =
        flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      // print("onStateChanged: ${state.type} ${state.url}");
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          if (url.startsWith(
              'https://hrm.vnu.edu.vn/oauth/callback?session_state=')) {
            // RegExp regExp = new RegExp("session_state=(.*)");
            // this.token = regExp.firstMatch(url)?.group(1);
            // print("token $token");
            // const url = new URL();
            // saveToken(token);
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //     "/home", (Route<dynamic> route) => false);

            print("URL changed: $url");
            var uri = Uri.parse('$url');
            uri.queryParameters.forEach((k, v) {
              print('key: $k - value: $v');
            });

            String uuid = getUuid();
            print('uuId $uuid');

            // flutterWebviewPlugin.close();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String loginUrl =
        "https://idp.vnu.edu.vn/auth/realms/vnu/protocol/openid-connect/auth?kc_locale=vi&scope=openid&response_type=code&client_id=hrm&redirect_uri=https://hrm.vnu.edu.vn/oauth/callback";

    return StreamBuilder<bool>(
        stream: bloc.getIsLoading,
        builder: (context, snapshot) {
          if (snapshot.data == true) {
            return Container(
              color: Colors.white,
            );
          }
          return new WebviewScaffold(
              url: loginUrl,
              appBar: appBarUtil(
                  title: WordUtil.loginSSO,
                  context: context,
                  iconDataBack: Icons.arrow_back_ios));
        });
  }

  String getUuid() {
    var uuid = Uuid();
    var v1 = uuid.v1();
    return v1;
  }
}
