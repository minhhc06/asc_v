class FilesResponseModel{
  int fileId;
  String name;
  String path;
  int size;
  String guidId;

  FilesResponseModel({this.fileId, this.name, this.path, this.size, this.guidId});

  factory FilesResponseModel.fromJson(dynamic json) => FilesResponseModel(
    fileId: json['fileId'] ?? -1,
    name: json['name'] ?? '',
    path: json['path'] ?? '',
    size: json['size'] ?? -1,
    guidId: json['guidId'] ?? '',
  );

  factory FilesResponseModel.fromJsonFile(dynamic json) => FilesResponseModel(
    fileId: json['idFileDinhKem'] ?? -1,
    name: json['nameFileDinhKem'] ?? '',
    path: json['pathFileDinhKem'] ?? '',

  );

  factory FilesResponseModel.fromJsonListFiles(dynamic json) => FilesResponseModel(
    fileId: json['idFileDinhKem'] ?? -1,
    name: json['nameFileDinhKem'] ?? '',
    path: json['pathFileDinhKem'] ?? '',
    size: json['sizeFileDinhKem'] ?? -1,
    guidId: json['guidIdFileDinhKem'] ?? '' ,
  );

}