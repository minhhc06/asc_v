import 'package:flutter/material.dart';
import 'package:vnu_app/src/pages/home_page/HomePage.dart';
import 'package:vnu_app/src/pages/select_login_type/SelectLoginTypePage.dart';
import 'package:vnu_app/src/utils/constants.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkLogin() {
    Future.delayed(
      Duration(seconds: 3),
      () async {
        final sessionApi = await SharePreferenceUtil()
            .getStringSharePreference(ConfigUnit.accessToken);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                sessionApi != null ? HomePage() : SelectTypeLoginPage(),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Image.asset(
            plashScreen,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
