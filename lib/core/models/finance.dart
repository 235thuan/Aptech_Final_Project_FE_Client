class Finance {
  final String id;
  final String type;
  final String category;
  final double amount;
  final String description;
  final String studentName;
  final String date;
  final String status;

  Finance({
    required this.id,
    required this.type,
    required this.category,
    required this.amount,
    required this.description,
    required this.studentName,
    required this.date,
    required this.status,
  });

  factory Finance.fromJson(Map<String, dynamic> json) {
    return Finance(
      id: json['id'],
      type: json['type'],
      category: json['category'],
      amount: json['amount'].toDouble(),
      description: json['description'],
      studentName: json['studentName'],
      date: json['date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'category': category,
      'amount': amount,
      'description': description,
      'studentName': studentName,
      'date': date,
      'status': status,
    };
  }
} 