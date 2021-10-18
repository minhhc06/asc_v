class ReasonModel {
  final int id;
  final String ma;
  final String ten;
  final int stt;
  final bool isVisible;
  final String ghiChu;

  ReasonModel({
    this.id,
    this.ma,
    this.ten,
    this.stt,
    this.isVisible,
    this.ghiChu,
  });
  factory ReasonModel.fromJson(dynamic json) => ReasonModel(
        id: json['id'] ?? -1,
        stt: json['stt'] ?? -1,
        ma: json['ma'] ?? '',
        ten: json['ten'] ?? '',
        isVisible: json['isVisible'] ?? false,
        ghiChu: json['ghiChu'] ?? '',
      );
  @override
  String toString() => this.ten;
}
