import '../models/user_feedback.dart';
import 'mock_data_service.dart';

class FeedbackService {
  // Lấy danh sách phản hồi
  Future<List<UserFeedback>> getFeedbacks() async {
    try {
      // TODO: Implement API call
      return MockDataService.getMockFeedback();
    } catch (e) {
      throw Exception('Failed to load feedbacks: $e');
    }
  }

  // Thêm phản hồi mới
  Future<void> addFeedback({
    required String title,
    required String content,
    required String userName,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to add feedback: $e');
    }
  }

  // Phản hồi lại feedback
  Future<void> respondToFeedback({
    required String id,
    required String response,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to respond to feedback: $e');
    }
  }

  // Xóa phản hồi
  Future<void> deleteFeedback(String id) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to delete feedback: $e');
    }
  }
} 