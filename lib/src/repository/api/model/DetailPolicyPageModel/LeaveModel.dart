class LeaveModel{
  String ngayNghi;
  int caNghi;

  LeaveModel({this.ngayNghi, this.caNghi});

  factory LeaveModel.fromJson(dynamic json) => LeaveModel(
    ngayNghi: json['ngayNghi'] ?? '',
    caNghi: json['caNghi'] ?? -1,
  );

}