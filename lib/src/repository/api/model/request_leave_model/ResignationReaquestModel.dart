class ResignationReaquestModel {
  int id;
  String tieuDe;
  int idNhanSuNhan;
  List<int> idsNhanSuNhan = [];
  List<int> idsFileDinhKem = [];
  int loaiDon;
  String ngayDuyet;
  String ngayNhanBanGiao;
  String noiDung;
  String thoiGian;
  int trangThai;
  int idNhanSuNhanBanGiao;
  ResignationReaquestModel({
    this.idNhanSuNhanBanGiao,
    this.idsFileDinhKem,
    this.idsNhanSuNhan,
    this.ngayNhanBanGiao,
    this.noiDung,
    this.thoiGian,
    this.tieuDe,
    this.id,
    this.idNhanSuNhan,
    this.loaiDon,
    this.ngayDuyet,
    this.trangThai,
  });
  Map<String, dynamic> toJson() => {
        'idNhanSuNhanBanGiao': idNhanSuNhanBanGiao,
        'idsFileDinhKem': idsFileDinhKem,
        'idsNhanSuNhan': idsNhanSuNhan,
        'ngayNhanBanGiao': ngayNhanBanGiao,
        'noiDung': noiDung,
        'thoiGian': thoiGian,
        'tieuDe': tieuDe,
        'id': id,
        'idNhanSuNhan': idNhanSuNhan,
        'loaiDon': loaiDon,
        'ngayDuyet': ngayDuyet,
        'trangThai': trangThai,
      };
}
