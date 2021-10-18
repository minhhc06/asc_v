

import 'dart:io';

class UpdateFileApiModel{
  String folderName;
  int fileSize;
  File file;
  UpdateFileApiModel({
    String folderName,
    int fileSize,
    File file,
  }) {
    this.fileSize = fileSize;
    this.folderName = folderName;
    this.file = file;
  }
  @override
  String toString() =>
      '?FolderFunction=${this.folderName}&FileSize=${this.fileSize}';
}