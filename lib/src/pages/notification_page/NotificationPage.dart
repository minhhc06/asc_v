import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/notification_bloc/NotificationBloc.dart';
import 'package:vnu_app/src/pages/notification_page/components/ButtonAppBar.dart';
import 'package:vnu_app/src/pages/notification_page/components/ComponentAllNotification.dart';
import 'package:vnu_app/src/pages/notification_page/components/TabBarCustom.dart';
import 'package:vnu_app/src/repository/api/model/notifi_model/NotificationModel.dart';
import 'package:vnu_app/src/repository/api/provider/NotificationProvider/NotificationProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with BaseComponent, TickerProviderStateMixin {
  final listTabBar = [
    WordUtil.all,
    WordUtil.evaluate,
    WordUtil.leaveOfAbsence,
    WordUtil.resignation,
  ];
  NotificationBloc bloc;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    bloc = new NotificationBloc(
      index: 0,
    );
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    NotificationProvider().buildListNotification(context: context, bloc: bloc);
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('${AssetUnit.assetsImageTopDark}'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabBarCustom(),
                  StreamBuilder<List<NotificationModel>>(
                    stream: bloc.subjectNotifi,
                    builder: (_, snapshot) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listTabBar.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ButtonAppBar(
                          function: () {
                            bloc.setListNotification(index == 0
                                ? snapshot.data
                                : snapshot.data
                                    .where((element) =>
                                        element.category == '$index')
                                    .toList());
                          },
                          buttonIndex: index,
                          notificationCount: 0,
                          textButton: listTabBar[index],
                          bloc: bloc,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 40,
              child: ComponentAllNotification(
                notificationBloc: bloc,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
