class UserModel {
  final int nhanSuId;
  final String maNhanSu;
  final String hoDem;
  final String ten;
  final String tenGoiKhac;
  final int gioiTinhId;
  final String tenGioiTinh;
  final String ngaySinh;
  final String email;
  final String emailNoiBo;
  final String soDienThoai;
  final int loaiNhanSuId;
  final int coQuanId;
  final String tenCoQuan;
  final int chucVuId;
  final String tenChucVu;
  final int chucDanhId;
  final String tenChucDanh;
  final int userId;
  final int loaiHopDongId;
  final String tenLoaiHopDong;
  final int trangThaiNhanSuId;
  final int doiTuongDanhGiaId;
  final String tenDoiTuongDanhGia;
  final int stt;
  final bool isVisible;
  final String ghiChu;
  final String userName;
  final String tenDonVi;
  final String tenCoQuanCap1;
  final String tenCoQuanTrucThuoc;
  final String tenTrinhDoChuyenMon;
  final String tenTrinhDoNgoaiNgu;
  bool isCheck;

  UserModel({
    this.nhanSuId,
    this.maNhanSu,
    this.hoDem,
    this.ten,
    this.tenGoiKhac,
    this.gioiTinhId,
    this.tenGioiTinh,
    this.ngaySinh,
    this.email,
    this.emailNoiBo,
    this.soDienThoai,
    this.loaiNhanSuId,
    this.coQuanId,
    this.tenCoQuan,
    this.chucVuId,
    this.tenChucVu,
    this.chucDanhId,
    this.tenChucDanh,
    this.userId,
    this.loaiHopDongId,
    this.tenLoaiHopDong,
    this.trangThaiNhanSuId,
    this.doiTuongDanhGiaId,
    this.tenDoiTuongDanhGia,
    this.stt,
    this.isVisible,
    this.ghiChu,
    this.userName,
    this.tenDonVi,
    this.tenCoQuanCap1,
    this.tenCoQuanTrucThuoc,
    this.tenTrinhDoChuyenMon,
    this.tenTrinhDoNgoaiNgu,
    this.isCheck,
  });
  @override
  String toString() => '$hoDem $ten';

  factory UserModel.fromJson(dynamic json) => UserModel(
        maNhanSu: json['maNhanSu'] ?? '',
        hoDem: json['hoDem'] ?? '',
        ten: json['ten'] ?? '',
        tenGoiKhac: json['tenGoiKhac'] ?? '',
        tenGioiTinh: json['tenGioiTinh'] ?? '',
        ngaySinh: json['ngaySinh'] ?? '',
        email: json['email'] ?? '',
        emailNoiBo: json['emailNoiBo'] ?? '',
        soDienThoai: json['soDienThoai'] ?? '',
        tenCoQuan: json['tenCoQuan'] ?? '',
        tenChucVu: json['tenChucVu'] ?? '',
        tenChucDanh: json['tenChucDanh'] ?? '',
        isVisible: json['isVisible;'] ?? false,
        tenLoaiHopDong: json['tenLoaiHopDong'] ?? '',
        tenDoiTuongDanhGia: json['tenDoiTuongDanhGia'] ?? '',
        ghiChu: json['ghiChu'] ?? '',
        userName: json['userName'] ?? '',
        tenDonVi: json['tenDonVi'] ?? '',
        tenCoQuanCap1: json['tenCoQuanCap1'] ?? '',
        tenCoQuanTrucThuoc: json['tenCoQuanTrucThuoc'] ?? '',
        tenTrinhDoChuyenMon: json['tenTrinhDoChuyenMon'] ?? '',
        tenTrinhDoNgoaiNgu: json['tenTrinhDoNgoaiNgu'] ?? '',
        nhanSuId: json['nhanSuId'] ?? -1,
        gioiTinhId: json['gioiTinhId'] ?? -1,
        loaiNhanSuId: json['loaiNhanSuId'] ?? -1,
        coQuanId: json['coQuanId'] ?? -1,
        chucVuId: json['chucVuId'] ?? -1,
        chucDanhId: json['chucDanhId'] ?? -1,
        userId: json['userId'] ?? -1,
        loaiHopDongId: json['loaiHopDongId'] ?? -1,
        trangThaiNhanSuId: json['trangThaiNhanSuId'] ?? -1,
        doiTuongDanhGiaId: json['doiTuongDanhGiaId'] ?? -1,
        stt: json['stt'] ?? -1,
        isCheck: false,
      );
}
