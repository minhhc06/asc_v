import 'dart:io';

class RequestUploadMediaModel {
  String folderName;
  int fileSize;
  List<File> files;
  RequestUploadMediaModel({
    String folderName,
    int fileSize,
    List<File> files,
  }) {
    this.fileSize = fileSize;
    this.folderName = folderName;
    this.files = files;
  }
  @override
  String toString() =>
      '?FolderFunction=${this.folderName}&FileSize=${this.fileSize}';
}
