import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/pages/notification_detail_page/NotificationDetailPage.dart';
import 'package:vnu_app/src/repository/api/model/notifi_model/NotificationModel.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    Key key,
    @required this.notificationModel,
  }) : super(key: key);

  final NotificationModel notificationModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationDetailPage(
                notificationModel: notificationModel,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyHexColor(ColorUtil.colorLv5),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Center(
                        child:
                            SvgPicture.asset(notificationModel.category == '1'
                                ? AssetUnit.assetsNotification
                                : notificationModel.category == '2'
                                    ? AssetUnit.assestRetirementApplication
                                    : notificationModel.category == '3'
                                        ? AssetUnit.assetsResignationApplication
                                        : AssetUnit.assetsLeaveOfAbsenceForm),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          notificationModel.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: ConfigUnit.bold,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                notificationModel.author,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ConfigUnit.bold,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black45,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                notificationModel.time,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ConfigUnit.bold,
                                  fontWeight: FontWeight.w100,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          notificationModel.description,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: ConfigUnit.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
