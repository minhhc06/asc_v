class InfoUserRetirement {
  final int id;
  final String hoDem;
  final String ten;
  final String maNhanSu;
  final String userName;
  final String ngaySinh;
  final int idGioiTinh;
  final String tenGioiTinh;
  final String tenChucVu;
  final String tenNgach;
  final String tenCoQuan;
  final String thoiGianNghiHuu;
  final int ngayNghiHuuTheoQuyDinh;
  final int thangNghiHuuTheoQuyDinh;
  final int namNghiHuuTheoQuyDinh;
  final int ngayLamViecHienTai;
  final int thangLamViecHienTai;
  final int namLamViecHienTai;
  final String tuoiNghiHuuTheoQuyDinh;

  InfoUserRetirement({
    this.id,
    this.hoDem,
    this.ten,
    this.maNhanSu,
    this.userName,
    this.ngaySinh,
    this.idGioiTinh,
    this.tenGioiTinh,
    this.tenChucVu,
    this.tenNgach,
    this.tenCoQuan,
    this.thoiGianNghiHuu,
    this.ngayNghiHuuTheoQuyDinh,
    this.thangNghiHuuTheoQuyDinh,
    this.namNghiHuuTheoQuyDinh,
    this.ngayLamViecHienTai,
    this.thangLamViecHienTai,
    this.namLamViecHienTai,
    this.tuoiNghiHuuTheoQuyDinh,
  });
  factory InfoUserRetirement.formJson(dynamic json) => InfoUserRetirement(
        hoDem: json['hoDem'] ?? '',
        ten: json['ten'] ?? '',
        maNhanSu: json['maNhanSu'] ?? '',
        userName: json['userName'] ?? '',
        ngaySinh: json['ngaySinh'] ?? '',
        tenGioiTinh: json['tenGioiTinh'] ?? '',
        tenChucVu: json['tenChucVu'] ?? '',
        tenNgach: json['tenNgach'] ?? '',
        tenCoQuan: json['tenCoQuan'] ?? '',
        thoiGianNghiHuu: json['thoiGianNghiHuu'] ?? '',
        tuoiNghiHuuTheoQuyDinh: json['tuoiNghiHuuTheoQuyDinh'] ?? '',
        id: json['id'] ?? -1,
        idGioiTinh: json['idGioiTinh'] ?? -1,
        ngayNghiHuuTheoQuyDinh: json['ngayNghiHuuTheoQuyDinh'] ?? -1,
        thangNghiHuuTheoQuyDinh: json['thangNghiHuuTheoQuyDinh'] ?? -1,
        namNghiHuuTheoQuyDinh: json['namNghiHuuTheoQuyDinh'] ?? -1,
        ngayLamViecHienTai: json['ngayLamViecHienTai'] ?? -1,
        thangLamViecHienTai: json['thangLamViecHienTai'] ?? -1,
        namLamViecHienTai: json['namLamViecHienTai'] ?? -1,
      );
}
