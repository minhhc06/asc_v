import 'package:vnu_app/src/repository/api/model/policy_model/FileInfo.dart';

class ListItemsModelUtil {
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

  ListItemsModelUtil({
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

  factory ListItemsModelUtil.fromJson(dynamic json) {
    return ListItemsModelUtil(
      id: json['id'] ?? -1,
      trangThai: json['trangThai'] != null
          ? (json['trangThai'] < 14 ? json['trangThai'] : 0)
          : 0,
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
