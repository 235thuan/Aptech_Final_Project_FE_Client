class Notification {
  final String id;
  final String title;
  final String content;
  final String type;
  final String priority;
  final List<String> recipients;
  final DateTime createdAt;
  final DateTime updatedAt;

  Notification({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    required this.priority,
    required this.recipients,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      type: json['type'],
      priority: json['priority'],
      recipients: List<String>.from(json['recipients']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'type': type,
      'priority': priority,
      'recipients': recipients,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Notification copyWith({
    String? id,
    String? title,
    String? content,
    String? type,
    String? priority,
    List<String>? recipients,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Notification(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      priority: priority ?? this.priority,
      recipients: recipients ?? this.recipients,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
} 