class RequestListUserModel {
  final int pageSize;
  final int pageNumber;
  final String sortName;
  final int coQuanId;
  final int dotDanhGiaChiTietId;
  final String keyword;
  final int manHinh;
  final int idDoiTuongDanhGia;
  final String sortCol;
  final bool sortByASC;
  final bool isCoQuanQuanLy;
  final int type;
  final String idNhanSusSelected;
  final String keyControl;

  RequestListUserModel({
    this.sortName,
    this.pageSize,
    this.pageNumber,
    this.coQuanId,
    this.dotDanhGiaChiTietId,
    this.keyword,
    this.manHinh,
    this.idDoiTuongDanhGia,
    this.sortCol,
    this.sortByASC,
    this.isCoQuanQuanLy,
    this.type,
    this.idNhanSusSelected,
    this.keyControl,
  });
  Map<String, dynamic> toJson() => {
        'pageSize': pageSize,
        'pageNumber': pageNumber,
        'sortName': sortName,
        'coQuanId': coQuanId,
        'dotDanhGiaChiTietId': dotDanhGiaChiTietId,
        'keyword': keyword,
        'manHinh': manHinh,
        'idDoiTuongDanhGia': idDoiTuongDanhGia,
        'sortCol': sortCol,
        'sortByASC': sortByASC,
        'isCoQuanQuanLy': isCoQuanQuanLy,
        'type': type,
        'idNhanSusSelected': idNhanSusSelected,
        'keyControl': keyControl,
      };
}
