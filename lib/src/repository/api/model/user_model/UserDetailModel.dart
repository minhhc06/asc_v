import 'package:vnu_app/src/repository/api/model/user_model/CompareData.dart';
import 'package:vnu_app/src/repository/api/model/user_model/FileKetQuaUngTuyen.dart';

class UserDetailModel {
  final int idNhanSu;
  final String maNhanSu;
  final String hoDem;
  final String ten;
  final String tenGoiKhac;
  final int idGioiTinh;
  final String email;
  final String emailNoiBo;
  final String soDienThoai;
  final int idLoaiNhanSu;
  final int idCoQuan;
  final int idChucDanh;
  final int idChucVu;
  final int idLoaiHopDong;
  final int idDoiTuongDanhGia;
  final int idUser;
  final int stt;
  final int idTrangThaiNhanSu;
  final String ghiChuNhanSu;
  final bool isVisible;
  final String ngaySinh;
  final bool isGiangVien;
  final bool isNghienCuuVien;
  final bool isThamGiaNVCL;
  final bool isThamGiaGiangDayCL;
  final bool isThamGiaQuanLyCL;
  final bool isQuanLySach;
  final int idLoaiNhanSuDanhGia;
  final int idHinhNhanSu;
  final String nameHinhNhanSu;
  final int typeHinhNhanSu;
  final int sizeHinhNhanSu;
  final String pathHinhNhanSu;
  final bool forWebHinhNhanSu;
  final String checkSumHinhNhanSu;
  final String guidIdHinhNhanSu;
  final int idNhanSuChiTiet;
  final int idTrangThaiDuLieu;
  final int idNhanSuDuyet;
  final String soCMND;
  final String ngayCapCMND;
  final int idDanToc;
  final int idTonGiao;
  final int idGiaDinhChinhSach;
  final int noiSinh_IDTinh;
  final int noiSinh_IDHuyen;
  final int noiSinh_IDPhuongXa;
  final int queQuan_IDTinh;
  final int queQuan_IDHuyen;
  final int queQuan_IDPhuongXa;
  final int hktT_IDQuocGia;
  final int hktT_IDTinh;
  final int hktT_IDHuyen;
  final int hktT_IDPhuongXa;
  final String hktT_SoNha;
  final String hktT_TenQuocGia;
  final int dclL_IDQuocGia;
  final int dclL_IDTinh;
  final int dclL_IDHuyen;
  final int dclL_IDPhuongXa;
  final String dclL_SoNha;
  final String noiCapCMND;
  final String hoChieu;
  final String ngayCapHoChieu;
  final String noiCapHoChieu;
  final int noiSinh_IDQuocGia;
  final String noiSinh_SoNha;
  final int queQuan_IDQuocGia;
  final String queQuan_SoNha;
  final String dienThoaiNhaRieng;
  final String dienThoaiCoQuan;
  final String soBHXH;
  final int idTinhTrangHonNhan;
  final int idFileDinhKem;
  final String nameFileDinhKem;
  final int typeFileDinhKem;
  final int sizeFileDinhKem;
  final String pathFileDinhKem;
  final bool forWebFileDinhKem;
  final String checkSumFileDinhKem;
  final String ghiChuNhanSuChiTiet;
  final String tenGioiTinh;
  final String tenChucVu;
  final String tenDanToc;
  final String tenTonGiao;
  final String tenLoaiHopDong;
  final String tenTrangThaiNhanSu;
  final String tenDoiTuongChinhSach;
  final String tenTinhTrangHonNhan;
  final String noiSinh_TenTinh;
  final String noiSinh_TenHuyen;
  final String noiSinh_TenPhuongXa;
  final String noiSinh_TenQuocGia;
  final String queQuan_TenTinh;
  final String queQuan_TenHuyen;
  final String queQuan_TenPhuongXa;
  final String queQuan_TenQuocGia;
  final String hktT_TenTinh;
  final String hktT_TenHuyen;
  final String hktT_TenPhuongXa;
  final String dclL_TenTinh;
  final String dclL_TenHuyen;
  final String dclL_TenPhuongXa;
  final String dclL_TenQuocGia;
  final int idNhanSuLuong;
  final int idNgach;
  final int idTrinhDoChuyenMon;
  final String userName;
  final String tenLoaiNhanSu;
  final String tenCoQuan;
  final String tenChucDanh;
  final String tenCoQuanPrint;
  final String tenNgachCongChuc;
  final int idCoQuanCap1;
  final String tenCoQuanCap1;
  final String tenDonViTrucThuoc;
  final int idChucDanhKhoaHoc;
  final int idTrinhDoChinhTri;
  final int idThanhPhanGiaDinh;
  final String tenThanhPhanGiaDinh;
  final bool isSSO;
  final int hinhThucTraLuong;
  final int idViTriViecLam;
  final String tenViTriViecLam;
  final int idNhomViTriViecLam;
  final String tenNhomViTriViecLam;
  final bool isCapTaiKhoanVNU;
  final String soSoLaoDong;
  final String ngayCapSoLaoDong;
  final String noiCapSoLaoDong;
  final int idKeHoachTuyenDung;
  final String ngayDeXuat;
  final bool isTapSu;
  final String tenTrinhDoChuyenMon;
  final String maNgach;
  final double heSoLuong;
  final int idQuocTich;
  final String tenQuocTich;
  final int idUngVienOnline;
  final int idViTriViecLamUngVien;
  final int idChucDanhKhoaHocUngVien;
  final int idTrinhDoChuyenMonUngVien;
  final int idLinhVucUngVien;
  final String viTriUngTuyen;
  final String noiDaoTaoCuNhan;
  final String noiDaoTaoThacSi;
  final String noiDaoTaoTienSi;
  final String huongNghienCuu;
  final String chungChi;
  final String viTriCoQuan;
  final String ghiChuUngVien;
  final String nhanXet;
  final int diemSo;
  final int idKetQuaTuyenDung;
  final bool isTapSuUngVien;
  final int phanLoaiNhanSuNgoai;
  final List<FileKetQuaUngTuyen> fileKetQuaUngTuyens;
  final CompareData compareData;
  UserDetailModel({
    this.maNhanSu,
    this.hoDem,
    this.ten,
    this.emailNoiBo,
    this.soDienThoai,
    this.ngaySinh,
    this.guidIdHinhNhanSu,
    this.soCMND,
    this.ngayCapCMND,
    this.hktT_SoNha,
    this.noiCapCMND,
    this.noiCapHoChieu,
    this.dienThoaiNhaRieng,
    this.dienThoaiCoQuan,
    this.tenGioiTinh,
    this.tenChucVu,
    this.tenDanToc,
    this.tenTonGiao,
    this.tenLoaiHopDong,
    this.tenTrangThaiNhanSu,
    this.noiSinh_TenTinh,
    this.noiSinh_TenHuyen,
    this.noiSinh_TenQuocGia,
    this.queQuan_TenTinh,
    this.queQuan_TenQuocGia,
    this.hktT_TenTinh,
    this.userName,
    this.tenLoaiNhanSu,
    this.tenCoQuan,
    this.tenChucDanh,
    this.tenCoQuanPrint,
    this.tenNgachCongChuc,
    this.tenCoQuanCap1,
    this.tenDonViTrucThuoc,
    this.tenViTriViecLam,
    this.tenNhomViTriViecLam,
    this.tenTrinhDoChuyenMon,
    this.hktT_TenQuocGia,
    this.noiSinh_TenPhuongXa,
    this.queQuan_TenHuyen,
    this.queQuan_TenPhuongXa,
    this.hktT_TenHuyen,
    this.hktT_TenPhuongXa,
    this.dclL_TenTinh,
    this.dclL_TenHuyen,
    this.dclL_TenPhuongXa,
    this.dclL_TenQuocGia,
    this.maNgach,
    this.idNhanSu,
    this.idGioiTinh,
    this.idLoaiNhanSu,
    this.idCoQuan,
    this.idChucDanh,
    this.idChucVu,
    this.idLoaiHopDong,
    this.idDoiTuongDanhGia,
    this.idUser,
    this.idTrangThaiNhanSu,
    this.idLoaiNhanSuDanhGia,
    this.idHinhNhanSu,
    this.idNhanSuChiTiet,
    this.idTrangThaiDuLieu,
    this.idNhanSuDuyet,
    this.idDanToc,
    this.idTonGiao,
    this.idGiaDinhChinhSach,
    this.idTinhTrangHonNhan,
    this.idFileDinhKem,
    this.idNhanSuLuong,
    this.idNgach,
    this.idTrinhDoChuyenMon,
    this.idCoQuanCap1,
    this.stt,
    this.heSoLuong,
    this.idChucDanhKhoaHoc,
    this.idTrinhDoChinhTri,
    this.idThanhPhanGiaDinh,
    this.idViTriViecLam,
    this.idNhomViTriViecLam,
    this.idKeHoachTuyenDung,
    this.idQuocTich,
    this.idUngVienOnline,
    this.idViTriViecLamUngVien,
    this.idChucDanhKhoaHocUngVien,
    this.idTrinhDoChuyenMonUngVien,
    this.idLinhVucUngVien,
    this.idKetQuaTuyenDung,
    this.isVisible,
    this.noiSinh_IDTinh,
    this.noiSinh_IDHuyen,
    this.noiSinh_IDPhuongXa,
    this.queQuan_IDTinh,
    this.queQuan_IDHuyen,
    this.queQuan_IDPhuongXa,
    this.hktT_IDQuocGia,
    this.hktT_IDTinh,
    this.hktT_IDHuyen,
    this.hktT_IDPhuongXa,
    this.dclL_IDQuocGia,
    this.dclL_IDTinh,
    this.dclL_IDHuyen,
    this.dclL_IDPhuongXa,
    this.noiSinh_IDQuocGia,
    this.queQuan_IDQuocGia,
    this.isGiangVien,
    this.isNghienCuuVien,
    this.isThamGiaNVCL,
    this.isThamGiaGiangDayCL,
    this.isThamGiaQuanLyCL,
    this.isQuanLySach,
    this.isSSO,
    this.isCapTaiKhoanVNU,
    this.isTapSu,
    this.isTapSuUngVien,
    this.tenGoiKhac,
    this.email,
    this.ghiChuNhanSu,
    this.nameHinhNhanSu,
    this.typeHinhNhanSu,
    this.sizeHinhNhanSu,
    this.pathHinhNhanSu,
    this.forWebHinhNhanSu,
    this.checkSumHinhNhanSu,
    this.dclL_SoNha,
    this.hoChieu,
    this.ngayCapHoChieu,
    this.noiSinh_SoNha,
    this.queQuan_SoNha,
    this.soBHXH,
    this.nameFileDinhKem,
    this.typeFileDinhKem,
    this.sizeFileDinhKem,
    this.pathFileDinhKem,
    this.forWebFileDinhKem,
    this.checkSumFileDinhKem,
    this.ghiChuNhanSuChiTiet,
    this.tenDoiTuongChinhSach,
    this.tenTinhTrangHonNhan,
    this.tenThanhPhanGiaDinh,
    this.hinhThucTraLuong,
    this.soSoLaoDong,
    this.ngayCapSoLaoDong,
    this.noiCapSoLaoDong,
    this.ngayDeXuat,
    this.tenQuocTich,
    this.viTriUngTuyen,
    this.noiDaoTaoCuNhan,
    this.noiDaoTaoThacSi,
    this.noiDaoTaoTienSi,
    this.huongNghienCuu,
    this.chungChi,
    this.viTriCoQuan,
    this.ghiChuUngVien,
    this.nhanXet,
    this.diemSo,
    this.phanLoaiNhanSuNgoai,
    this.compareData,
    this.fileKetQuaUngTuyens,
  });

  factory UserDetailModel.fromJson(dynamic json) {
    return UserDetailModel(
      fileKetQuaUngTuyens: json['fileKetQuaUngTuyens']
              .map<FileKetQuaUngTuyen>((e) => e as FileKetQuaUngTuyen)
              .toList() ??
          [],
      tenGoiKhac: json['tenGoiKhac'] ?? null,
      email: json['email'] ?? null,
      ghiChuNhanSu: json['ghiChuNhanSu'] ?? null,
      nameHinhNhanSu: json['nameHinhNhanSu'] ?? null,
      typeHinhNhanSu: json['typeHinhNhanSu'] ?? null,
      sizeHinhNhanSu: json['sizeHinhNhanSu'] ?? null,
      pathHinhNhanSu: json['pathHinhNhanSu'] ?? null,
      forWebHinhNhanSu: json['forWebHinhNhanSu'] ?? null,
      checkSumHinhNhanSu: json['checkSumHinhNhanSu'] ?? null,
      dclL_SoNha: json['dclL_SoNha'] ?? null,
      hoChieu: json['hoChieu'] ?? null,
      ngayCapHoChieu: json['ngayCapHoChieu'] ?? null,
      noiSinh_SoNha: json['noiSinh_SoNha'] ?? null,
      queQuan_SoNha: json['queQuan_SoNha'] ?? null,
      soBHXH: json['soBHXH'] ?? null,
      nameFileDinhKem: json['nameFileDinhKem'] ?? null,
      typeFileDinhKem: json['typeFileDinhKem'] ?? null,
      sizeFileDinhKem: json['sizeFileDinhKem'] ?? null,
      pathFileDinhKem: json['pathFileDinhKem'] ?? null,
      forWebFileDinhKem: json['forWebFileDinhKem'] ?? null,
      checkSumFileDinhKem: json['checkSumFileDinhKem'] ?? null,
      ghiChuNhanSuChiTiet: json['ghiChuNhanSuChiTiet'] ?? null,
      tenDoiTuongChinhSach: json['tenDoiTuongChinhSach'] ?? null,
      tenTinhTrangHonNhan: json['tenTinhTrangHonNhan'] ?? null,
      tenThanhPhanGiaDinh: json['tenThanhPhanGiaDinh'] ?? null,
      hinhThucTraLuong: json['hinhThucTraLuong'] ?? null,
      soSoLaoDong: json['soSoLaoDong'] ?? null,
      ngayCapSoLaoDong: json['ngayCapSoLaoDong'] ?? null,
      noiCapSoLaoDong: json['noiCapSoLaoDong'] ?? null,
      ngayDeXuat: json['ngayDeXuat'] ?? null,
      tenQuocTich: json['tenQuocTich'] ?? null,
      viTriUngTuyen: json['viTriUngTuyen'] ?? null,
      noiDaoTaoCuNhan: json['noiDaoTaoCuNhan'] ?? null,
      noiDaoTaoThacSi: json['noiDaoTaoThacSi'] ?? null,
      noiDaoTaoTienSi: json['noiDaoTaoTienSi'] ?? null,
      huongNghienCuu: json['huongNghienCuu'] ?? null,
      chungChi: json['chungChi'] ?? null,
      viTriCoQuan: json['viTriCoQuan'] ?? null,
      ghiChuUngVien: json['ghiChuUngVien'] ?? null,
      nhanXet: json['nhanXet'] ?? null,
      diemSo: json['diemSo'] ?? null,
      phanLoaiNhanSuNgoai: json['phanLoaiNhanSuNgoai'] ?? null,
      compareData: json['compareData'] ?? null,
      isVisible: json['isVisible'] ?? false,
      isGiangVien: json['isGiangVien'] ?? false,
      isNghienCuuVien: json['isNghienCuuVien'] ?? false,
      isThamGiaNVCL: json['isThamGiaNVCL'] ?? false,
      isThamGiaGiangDayCL: json['isThamGiaGiangDayCL'] ?? false,
      isThamGiaQuanLyCL: json['isThamGiaQuanLyCL'] ?? false,
      isQuanLySach: json['isQuanLySach'] ?? false,
      isSSO: json['isSSO'] ?? false,
      isCapTaiKhoanVNU: json['isCapTaiKhoanVNU'] ?? false,
      isTapSu: json['isTapSu'] ?? false,
      isTapSuUngVien: json['isTapSuUngVien'] ?? false,
      idNhanSu: json['idNhanSu'] ?? -1,
      idGioiTinh: json['idGioiTinh'] ?? -1,
      idLoaiNhanSu: json['idLoaiNhanSu'] ?? -1,
      idCoQuan: json['idCoQuan'] ?? -1,
      idChucDanh: json['idChucDanh'] ?? -1,
      idChucVu: json['idChucVu'] ?? -1,
      idLoaiHopDong: json['idLoaiHopDong'] ?? -1,
      idDoiTuongDanhGia: json['idDoiTuongDanhGia'] ?? -1,
      idUser: json['idUser'] ?? -1,
      idTrangThaiNhanSu: json['idTrangThaiNhanSu'] ?? -1,
      idLoaiNhanSuDanhGia: json['idLoaiNhanSuDanhGia'] ?? -1,
      idHinhNhanSu: json['idHinhNhanSu'] ?? -1,
      idNhanSuChiTiet: json['idNhanSuChiTiet'] ?? -1,
      idTrangThaiDuLieu: json['idTrangThaiDuLieu'] ?? -1,
      idNhanSuDuyet: json['idNhanSuDuyet'] ?? -1,
      idDanToc: json['idDanToc'] ?? -1,
      idTonGiao: json['idTonGiao'] ?? -1,
      idGiaDinhChinhSach: json['idGiaDinhChinhSach'] ?? -1,
      idTinhTrangHonNhan: json['idTinhTrangHonNhan'] ?? -1,
      idFileDinhKem: json['idFileDinhKem'] ?? -1,
      idNhanSuLuong: json['idNhanSuLuong'] ?? -1,
      idNgach: json['idNgach'] ?? -1,
      idTrinhDoChuyenMon: json['idTrinhDoChuyenMon'] ?? -1,
      idCoQuanCap1: json['idCoQuanCap1'] ?? -1,
      stt: json['stt'] ?? -1,
      heSoLuong: json['heSoLuong'] ?? -1,
      idChucDanhKhoaHoc: json['idChucDanhKhoaHoc'] ?? -1,
      idTrinhDoChinhTri: json['idTrinhDoChinhTri'] ?? -1,
      idThanhPhanGiaDinh: json['idThanhPhanGiaDinh'] ?? -1,
      idViTriViecLam: json['idViTriViecLam'] ?? -1,
      idNhomViTriViecLam: json['idNhomViTriViecLam'] ?? -1,
      idKeHoachTuyenDung: json['idKeHoachTuyenDung'] ?? -1,
      idQuocTich: json['idQuocTich'] ?? -1,
      idUngVienOnline: json['idUngVienOnline'] ?? -1,
      idViTriViecLamUngVien: json['idViTriViecLamUngVien'] ?? -1,
      idChucDanhKhoaHocUngVien: json['idChucDanhKhoaHocUngVien'] ?? -1,
      idTrinhDoChuyenMonUngVien: json['idTrinhDoChuyenMonUngVien'] ?? -1,
      idLinhVucUngVien: json['idLinhVucUngVien'] ?? -1,
      idKetQuaTuyenDung: json['idKetQuaTuyenDung'] ?? -1,
      noiSinh_IDTinh: json['noiSinh_IDTinh'] ?? -1,
      noiSinh_IDHuyen: json['noiSinh_IDHuyen'] ?? -1,
      noiSinh_IDPhuongXa: json['noiSinh_IDPhuongXa'] ?? -1,
      queQuan_IDTinh: json['queQuan_IDTinh'] ?? -1,
      queQuan_IDHuyen: json['queQuan_IDHuyen'] ?? -1,
      queQuan_IDPhuongXa: json['queQuan_IDPhuongXa'] ?? -1,
      hktT_IDQuocGia: json['hktT_IDQuocGia'] ?? -1,
      hktT_IDTinh: json['hktT_IDTinh'] ?? -1,
      hktT_IDHuyen: json['hktT_IDHuyen'] ?? -1,
      hktT_IDPhuongXa: json['hktT_IDPhuongXa'] ?? -1,
      dclL_IDQuocGia: json['dclL_IDQuocGia'] ?? -1,
      dclL_IDTinh: json['dclL_IDTinh'] ?? -1,
      dclL_IDHuyen: json['dclL_IDHuyen'] ?? -1,
      dclL_IDPhuongXa: json['dclL_IDPhuongXa'] ?? -1,
      noiSinh_IDQuocGia: json['noiSinh_IDQuocGia'] ?? -1,
      queQuan_IDQuocGia: json['queQuan_IDQuocGia'] ?? -1,
      maNhanSu: json['maNhanSu'] ?? '',
      hoDem: json['hoDem'] ?? '',
      ten: json['ten'] ?? '',
      emailNoiBo: json['emailNoiBo'] ?? '',
      soDienThoai: json['soDienThoai'] ?? '',
      ngaySinh: json['ngaySinh'] ?? '',
      guidIdHinhNhanSu: json['guidIdHinhNhanSu'] ?? '',
      soCMND: json['soCMND'] ?? '',
      ngayCapCMND: json['ngayCapCMND'] ?? '',
      hktT_SoNha: json['hktT_SoNha'] ?? '',
      noiCapCMND: json['noiCapCMND'] ?? '',
      noiCapHoChieu: json['noiCapHoChieu'] ?? '',
      dienThoaiNhaRieng: json['dienThoaiNhaRieng'] ?? '',
      dienThoaiCoQuan: json['dienThoaiCoQuan'] ?? '',
      tenGioiTinh: json['tenGioiTinh'] ?? '',
      tenChucVu: json['tenChucVu'] ?? '',
      tenDanToc: json['tenDanToc'] ?? '',
      tenTonGiao: json['tenTonGiao'] ?? '',
      tenLoaiHopDong: json['tenLoaiHopDong'] ?? '',
      tenTrangThaiNhanSu: json['tenTrangThaiNhanSu'] ?? '',
      noiSinh_TenTinh: json['noiSinh_TenTinh'] ?? '',
      noiSinh_TenHuyen: json['noiSinh_TenHuyen'] ?? '',
      noiSinh_TenQuocGia: json['noiSinh_TenQuocGia'] ?? '',
      queQuan_TenTinh: json['queQuan_TenTinh'] ?? '',
      queQuan_TenQuocGia: json['queQuan_TenQuocGia'] ?? '',
      hktT_TenTinh: json['hktT_TenTinh'] ?? '',
      userName: json['userName'] ?? '',
      tenLoaiNhanSu: json['tenLoaiNhanSu'] ?? '',
      tenCoQuan: json['tenCoQuan'] ?? '',
      tenChucDanh: json['tenChucDanh'] ?? '',
      tenCoQuanPrint: json['tenCoQuanPrint'] ?? '',
      tenNgachCongChuc: json['tenNgachCongChuc'] ?? '',
      tenCoQuanCap1: json['tenCoQuanCap1'] ?? '',
      tenDonViTrucThuoc: json['tenDonViTrucThuoc'] ?? '',
      tenViTriViecLam: json['tenViTriViecLam'] ?? '',
      tenNhomViTriViecLam: json['tenNhomViTriViecLam'] ?? '',
      tenTrinhDoChuyenMon: json['tenTrinhDoChuyenMon'] ?? '',
      hktT_TenQuocGia: json['hktT_TenQuocGia'] ?? '',
      noiSinh_TenPhuongXa: json['noiSinh_TenPhuongXa'] ?? '',
      queQuan_TenHuyen: json['queQuan_TenHuyen'] ?? '',
      queQuan_TenPhuongXa: json['queQuan_TenPhuongXa'] ?? '',
      hktT_TenHuyen: json['hktT_TenHuyen'] ?? '',
      hktT_TenPhuongXa: json['hktT_TenPhuongXa'] ?? '',
      dclL_TenTinh: json['dclL_TenTinh'] ?? '',
      dclL_TenHuyen: json['dclL_TenHuyen'] ?? '',
      dclL_TenPhuongXa: json['dclL_TenPhuongXa'] ?? '',
      dclL_TenQuocGia: json['dclL_TenQuocGia'] ?? '',
      maNgach: json['maNgach'] ?? '',
    );
  }
}
