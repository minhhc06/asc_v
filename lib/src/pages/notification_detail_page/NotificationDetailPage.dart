import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/repository/api/model/notifi_model/NotificationModel.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';

class NotificationDetailPage extends StatefulWidget {
  const NotificationDetailPage({
    Key key,
    this.notificationModel,
  }) : super(key: key);
  final NotificationModel notificationModel;
  @override
  _NotificationDetailPageState createState() =>
      _NotificationDetailPageState(this.notificationModel);
}

class _NotificationDetailPageState extends State<NotificationDetailPage> {
  final NotificationModel notificationModel;

  _NotificationDetailPageState(this.notificationModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Image.asset(
          AssetUnit.assetsImageTopDark,
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(notificationModel.title != null &&
                  notificationModel.title.split(' ').length > 5
              ? notificationModel.title.split(' ').take(5).join(' ') + '...'
              : notificationModel.title),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          SizedBox(
            child: Container(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Text(
              notificationModel.title,
              style: TextStyle(
                fontFamily: ConfigUnit.roboto,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      notificationModel.author,
                      style: TextStyle(
                        color: MyHexColor(ColorUtil.colorLv1),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Text(
                    notificationModel.time,
                    style: TextStyle(
                      color: MyHexColor(ColorUtil.colorLv2),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: notificationModel.file != null
                  ? [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: MyHexColor(ColorUtil.colorLv3),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Transform.rotate(
                                  angle: 95,
                                  child: Icon(
                                    Icons.attach_file_sharp,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Text(notificationModel.file),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ]
                  : [],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(notificationModel.description),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
