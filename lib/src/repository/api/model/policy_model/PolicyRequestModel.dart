import 'package:flutter/cupertino.dart';

class PolicyReqyestModel {
  final int pageSize;
  final int pageNumber;
  final String sortName;
  final bool sortASC;
  final String keyword;
  final int loaiDon;
  final int trangThai;
  final String tuNgay;
  final String denNgay;
  final String lstIDNhanSuNhan;
  final String lstIDNhanSuGui;
  final int flag;
  final bool isXem;
  final bool isFile;

  PolicyReqyestModel({
    @required this.pageSize,
    @required this.pageNumber,
    @required this.sortName,
    this.sortASC = false,
    this.keyword,
    this.loaiDon,
    this.trangThai,
    this.tuNgay,
    this.denNgay,
    this.lstIDNhanSuNhan,
    this.lstIDNhanSuGui,
    this.flag,
    this.isXem,
    this.isFile,
  });

  Map<String, dynamic> toJson() => {
        'pageSize': pageSize,
        'pageNumber': pageNumber,
        'sortName': sortName,
        'sortASC': sortASC,
        'keyword': keyword,
        'loaiDon': loaiDon,
        'trangThai': trangThai,
        'tuNgay': tuNgay,
        'denNgay': denNgay,
        'lstIDNhanSuNhan': lstIDNhanSuNhan,
        'lstIDNhanSuGui': lstIDNhanSuGui,
        'flag': flag,
        'isXem': isXem,
        'isFile': isFile,
      };
}
