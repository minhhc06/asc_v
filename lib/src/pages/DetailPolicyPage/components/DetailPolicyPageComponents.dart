import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/LeaveModel.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/IntUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';
// import 'dart:html';

class DetailPolicyPageComponents extends BaseComponent {
  Widget buildTitle(DetailPolicyPageModel item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Text(
                      '${item.tieuDe}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 2,
                    )),
                Expanded(flex: 1, child: Text('${formatDay(item.ngayTao)}'))
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: MyHexColor(TrangThai.values[item.trangThai].color),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  '${item.tenTrangThai}',
                  style: TextStyle(
                      color: MyHexColor(
                          TrangThai.values[item.trangThai].colorText)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildContent(
      {String title, String value, String titleRight, String valueRight}) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title'),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '$value',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
              ),
              valueRight != null
                  ? Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$titleRight'),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '$valueRight',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContentList({
    Map<String, String> left,
    Map<String, String> right,
  }) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (left != null)
                      ...left.keys
                          .map(
                            (item) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('$item'),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${left[item]}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                          .toList()
                  ],
                ),
              ),
              if (right != null)
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (right != null)
                        ...right.keys
                            .map(
                              (item) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$item'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '${right[item]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            )
                            .toList()
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView({List<LeaveModel> list}) {
    return Card(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: list.length,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return _buildItemsList(item: list[index]);
          }),
    );
  }

  Widget buildContentLeave({DetailPolicyPageModel model, int type}) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${WordUtil.content}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(' ${type == 1 ? WordUtil.lyDoChamDutHopDongV2 + model.noiDung : WordUtil.reasonTag + model.lyDoNghiPhepsString} \n'
                      '- ${WordUtil.handOver}: ${model.hoDemNhanSuNhanBanGiao} ${model.tenNhanSuNhanBanGiao}\n'
                      '${type == 1 ? '' : '- ${WordUtil.note}: ' + model.noiDung}' +
                  '${type == 1 ? WordUtil.endContractDate + BaseComponent().formatDay(model.thoiGian) : ""}'
                      '${type == 1 ? WordUtil.endFinishContractDate + BaseComponent().formatDay(model.ngayNhanBanGiao) : ""}')
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  Widget handleFileComponent(
      {DetailPolicyPageModel model, BuildContext context}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              WordUtil.attachSignle,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: model.fileDinhKems.length,
                itemBuilder: (BuildContext context, int index) {
                  return listItemFile(
                      path:
                          '${ConfigUnit.linkMedia + model.fileDinhKems[index].pathFileDinhKem}',
                      context: context);
                }),
          ],
        ),
      ),
    );
  }

  Widget listItemFile({String path, BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () async {
          _launchURL(path);
        },
        child: Text(
          '${path?.split('/')[path.split('/').length - 1]}',
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  void checkString({String path}) {
    String substring = ".jpg";

    bool isHave = path.contains(substring);

    print('is have ne $isHave');
  }

  Widget _buildItemsList({LeaveModel item}) {
    return Padding(
      padding: const EdgeInsets.all(DoubleUtil.padding8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(WordUtil.leaveDay),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${formatDay(item.ngayNghi)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(WordUtil.leaveSession),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${_handleShift(item.caNghi)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _handleStatus(int status) {
    switch (status) {
      case IntUnit.statusCreateNew:
        return '#fff494';
        break;
      case IntUnit.statusRequest:
        return '#d7d309';
        break;
      case IntUnit.statusSubmit:
        return '#E8B200';
        break;
      case IntUnit.statusAccept:
        return '#83e325';
        break;
      case IntUnit.statusReject:
        return '#f64e60';
        break;
      case IntUnit.statusCreateDecision:
        return '#16c17a';
        break;
      case IntUnit.statusPublishDecision:
        return '#e4ba25';
        break;
      case IntUnit.statusPublishNotification:
        return '#e4ba25';
        break;
      case IntUnit.statusTccbAccept:
        return '#d2f5b0';
        break;
      case IntUnit.statusTccbUnaccepted:
        return '#f64e60';
        break;
    }
  }

  String _handleShift(int shift) {
    switch (shift) {
      case IntUnit.shiftAllDay:
        return WordUtil.allDay;
        break;

      case 2:
        return WordUtil.morning;
        break;
      case 3:
        return WordUtil.afternoon;
        break;
    }
  }
}
