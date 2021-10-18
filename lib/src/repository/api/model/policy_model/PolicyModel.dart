import 'package:vnu_app/src/repository/api/model/policy_model/FileInfo.dart';

class PolicyModel {
  int id;
  int trangThai;
  int loaiDon;
  int flag;
  int idNhanSuTao;
  String tieuDe;
  String tenTrangThai;
  String ngayTao;
  String tenNguoiTao;
  String tenChucDanhNguoiTao;
  bool isDinhKem;
  bool isXem;
  List<FileInfo> fileDinhKems;

  PolicyModel({
    this.id,
    this.trangThai,
    this.loaiDon,
    this.flag,
    this.idNhanSuTao,
    this.tieuDe,
    this.tenTrangThai,
    this.ngayTao,
    this.tenNguoiTao,
    this.tenChucDanhNguoiTao,
    this.isDinhKem,
    this.isXem,
    this.fileDinhKems,
  });

  factory PolicyModel.fromJson(dynamic json) {
    return PolicyModel(
      id: json['id'] ?? -1,
      trangThai: json['trangThai'] ?? -1,
      loaiDon: json['loaiDon'] ?? -1,
      flag: json['flag'] ?? -1,
      idNhanSuTao: json['idNhanSuTao'] ?? -1,
      tieuDe: json['tieuDe'] ?? '',
      tenTrangThai: json['tenTrangThai'] ?? '',
      ngayTao: json['ngayTao'] ?? '',
      tenNguoiTao: json['tenNguoiTao'] ?? '',
      tenChucDanhNguoiTao: json['tenChucDanhNguoiTao'] ?? '',
      isDinhKem: json['isDinhKem'] ?? false,
      isXem: json['isXem'] ?? false,
      fileDinhKems: (json['fileDinhKems'] as List<dynamic>)
          .map(
            (e) => FileInfo.fromJson(e),
          )
          .toList(),
    );
  }
}
