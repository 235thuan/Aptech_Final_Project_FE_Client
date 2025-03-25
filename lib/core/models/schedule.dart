import 'package:flutter/material.dart';

// Model cho thông tin lịch giảng dạy
class Schedule {
  final String id;
  final String title;
  final String description;
  final String className;
  final DateTime date;
  final String startTime;
  final String endTime;
  final String location;
  final String status;

  Schedule({
    required this.id,
    required this.title,
    required this.description,
    required this.className,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.status,
  });

  // Chuyển đổi từ JSON sang đối tượng Schedule
  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      className: json['className'],
      date: DateTime.parse(json['date']),
      startTime: json['startTime'],
      endTime: json['endTime'],
      location: json['location'],
      status: json['status'],
    );
  }

  // Chuyển đổi từ đối tượng Schedule sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'className': className,
      'date': date.toIso8601String(),
      'startTime': startTime,
      'endTime': endTime,
      'location': location,
      'status': status,
    };
  }
}