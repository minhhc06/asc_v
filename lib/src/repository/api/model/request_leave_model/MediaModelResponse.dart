class MediaModelResponse {
  int fileId;
  int size;
  String name;
  String path;
  String guidId;
  MediaModelResponse({
    this.fileId,
    this.guidId,
    this.name,
    this.path,
    this.size,
  });
  factory MediaModelResponse.fromJson(dynamic json) => MediaModelResponse(
        fileId: json['fileId'] ?? -1,
        size: json['size'] ?? -1,
        name: json['name'] ?? '',
        path: json['path'] ?? '',
        guidId: json['guidId'] ?? '',
      );
}
