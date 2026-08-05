class UploadResponse {
  final bool success;
  final List<UploadedFile> files;

  UploadResponse({
    required this.success,
    required this.files,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) {
    return UploadResponse(
      success: json["success"] ?? false,
      files: (json["data"]["files"] as List)
          .map((e) => UploadedFile.fromJson(e))
          .toList(),
    );
  }
}

class UploadedFile {
  final String fileName;
  final String path;
  final String size;

  UploadedFile({
    required this.fileName,
    required this.path,
    required this.size,
  });

  factory UploadedFile.fromJson(Map<String, dynamic> json) {
    return UploadedFile(
      fileName: json["file_name"] ?? "",
      path: json["path"] ?? "",
      size: json["size"] ?? "",
    );
  }
}