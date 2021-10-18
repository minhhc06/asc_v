class ThoiGianNghiPhepsModel{
  String ngayNghi;
  int caNghi;

  ThoiGianNghiPhepsModel({this.ngayNghi, this.caNghi});
  Map<String, dynamic> toJson() => {
    'ngayNghi': ngayNghi,
    'caNghi': caNghi,
  };
}