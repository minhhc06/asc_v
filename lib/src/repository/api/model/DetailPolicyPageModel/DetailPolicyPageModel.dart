import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/FileDinhKemBanHanhsModel.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/LeaveModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/FilesResponseModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/NhanSuCCsModel.dart';

class DetailPolicyPageModel {
  int id;
  int loaiDon;
  String tenLoaiDon;
  String tieuDe;
  String noiDung;
  String thoiGian;
  int trangThai;
  String tenTrangThai;
  int idCoQuan;
  int idCoQuanTrucThuoc;
  String tenCoQuanNhanSuNghiHuu;
  String tenCoQuanCap1NhanSuNghiHuu;
  String tenCoQuanTrucThuocNhanSuNghiHuu;
  int idNhanSuTao;
  String hoDemNhanSuTao;
  String tenNhanSuTao;
  String ngaySinhNhanSuTao;
  String soDienThoaiNhanSuTao;
  String tenChucVuNhanSuTao;
  String tenCoQuanNhanSuTao;
  String chucDanhNgheNghiepNhanSuNghiHuu;
  int idHopDong;
  int idLoaiHopDong;
  String soHopDong;
  String tenLoaiHopDong;
  String hdTuNgay;
  String hdDenNgay;
  dynamic ngayKy;
  int idNhanSuDuyet;
  String hoDemNhanSuDuyet;
  String tenNhanSuDuyet;
  String tenChucVuNhanSuDuyet;
  String ngayNhanBanGiao;
  int idNhanSuNhan;
  String hoDemNhanSuNhan;
  String tenNhanSuNhan;
  int idNhanSuNghiHuu;
  String hoDemNhanSuNghiHuu;
  String tenNhanSuNghiHuu;
  String tenChucVuNhanSuNghiHuu;
  String ngaySinhNhanSuNghiHuu;
  String soBHXHNhanSuNghiHuu;
  String soDienThoaiNhanSuNghiHuu;
  int loaiDonNhan;
  String ngayTao;
  String lyDoDuyet;
  String ngayDuyet;
  String thoiGianDen;
  int idDonTuNghiHuu;
  String ngayHuongBHXH;
  String noiCuTruSauKhiNghi;
  String noiKhamChuaBenh;
  String noiNhan;
  String ghiChuNghiHuu;
  String soThongBao;
  int ngayNghiHuuTheoQuyDinh;
  int thangNghiHuuTheoQuyDinh;
  int namNghiHuuTheoQuyDinh;
  String thoiGianNghiHuu;
  bool isDuyet;
  bool isTrinh;
  bool isXinYKien;
  bool isChoYKien;
  bool isTaoQuyetDinh;
  bool isBanHanhThongBao;
  bool isNhapThongTinNghiHuu;
  List<LeaveModel> thoiGianNghiPheps;
  List<dynamic> lyDoNghiPheps;
  String lyDoNghiPhepsString;
  List<FileDinhKemBanHanhsModel> fileDinhKems;
  List<FilesResponseModel> listFiles;
  List<NhanSuCCsModel> nhanSuCCs;

  int idNhanSuNhanBanGiao;
  String hoDemNhanSuNhanBanGiao;
  String tenNhanSuNhanBanGiao;

  DetailPolicyPageModel({
    this.id,
    this.loaiDon,
    this.tenLoaiDon,
    this.tieuDe,
    this.noiDung,
    this.thoiGian,
    this.trangThai,
    this.tenTrangThai,
    this.idCoQuan,
    this.idCoQuanTrucThuoc,
    this.tenCoQuanNhanSuNghiHuu,
    this.tenCoQuanCap1NhanSuNghiHuu,
    this.tenCoQuanTrucThuocNhanSuNghiHuu,
    this.idNhanSuTao,
    this.hoDemNhanSuTao,
    this.tenNhanSuTao,
    this.ngaySinhNhanSuTao,
    this.soDienThoaiNhanSuTao,
    this.tenChucVuNhanSuTao,
    this.tenCoQuanNhanSuTao,
    this.chucDanhNgheNghiepNhanSuNghiHuu,
    this.idHopDong,
    this.idLoaiHopDong,
    this.soHopDong,
    this.tenLoaiHopDong,
    this.hdTuNgay,
    this.hdDenNgay,
    this.ngayKy,
    this.idNhanSuDuyet,
    this.hoDemNhanSuDuyet,
    this.tenNhanSuDuyet,
    this.tenChucVuNhanSuDuyet,
    this.ngayNhanBanGiao,
    this.idNhanSuNghiHuu,
    this.hoDemNhanSuNghiHuu,
    this.tenNhanSuNghiHuu,
    this.tenChucVuNhanSuNghiHuu,
    this.ngaySinhNhanSuNghiHuu,
    this.soBHXHNhanSuNghiHuu,
    this.soDienThoaiNhanSuNghiHuu,
    this.loaiDonNhan,
    this.ngayTao,
    this.lyDoDuyet,
    this.ngayDuyet,
    this.thoiGianDen,
    this.idDonTuNghiHuu,
    this.ngayHuongBHXH,
    this.noiCuTruSauKhiNghi,
    this.noiKhamChuaBenh,
    this.noiNhan,
    this.ghiChuNghiHuu,
    this.soThongBao,
    this.ngayNghiHuuTheoQuyDinh,
    this.thangNghiHuuTheoQuyDinh,
    this.namNghiHuuTheoQuyDinh,
    this.thoiGianNghiHuu,
    this.isDuyet,
    this.isTrinh,
    this.isXinYKien,
    this.isChoYKien,
    this.isTaoQuyetDinh,
    this.isBanHanhThongBao,
    this.lyDoNghiPheps,
    this.idNhanSuNhanBanGiao,
    this.hoDemNhanSuNhanBanGiao,
    this.tenNhanSuNhanBanGiao,
    this.idNhanSuNhan,
    this.hoDemNhanSuNhan,
    this.tenNhanSuNhan,
    this.fileDinhKems,
    this.listFiles,
    this.nhanSuCCs,
    this.isNhapThongTinNghiHuu,
    this.thoiGianNghiPheps,
    this.lyDoNghiPhepsString,
  });

  factory DetailPolicyPageModel.fromJson(dynamic json) {
    return DetailPolicyPageModel(
      id: json['id'] ?? -1,
      loaiDon: json['loaiDon'] ?? -1,
      tenLoaiDon: json['tenLoaiDon'] ?? '',
      tieuDe: json['tieuDe'] ?? '',
      noiDung: json['noiDung'] ?? '',
      thoiGian: json['thoiGian'] ?? '',
      trangThai: json['trangThai'],
      tenTrangThai: json['tenTrangThai'] ?? '',
      idCoQuan: json['idCoQuan'],
      idCoQuanTrucThuoc: json['idCoQuanTrucThuoc'],
      tenCoQuanNhanSuNghiHuu: json['tenCoQuanNhanSuNghiHuu'] ?? '',
      tenCoQuanCap1NhanSuNghiHuu: json['tenCoQuanCap1NhanSuNghiHuu'] ?? '',
      tenCoQuanTrucThuocNhanSuNghiHuu:
          json['tenCoQuanTrucThuocNhanSuNghiHuu'] ?? '',
      idNhanSuTao: json['idNhanSuTao'],
      hoDemNhanSuTao: json['hoDemNhanSuTao'] ?? '',
      tenNhanSuTao: json['tenNhanSuTao'] ?? '',
      ngaySinhNhanSuTao: json['ngaySinhNhanSuTao'] ?? '',
      soDienThoaiNhanSuTao: json['soDienThoaiNhanSuTao'] ?? '',
      tenChucVuNhanSuTao: json['tenChucVuNhanSuTao'] ?? '',
      tenCoQuanNhanSuTao: json['tenCoQuanNhanSuTao'] ?? '',
      chucDanhNgheNghiepNhanSuNghiHuu:
          json['chucDanhNgheNghiepNhanSuNghiHuu'] ?? '',
      idHopDong: json['idHopDong'],
      idLoaiHopDong: json['idLoaiHopDong'],
      soHopDong: json['soHopDong'] ?? '',
      tenLoaiHopDong: json['tenLoaiHopDong'] ?? '',
      hdTuNgay: json['hdTuNgay'] ?? '',
      hdDenNgay: json['hdDenNgay'] ?? '',
      ngayKy: json['ngayKy'] ?? '',
      idNhanSuDuyet: json['idNhanSuDuyet'],
      hoDemNhanSuDuyet: json['hoDemNhanSuDuyet'] ?? '',
      tenNhanSuDuyet: json['tenNhanSuDuyet'] ?? '',
      tenChucVuNhanSuDuyet: json['tenChucVuNhanSuDuyet'] ?? '',
      ngayNhanBanGiao: json['ngayNhanBanGiao'] ?? '',
      idNhanSuNhan: json['idNhanSuNhan'] ?? -1,
      hoDemNhanSuNhan: json['hoDemNhanSuNhan'] ?? '',
      tenNhanSuNhan: json['tenNhanSuNhan'] ?? '',
      idNhanSuNghiHuu: json['idNhanSuNghiHuu'],
      hoDemNhanSuNghiHuu: json['hoDemNhanSuNghiHuu'] ?? '',
      tenNhanSuNghiHuu: json['tenNhanSuNghiHuu'] ?? '',
      tenChucVuNhanSuNghiHuu: json['tenChucVuNhanSuNghiHuu'] ?? '',
      ngaySinhNhanSuNghiHuu: json['ngaySinhNhanSuNghiHuu'] ?? '',
      soBHXHNhanSuNghiHuu: json['soBHXHNhanSuNghiHuu'] ?? '',
      soDienThoaiNhanSuNghiHuu: json['soDienThoaiNhanSuNghiHuu'] ?? '',
      loaiDonNhan: json['loaiDonNhan'],
      ngayTao: json['ngayTao'] ?? '',
      lyDoDuyet: json['lyDoDuyet'] ?? '',
      ngayDuyet: json['ngayDuyet'] ?? '',
      thoiGianDen: json['thoiGianDen'] ?? '',
      idDonTuNghiHuu: json['idDonTuNghiHuu'],
      ngayHuongBHXH: json['ngayHuongBHXH'] ?? '',
      noiCuTruSauKhiNghi: json['noiCuTruSauKhiNghi'] ?? '',
      noiKhamChuaBenh: json['noiKhamChuaBenh'] ?? '',
      noiNhan: json['noiNhan'] ?? '',
      ghiChuNghiHuu: json['ghiChuNghiHuu'] ?? '',
      soThongBao: json['soThongBao'] ?? '',
      ngayNghiHuuTheoQuyDinh: json['ngayNghiHuuTheoQuyDinh'],
      thangNghiHuuTheoQuyDinh: json['thangNghiHuuTheoQuyDinh'],
      namNghiHuuTheoQuyDinh: json['namNghiHuuTheoQuyDinh'],
      thoiGianNghiHuu: json['thoiGianNghiHuu'],
      isDuyet: json['isDuyet'],
      isTrinh: json['isTrinh'],
      isXinYKien: json['isXinYKien'],
      isChoYKien: json['isChoYKien'],
      isTaoQuyetDinh: json['isTaoQuyetDinh'],
      isBanHanhThongBao: json['isBanHanhThongBao'],
      isNhapThongTinNghiHuu: json['isNhapThongTinNghiHuu'],
      lyDoNghiPheps: json['lyDoNghiPheps'] ?? [],
      idNhanSuNhanBanGiao: json['idNhanSuNhanBanGiao'] ?? -1,
      hoDemNhanSuNhanBanGiao: json['hoDemNhanSuNhanBanGiao'] ?? '',
      tenNhanSuNhanBanGiao: json['tenNhanSuNhanBanGiao'] ?? '',
      thoiGianNghiPheps: json['thoiGianNghiPheps'] != null
          ? (json['thoiGianNghiPheps'] as List<dynamic>)
              .map(
                (e) => LeaveModel.fromJson(e),
              )
              .toList()
          : [],
      listFiles: json['fileDinhKems'] != null
          ? (json['fileDinhKems'] as List<dynamic>)
              .map(
                (e) => FilesResponseModel.fromJsonListFiles(e),
              )
              .toList()
          : [],
      fileDinhKems: json['fileDinhKems'] != null
          ? (json['fileDinhKems'] as List<dynamic>)
              .map(
                (e) => FileDinhKemBanHanhsModel.fromJson(e),
              )
              .toList()
          : [],
      nhanSuCCs: json['nhanSuCCs'] != null
          ? (json['nhanSuCCs'] as List<dynamic>)
              .map(
                (e) => NhanSuCCsModel.fromJson(e),
              )
              .toList()
          : [],
    );
  }
}
