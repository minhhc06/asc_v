import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vnu_app/src/bloc/HomePageBloc/HomePageBloc.dart';
import 'package:vnu_app/src/pages/AccountPage/AccountPage.dart';
import 'package:vnu_app/src/pages/home_page/component/HomePageComponent.dart';
import 'package:vnu_app/src/pages/news_page/NewsPage.dart';
import 'package:vnu_app/src/pages/notification_page/NotificationPage.dart';

import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/share_preference_util/SharePreferenceUtil.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseComponent {
  HomePageBloc homePageBloc;

  @override
  void initState() {
    super.initState();
    if (homePageBloc == null) {
      homePageBloc = new HomePageBloc();
      SharePreferenceUtil()
          .getStringSharePreference(ConfigUnit.avatar)
          .then((value) {
        if (value != null) {
          homePageBloc.setAvatar(value);
        }
      });

      SharePreferenceUtil()
          .getStringSharePreference(WordUtil.fullName)
          .then((value) {
        if (value != null) {
          homePageBloc.setFullName(value);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: MyHexColor(ColorUtil.grayColor),
        body: StreamBuilder<int>(
            stream: homePageBloc.getIndexNavigationBar,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                switch (snapshot.data) {
                  case 0:
                    return HomePageComponent()
                        .buildHomePage(context, homePageBloc);
                    break;

                  case 1:
                    return NotificationPage();
                    break;

                  case 2:
                    return NewsPage();
                    break;

                  case 3:
                    return AccountPage();
                    break;
                }
              }
              return Container();
            }),
        bottomNavigationBar: HomePageComponent().bottomNavigationBarUtil(
            onTapFunction: (int index) {
              homePageBloc.setIndexNavigationBar(index);
            },
            stream: homePageBloc.getIndexNavigationBar),
      ),
    );
  }
}
