// Model cho thông tin thảo luận
class Discussion {
  final String id;
  final String courseId;
  final String courseName;
  final String className;
  final String title;
  final String content;
  final String authorId;
  final String authorName;
  final DateTime createdAt;
  final List<DiscussionReply> replies;

  Discussion({
    required this.id,
    required this.courseId,
    required this.courseName,
    required this.className,
    required this.title,
    required this.content,
    required this.authorId,
    required this.authorName,
    required this.createdAt,
    required this.replies,
  });

  // Getter cho số lượng trả lời
  int get replyCount => replies.length;

  // Chuyển đổi từ JSON sang đối tượng Discussion
  factory Discussion.fromJson(Map<String, dynamic> json) {
    return Discussion(
      id: json['id'],
      courseId: json['courseId'],
      courseName: json['courseName'],
      className: json['className'],
      title: json['title'],
      content: json['content'],
      authorId: json['authorId'],
      authorName: json['authorName'],
      createdAt: DateTime.parse(json['createdAt']),
      replies: (json['replies'] as List)
          .map((reply) => DiscussionReply.fromJson(reply))
          .toList(),
    );
  }

  // Chuyển đổi từ đối tượng Discussion sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'courseName': courseName,
      'className': className,
      'title': title,
      'content': content,
      'authorId': authorId,
      'authorName': authorName,
      'createdAt': createdAt.toIso8601String(),
      'replies': replies.map((reply) => reply.toJson()).toList(),
    };
  }
}

// Model cho thông tin phản hồi trong thảo luận
class DiscussionReply {
  final String id;
  final String content;
  final String createdBy;
  final DateTime createdAt;

  DiscussionReply({
    required this.id,
    required this.content,
    required this.createdBy,
    required this.createdAt,
  });

  // Chuyển đổi từ JSON sang đối tượng DiscussionReply
  factory DiscussionReply.fromJson(Map<String, dynamic> json) {
    return DiscussionReply(
      id: json['id'],
      content: json['content'],
      createdBy: json['createdBy'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Chuyển đổi từ đối tượng DiscussionReply sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdBy': createdBy,
      'createdAt': createdAt.toIso8601String(),
    };
  }
} 