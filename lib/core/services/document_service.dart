import '../models/document.dart';
import 'mock_data_service.dart';

class DocumentService {
  // Lấy danh sách tài liệu
  Future<List<Document>> getDocuments() async {
    try {
      // TODO: Implement API call
      return MockDataService.getMockDocuments();
    } catch (e) {
      throw Exception('Failed to load documents: $e');
    }
  }

  // Thêm tài liệu mới
  Future<void> addDocument({
    required String title,
    required String description,
    required String type,
    required String category,
    required String courseId,
    required String courseName,
    required String fileUrl,
    required int fileSize,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to add document: $e');
    }
  }

  // Cập nhật tài liệu
  Future<void> updateDocument({
    required String id,
    required String title,
    required String description,
    required String type,
    required String category,
    required String courseId,
    required String courseName,
    required String fileUrl,
    required int fileSize,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to update document: $e');
    }
  }

  // Xóa tài liệu
  Future<void> deleteDocument(String id) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to delete document: $e');
    }
  }
} 