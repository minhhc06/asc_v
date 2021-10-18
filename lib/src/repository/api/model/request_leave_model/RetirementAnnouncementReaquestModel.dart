class RetirementAnnouncementReaquestModel {
  int id;
  String tieuDe;
  int idNhanSuDuyet;
  int idNhanSuNghiHuu;
  List<int> idsFileDinhKem;
  int loaiDon;
  String coQuanNSNH;
  String gioiTinhNSNH;
  String ngaySinhNSNH;
  String tenChucVuNSNH;
  String tenNgachNSNH;
  String tuoiNghiHuuTheoQD;
  String tuoiNghiHuuTheoTB;
  String noiNhan;
  String tenChucVuNSDuyet;
  String ngayHuongBHXH;
  RetirementAnnouncementReaquestModel({
    this.idsFileDinhKem,
    this.tieuDe,
    this.id,
    this.loaiDon,
    this.coQuanNSNH,
    this.gioiTinhNSNH,
    this.idNhanSuDuyet,
    this.idNhanSuNghiHuu,
    this.ngayHuongBHXH,
    this.ngaySinhNSNH,
    this.noiNhan,
    this.tenChucVuNSDuyet,
    this.tenChucVuNSNH,
    this.tenNgachNSNH,
    this.tuoiNghiHuuTheoQD,
    this.tuoiNghiHuuTheoTB,
  });
  Map<String, dynamic> toJson() => {
        'idsFileDinhKem': idsFileDinhKem,
        'tieuDe': tieuDe,
        'id': id,
        'loaiDon': loaiDon,
        'coQuanNSNH': coQuanNSNH,
        'gioiTinhNSNH': gioiTinhNSNH,
        'idNhanSuDuyet': idNhanSuDuyet,
        'idNhanSuNghiHuu': idNhanSuNghiHuu,
        'ngayHuongBHXH': ngayHuongBHXH,
        'ngaySinhNSNH': ngaySinhNSNH,
        'noiNhan': noiNhan,
        'tenChucVuNSDuyet': tenChucVuNSDuyet,
        'tenChucVuNSNH': tenChucVuNSNH,
        'tenNgachNSNH': tenNgachNSNH,
        'tuoiNghiHuuTheoQD': tuoiNghiHuuTheoQD,
        'tuoiNghiHuuTheoTB': tuoiNghiHuuTheoTB,
      };
}
