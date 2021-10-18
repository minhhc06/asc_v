class CompareData {
  final int idNhanSu;
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
  final String hktT_TenQuocGia;
  final String hktT_TenTinh;
  final String hktT_TenHuyen;
  final String hktT_TenPhuongXa;
  final String dclL_TenTinh;
  final String dclL_TenHuyen;
  final String dclL_TenPhuongXa;
  final String dclL_TenQuocGia;
  final int idThanhPhanGiaDinh;
  final String tenThanhPhanGiaDinh;
  final String soSoLaoDong;
  final String ngayCapSoLaoDong;
  final String noiCapSoLaoDong;
  final String ngayDeXuat;
  final int idQuocTich;
  final String tenQuocTich;

  CompareData({
    this.idNhanSu,
    this.idNhanSuChiTiet,
    this.idTrangThaiDuLieu,
    this.idNhanSuDuyet,
    this.soCMND,
    this.ngayCapCMND,
    this.idDanToc,
    this.idTonGiao,
    this.idGiaDinhChinhSach,
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
    this.hktT_SoNha,
    this.dclL_IDQuocGia,
    this.dclL_IDTinh,
    this.dclL_IDHuyen,
    this.dclL_IDPhuongXa,
    this.dclL_SoNha,
    this.noiCapCMND,
    this.hoChieu,
    this.ngayCapHoChieu,
    this.noiCapHoChieu,
    this.noiSinh_IDQuocGia,
    this.noiSinh_SoNha,
    this.queQuan_IDQuocGia,
    this.queQuan_SoNha,
    this.dienThoaiNhaRieng,
    this.dienThoaiCoQuan,
    this.soBHXH,
    this.idTinhTrangHonNhan,
    this.idFileDinhKem,
    this.nameFileDinhKem,
    this.typeFileDinhKem,
    this.sizeFileDinhKem,
    this.pathFileDinhKem,
    this.forWebFileDinhKem,
    this.checkSumFileDinhKem,
    this.ghiChuNhanSuChiTiet,
    this.tenGioiTinh,
    this.tenChucVu,
    this.tenDanToc,
    this.tenTonGiao,
    this.tenLoaiHopDong,
    this.tenTrangThaiNhanSu,
    this.tenDoiTuongChinhSach,
    this.tenTinhTrangHonNhan,
    this.noiSinh_TenTinh,
    this.noiSinh_TenHuyen,
    this.noiSinh_TenPhuongXa,
    this.noiSinh_TenQuocGia,
    this.queQuan_TenTinh,
    this.queQuan_TenHuyen,
    this.queQuan_TenPhuongXa,
    this.queQuan_TenQuocGia,
    this.hktT_TenQuocGia,
    this.hktT_TenTinh,
    this.hktT_TenHuyen,
    this.hktT_TenPhuongXa,
    this.dclL_TenTinh,
    this.dclL_TenHuyen,
    this.dclL_TenPhuongXa,
    this.dclL_TenQuocGia,
    this.idThanhPhanGiaDinh,
    this.tenThanhPhanGiaDinh,
    this.soSoLaoDong,
    this.ngayCapSoLaoDong,
    this.noiCapSoLaoDong,
    this.ngayDeXuat,
    this.idQuocTich,
    this.tenQuocTich,
  });
  factory CompareData.fromJson(dynamic json) => CompareData(
        soCMND: json['soCMND'] ?? '',
        ngayCapCMND: json['ngayCapCMND'] ?? '',
        hktT_SoNha: json['hktT_SoNha'] ?? '',
        dclL_SoNha: json['dclL_SoNha'] ?? '',
        noiCapCMND: json['noiCapCMND'] ?? '',
        hoChieu: json['hoChieu'] ?? '',
        ngayCapHoChieu: json['ngayCapHoChieu'] ?? '',
        noiCapHoChieu: json['noiCapHoChieu'] ?? '',
        noiSinh_SoNha: json['noiSinh_SoNha'] ?? '',
        queQuan_SoNha: json['queQuan_SoNha'] ?? '',
        dienThoaiNhaRieng: json['dienThoaiNhaRieng'] ?? '',
        dienThoaiCoQuan: json['dienThoaiCoQuan'] ?? '',
        soBHXH: json['soBHXH'] ?? '',
        nameFileDinhKem: json['nameFileDinhKem'] ?? '',
        pathFileDinhKem: json['pathFileDinhKem'] ?? '',
        forWebFileDinhKem: json['forWebFileDinhKem'] ?? false,
        checkSumFileDinhKem: json['checkSumFileDinhKem'] ?? '',
        ghiChuNhanSuChiTiet: json['ghiChuNhanSuChiTiet'] ?? '',
        tenGioiTinh: json['tenGioiTinh'] ?? '',
        tenChucVu: json['tenChucVu'] ?? '',
        tenDanToc: json['tenDanToc'] ?? '',
        tenTonGiao: json['tenTonGiao'] ?? '',
        tenLoaiHopDong: json['tenLoaiHopDong'] ?? '',
        tenTrangThaiNhanSu: json['tenTrangThaiNhanSu'] ?? '',
        tenDoiTuongChinhSach: json['tenDoiTuongChinhSach'] ?? '',
        tenTinhTrangHonNhan: json['tenTinhTrangHonNhan'] ?? '',
        noiSinh_TenTinh: json['noiSinh_TenTinh'] ?? '',
        noiSinh_TenHuyen: json['noiSinh_TenHuyen'] ?? '',
        noiSinh_TenPhuongXa: json['noiSinh_TenPhuongXa'] ?? '',
        noiSinh_TenQuocGia: json['noiSinh_TenQuocGia'] ?? '',
        queQuan_TenTinh: json['queQuan_TenTinh'] ?? '',
        queQuan_TenHuyen: json['queQuan_TenHuyen'] ?? '',
        queQuan_TenPhuongXa: json['queQuan_TenPhuongXa'] ?? '',
        queQuan_TenQuocGia: json['queQuan_TenQuocGia'] ?? '',
        hktT_TenQuocGia: json['hktT_TenQuocGia'] ?? '',
        hktT_TenTinh: json['hktT_TenTinh'] ?? '',
        hktT_TenHuyen: json['hktT_TenHuyen'] ?? '',
        hktT_TenPhuongXa: json['hktT_TenPhuongXa'] ?? '',
        dclL_TenTinh: json['dclL_TenTinh'] ?? '',
        dclL_TenHuyen: json['dclL_TenHuyen'] ?? '',
        dclL_TenPhuongXa: json['dclL_TenPhuongXa'] ?? '',
        dclL_TenQuocGia: json['dclL_TenQuocGia'] ?? '',
        tenThanhPhanGiaDinh: json['tenThanhPhanGiaDinh'] ?? '',
        soSoLaoDong: json['soSoLaoDong'] ?? '',
        ngayCapSoLaoDong: json['ngayCapSoLaoDong'] ?? '',
        noiCapSoLaoDong: json['noiCapSoLaoDong'] ?? '',
        ngayDeXuat: json['ngayDeXuat'] ?? '',
        tenQuocTich: json['tenQuocTich'] ?? '',
        idNhanSu: json['idNhanSu'] ?? -1,
        idNhanSuChiTiet: json['idNhanSuChiTiet'] ?? -1,
        idTrangThaiDuLieu: json['idTrangThaiDuLieu'] ?? -1,
        idNhanSuDuyet: json['idNhanSuDuyet'] ?? -1,
        idDanToc: json['idDanToc'] ?? -1,
        idTonGiao: json['idTonGiao'] ?? -1,
        idGiaDinhChinhSach: json['idGiaDinhChinhSach'] ?? -1,
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
        idTinhTrangHonNhan: json['idTinhTrangHonNhan'] ?? -1,
        idFileDinhKem: json['idFileDinhKem'] ?? -1,
        typeFileDinhKem: json['typeFileDinhKem'] ?? -1,
        sizeFileDinhKem: json['sizeFileDinhKem'] ?? -1,
        idThanhPhanGiaDinh: json['idThanhPhanGiaDinh'] ?? -1,
        idQuocTich: json['idQuocTich'] ?? -1,
      );
}
