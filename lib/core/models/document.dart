class Document {
  final String id;
  final String title;
  final String description;
  final String type;
  final String category;
  final String courseId;
  final String courseName;
  final DateTime uploadDate;
  final String size;
  final String fileUrl;

  Document({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.category,
    required this.courseId,
    required this.courseName,
    required this.uploadDate,
    required this.size,
    required this.fileUrl,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      category: json['category'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      uploadDate: DateTime.parse(json['uploadDate']),
      size: json['size'],
      fileUrl: json['fileUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'category': category,
      'courseId': courseId,
      'courseName': courseName,
      'uploadDate': uploadDate.toIso8601String(),
      'size': size,
      'fileUrl': fileUrl,
    };
  }
} 