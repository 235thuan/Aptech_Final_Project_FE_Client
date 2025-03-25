import '../models/certificate.dart';
import 'mock_data_service.dart';

class CertificateService {
  // Lấy danh sách chứng chỉ
  Future<List<Certificate>> getCertificates() async {
    try {
      // TODO: Implement API call
      return MockDataService.getMockCertificates();
    } catch (e) {
      throw Exception('Failed to load certificates: $e');
    }
  }

  // Thêm chứng chỉ mới
  Future<void> addCertificate({
    required String studentId,
    required String studentName,
    required String courseId,
    required String courseName,
    required String issueDate,
    required String expiryDate,
    required String status,
    required String certificateNumber,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to add certificate: $e');
    }
  }

  // Cập nhật chứng chỉ
  Future<void> updateCertificate({
    required String id,
    required String studentId,
    required String studentName,
    required String courseId,
    required String courseName,
    required String issueDate,
    required String expiryDate,
    required String status,
    required String certificateNumber,
  }) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to update certificate: $e');
    }
  }

  // Xóa chứng chỉ
  Future<void> deleteCertificate(String id) async {
    try {
      // TODO: Implement API call
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      throw Exception('Failed to delete certificate: $e');
    }
  }
} 