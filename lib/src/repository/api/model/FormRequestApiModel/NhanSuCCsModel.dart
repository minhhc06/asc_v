class NhanSuCCsModel{
  int id;
  String hoDem;
  String ten;

  NhanSuCCsModel({this.id, this.hoDem, this.ten});
  factory NhanSuCCsModel.fromJson(dynamic json) => NhanSuCCsModel(
    id: json['id'] ?? -1,
    hoDem: json['hoDem'] ?? '',
    ten: json['ten'] ?? '',
  );

}