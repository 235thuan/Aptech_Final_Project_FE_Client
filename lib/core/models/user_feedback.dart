// Model cho thông tin phản hồi
class UserFeedback {
  final String id;
  final String title;
  final String content;
  final String userName;
  final String status;
  final DateTime createdAt;
  final String? response;
  final DateTime? respondedAt;

  UserFeedback({
    required this.id,
    required this.title,
    required this.content,
    required this.userName,
    required this.status,
    required this.createdAt,
    this.response,
    this.respondedAt,
  });

  factory UserFeedback.fromJson(Map<String, dynamic> json) {
    return UserFeedback(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      userName: json['userName'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      response: json['response'],
      respondedAt: json['respondedAt'] != null ? DateTime.parse(json['respondedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'userName': userName,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'response': response,
      'respondedAt': respondedAt?.toIso8601String(),
    };
  }
} 