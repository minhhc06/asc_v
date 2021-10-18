import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/repository/api/model/policy_model/PolicyModel.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';

class ListViewItemPolicy extends StatelessWidget {
  const ListViewItemPolicy({Key key, @required this.policyModel})
      : super(key: key);

  final PolicyModel policyModel;

  String formatDay(String date) {
    final dateGet = DateTime.parse(date);
    return '${dateGet.day < 10 ? '0${dateGet.day}' : dateGet.day}/${dateGet.month < 10 ? '0${dateGet.month}' : dateGet.month}/${dateGet.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        // color: isVisibleFloatButton == true ? Colors.white :  Colors.black,
        color: Colors.white,
        child: InkWell(
          onTap: () => {},
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
                        child: SvgPicture.asset(
                            TrangThai.values[policyModel.trangThai].icon),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              policyModel.tenNguoiTao +
                                  policyModel.trangThai.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: ConfigUnit.bold,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  formatDay(policyModel.ngayTao),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ConfigUnit.bold,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            policyModel.tieuDe,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: ConfigUnit.bold,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            policyModel.tieuDe,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: ConfigUnit.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3, bottom: 3, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: MyHexColor(TrangThai
                                      .values[policyModel.trangThai].color),
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                TrangThai.values[policyModel.trangThai].name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ConfigUnit.bold,
                                  fontWeight: FontWeight.w100,
                                  color: MyHexColor(TrangThai
                                      .values[policyModel.trangThai].colorText),
                                ),
                              ),
                            ),
                          ],
                        )
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
