class FileDinhKemBanHanhsModel{
  int idFileDinhKem;
  String nameFileDinhKem;
  int typeFileDinhKem;
  int sizeFileDinhKem;
  String pathFileDinhKem;
  bool forWebFileDinhKem;
  dynamic checkSumFileDinhKem;
  String guidIdFileDinhKem;

  FileDinhKemBanHanhsModel({
      this.idFileDinhKem,
      this.nameFileDinhKem,
      this.typeFileDinhKem,
      this.sizeFileDinhKem,
      this.pathFileDinhKem,
      this.forWebFileDinhKem,
      this.checkSumFileDinhKem,
      this.guidIdFileDinhKem});

  factory FileDinhKemBanHanhsModel.fromJson(dynamic json) => FileDinhKemBanHanhsModel(
    idFileDinhKem: json['idFileDinhKem'] ?? -1,
    nameFileDinhKem: json['nameFileDinhKem'] ?? '',
    typeFileDinhKem: json['typeFileDinhKem'] ?? -1,
    sizeFileDinhKem: json['sizeFileDinhKem'] ?? -1,
    pathFileDinhKem: json['pathFileDinhKem'] ?? '',
    forWebFileDinhKem: json['forWebFileDinhKem'] ,
    checkSumFileDinhKem: json['checkSumFileDinhKem'] ,
    guidIdFileDinhKem: json['guidIdFileDinhKem'] ?? '' ,
  );

}