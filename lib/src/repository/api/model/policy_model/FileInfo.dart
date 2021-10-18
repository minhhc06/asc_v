import 'package:flutter/cupertino.dart';

class FileInfo {
  final int idFileDinhKem;
  final int typeFileDinhKem;
  final int sizeFileDinhKem;
  final String pathFileDinhKem;
  final String nameFileDinhKem;
  final bool forWebFileDinhKem;
  final String checkSumFileDinhKem;
  final String guidIdFileDinhKem;

  FileInfo({
    @required this.idFileDinhKem,
    @required this.typeFileDinhKem,
    @required this.sizeFileDinhKem,
    @required this.pathFileDinhKem,
    @required this.nameFileDinhKem,
    @required this.forWebFileDinhKem,
    @required this.checkSumFileDinhKem,
    @required this.guidIdFileDinhKem,
  });
  factory FileInfo.fromJson(dynamic json) => FileInfo(
        idFileDinhKem: json['idFileDinhKem'] ?? -1,
        typeFileDinhKem: json['typeFileDinhKem'] ?? -1,
        sizeFileDinhKem: json['sizeFileDinhKem'] ?? -1,
        pathFileDinhKem: json['pathFileDinhKem'] ?? '',
        nameFileDinhKem: json['nameFileDinhKem'] ?? '',
        forWebFileDinhKem: json['forWebFileDinhKem'] ?? false,
        checkSumFileDinhKem: json['checkSumFileDinhKem'] ?? '',
        guidIdFileDinhKem: json['guidIdFileDinhKem'] ?? '',
      );
}
