import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/notification_bloc/NotificationBloc.dart';
import 'package:vnu_app/src/pages/notification_page/components/ListViewItem.dart';
import 'package:vnu_app/src/repository/api/model/notifi_model/NotificationModel.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ComponentAllNotification extends StatelessWidget {
  const ComponentAllNotification({
    Key key,
    this.notificationBloc,
  }) : super(key: key);
  final NotificationBloc notificationBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white70,
      height: MediaQuery.of(context).size.height,
      child: StreamBuilder<List<NotificationModel>>(
        stream: notificationBloc.listNotificationStream,
        builder: (context, snapshot) {
          if (snapshot.data == null) return Text(WordUtil.loadding);
          return SingleChildScrollView(
            child: Column(
              children: snapshot.data
                  .map(
                    (item) => ListViewItem(
                      notificationModel: item,
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}
