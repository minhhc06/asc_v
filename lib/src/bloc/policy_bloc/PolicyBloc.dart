import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/utils/model/ListItemsModelUtil.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class PolicyBloc {
  String title;
  List<ListItemsModelUtil> listPolicy;
  // BehaviorSubject<List<ListItemsModelUtil>> subjectListItemsModelUtil;
  BehaviorSubject<String> subject;

  PolicyBloc({
    this.title,
    this.listPolicy,
  }) {
    // subjectListItemsModelUtil = new BehaviorSubject<List<ListItemsModelUtil>>.seeded(this.listPolicy);
    subject = new BehaviorSubject<String>.seeded(this.title);
    setVisibleFloatButton(true);
    setTrangThai(TrangThai.values[0]);
  }

  Stream<String> get titleStream => subject.stream;
  void setTitle(String title) => subject.sink.add(title);

  BehaviorSubject<TrangThai> subjectTrangThai = new BehaviorSubject<TrangThai>();

  Stream<TrangThai> get trangThaiStream => subjectTrangThai.stream;
  void setTrangThai(TrangThai trangThai) => subjectTrangThai.sink.add(trangThai);

  BehaviorSubject<List<ListItemsModelUtil>> get listPolicyStream =>
      subjectListItemsModelUtil.stream;
  BehaviorSubject<List<ListItemsModelUtil>> subjectListItemsModelUtil =
      BehaviorSubject<List<ListItemsModelUtil>>();

  void setListItemsModelUtil(
      List<ListItemsModelUtil> policies, BuildContext context) {
    Navigator.pop(context);
    return subjectListItemsModelUtil.sink.add(policies);
  }

  void dispose() {
    subject.close();
    subjectTrangThai.close();
    subjectListItemsModelUtil.close();
    _setVisibleFloatButton.close();
  }

  BehaviorSubject<bool> _setVisibleFloatButton = BehaviorSubject<bool>();

  Stream<bool> get getVisibleFloatButton => _setVisibleFloatButton.stream;

  void setVisibleFloatButton(bool isVisible) {
    _setVisibleFloatButton.sink.add(isVisible);
  }
}
