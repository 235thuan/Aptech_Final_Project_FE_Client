// Model cho thanh toán
class Payment {
  final String id;
  final String studentId;
  final double amount;
  final String description;
  final DateTime date;
  final String status;
  final String method;
  final String? transactionId;
  final String? notes;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Payment({
    required this.id,
    required this.studentId,
    required this.amount,
    required this.description,
    required this.date,
    required this.status,
    required this.method,
    this.transactionId,
    this.notes,
    required this.createdAt,
    this.updatedAt,
  });

  // Chuyển đổi từ JSON sang đối tượng Payment
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      studentId: json['studentId'],
      amount: json['amount'].toDouble(),
      description: json['description'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      method: json['method'],
      transactionId: json['transactionId'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  // Chuyển đổi từ đối tượng Payment sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'amount': amount,
      'description': description,
      'date': date.toIso8601String(),
      'status': status,
      'method': method,
      'transactionId': transactionId,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
} 