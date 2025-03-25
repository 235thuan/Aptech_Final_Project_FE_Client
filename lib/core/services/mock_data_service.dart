import '../models/grade.dart';
import '../models/timetable.dart';
import '../models/course.dart';
import '../models/student.dart';
import '../models/notification.dart';
import '../models/assignment.dart';
import '../models/teacher.dart';
import '../models/discussion.dart';
import '../models/learning_material.dart';
import '../models/child_activity.dart';
import '../models/child_behavior.dart';
import '../models/payment.dart';
import '../enums/user_role.dart';
import '../models/class.dart';
import '../models/certificate.dart';
import '../models/document.dart';
import '../models/finance.dart';
import '../models/user_feedback.dart';
import '../models/user.dart';
import '../models/settings.dart';
import '../models/schedule.dart';
import '../models/student_evaluation.dart';

// Service cung cấp dữ liệu mẫu cho testing
class MockDataService {
  // Lấy danh sách người dùng mẫu
  static List<User> getMockUsers() {
    return [
      User(
        id: '1',
        name: 'Nguyễn Văn A',
        email: 'nguyenvana@example.com',
        phone: '0123456789',
        address: 'Hà Nội',
        role: 'student',
        status: 'active',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
      User(
        id: '2',
        name: 'Trần Thị B',
        email: 'tranthib@example.com',
        phone: '0987654321',
        address: 'Hồ Chí Minh',
        role: 'teacher',
        status: 'active',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
    ];
  }

  // Lấy thông tin sinh viên mẫu
  static Student getMockStudent() {
    return Student(
      id: '1',
      email: 'nguyenvana@example.com',
      name: 'Nguyễn Văn A',
      role: UserRole.student,
      phoneNumber: '0123456789',
      address: 'Hà Nội',
    );
  }

  // Lấy dữ liệu mẫu cho giảng viên
  static Student getMockTeacher() {
    return Student(
      id: '2',
      email: 'teacher@example.com',
      name: 'Trần Thị B',
      role: UserRole.teacher,
      major: 'Công nghệ thông tin',
      phoneNumber: '0987654321',
      address: 'Hồ Chí Minh',
      dateOfBirth: DateTime(1980, 1, 1),
      gender: 'Nữ',
    );
  }

  // Lấy dữ liệu mẫu cho giáo vụ
  static Student getMockAdmin() {
    return Student(
      id: '3',
      email: 'admin@example.com',
      name: 'Lê Văn C',
      role: UserRole.admin,
      phoneNumber: '0369852147',
      address: 'Đà Nẵng',
      dateOfBirth: DateTime(1970, 1, 1),
      gender: 'Nam',
    );
  }

  // Lấy dữ liệu mẫu cho phụ huynh
  static Student getMockParent() {
    return Student(
      id: '4',
      email: 'parent@example.com',
      name: 'Phạm Thị D',
      role: UserRole.parent,
      phoneNumber: '0147852369',
      address: 'Hải Phòng',
      dateOfBirth: DateTime(1975, 1, 1),
      gender: 'Nữ',
    );
  }

  // Lấy danh sách khóa học mẫu
  static List<Course> getMockCourses() {
    return [
      Course(
        id: '1',
        name: 'Lập trình Flutter',
        code: 'FLUT101',
        description: 'Khóa học lập trình ứng dụng di động với Flutter',
        instructorId: '2',
        instructorName: 'Trần Thị B',
        instructor: 'Trần Thị B',
        credits: 3,
        level: 'Cơ bản',
        duration: '3 tháng',
        maxStudents: 30,
        currentStudents: 25,
        price: 5000000,
        status: 'active',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 90)),
        location: 'Phòng 101',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
      Course(
        id: '2',
        name: 'Lập trình Java',
        code: 'JAVA101',
        description: 'Khóa học lập trình Java từ cơ bản đến nâng cao',
        instructorId: '2',
        instructorName: 'Trần Thị B',
        instructor: 'Trần Thị B',
        credits: 4,
        level: 'Trung cấp',
        duration: '4 tháng',
        maxStudents: 25,
        currentStudents: 20,
        price: 6000000,
        status: 'active',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 120)),
        location: 'Phòng 102',
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
      ),
    ];
  }

  // Lấy danh sách lớp học mẫu
  static List<Class> getMockClasses() {
    return [
      Class(
        id: '1',
        name: 'Flutter 2024',
        description: 'Lớp học lập trình Flutter',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        teacherId: '2',
        teacherName: 'Trần Thị B',
        schedule: 'Sáng (8:00 - 11:00)',
        location: 'Phòng 101',
        startDate: DateTime.now(),
        endDate: DateTime.now().add(const Duration(days: 90)),
        capacity: 30,
        currentStudents: 25,
        status: 'active',
      ),
    ];
  }

  // Lấy danh sách điểm số mẫu
  static List<Grade> getMockGrades() {
    return [
      Grade(
        id: '1',
        studentId: '1',
        studentName: 'Nguyễn Văn A',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        courseCode: 'FLUT101',
        instructor: 'Trần Thị B',
        assignmentId: '1',
        assignmentTitle: 'Bài tập 1',
        attendanceScore: 9.0,
        midtermScore: 8.5,
        finalScore: 9.0,
        averageScore: 8.8,
        score: 8.8,
        grade: 'A',
        comment: 'Học sinh có tiến bộ tốt',
        semester: '2024-1',
        academicYear: '2024-2025',
        lastUpdated: DateTime.now(),
      ),
      Grade(
        id: '2',
        studentId: '2',
        studentName: 'Trần Thị B',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        courseCode: 'FLUT101',
        instructor: 'Trần Thị B',
        assignmentId: '1',
        assignmentTitle: 'Bài tập 1',
        attendanceScore: 8.5,
        midtermScore: 9.0,
        finalScore: 8.5,
        averageScore: 8.7,
        score: 8.7,
        grade: 'A',
        comment: 'Học sinh tích cực tham gia',
        semester: '2024-1',
        academicYear: '2024-2025',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // Lấy danh sách tài liệu mẫu
  static List<Document> getMockDocuments() {
    return [
      Document(
        id: '1',
        title: 'Tài liệu Flutter',
        description: 'Tài liệu học Flutter cơ bản',
        type: 'pdf',
        category: 'course',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        uploadDate: DateTime.now(),
        size: '2.5 MB',
        fileUrl: 'https://example.com/flutter.pdf',
      ),
    ];
  }

  // Lấy danh sách phản hồi mẫu
  static List<UserFeedback> getMockFeedbacks() {
    return [
      UserFeedback(
        id: '1',
        title: 'Đề xuất cải thiện khóa học',
        content: 'Khóa học rất tốt, nhưng cần thêm nhiều bài tập thực hành',
        userName: 'Nguyễn Văn A',
        status: 'pending',
        createdAt: DateTime.now(),
      ),
    ];
  }

  // Lấy danh sách chứng chỉ mẫu
  static List<Certificate> getMockCertificates() {
    return [
      Certificate(
        id: '1',
        name: 'Chứng chỉ Flutter',
        studentId: '1',
        studentName: 'Nguyễn Văn A',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        issuedDate: DateTime.now(),
        expiryDate: DateTime.now().add(const Duration(days: 365)),
        status: 'active',
        certificateNumber: 'CERT-001',
      ),
    ];
  }

  // Lấy dữ liệu mẫu cho cài đặt hệ thống
  static Settings getMockSettings() {
    return Settings(
      siteName: 'Hệ thống Quản lý Học tập',
      siteDescription: 'Nền tảng học trực tuyến cho học viên và giảng viên',
      contactEmail: 'support@example.com',
      contactPhone: '0123456789',
      address: '123 Đường ABC, Quận 1, TP.HCM',
      theme: 'light',
      language: 'vi',
      maintenanceMode: false,
      registrationEnabled: true,
      emailNotifications: true,
      smsNotifications: false,
    );
  }

  // Lấy danh sách tài chính mẫu
  static List<Finance> getMockFinances() {
    return [
      Finance(
        id: '1',
        type: 'income',
        category: 'tuition',
        amount: 5000000,
        description: 'Học phí khóa Flutter',
        studentName: 'Nguyễn Văn A',
        date: DateTime.now().toIso8601String(),
        status: 'completed',
      ),
    ];
  }

  // Mock data cho màn hình thời khóa biểu
  static List<Timetable> getMockTimetable() {
    return [
      Timetable(
        id: '1',
        studentId: '1',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        courseCode: 'FLUT101',
        instructor: 'Nguyễn Văn A',
        location: 'Phòng 101',
        dayOfWeek: 'Thứ 2',
        startTime: '08:00',
        endTime: '11:00',
        startDate: DateTime(2024, 1, 1),
        endDate: DateTime(2024, 5, 1),
        status: 'active',
      ),
      Timetable(
        id: '2',
        studentId: '1',
        courseId: '2',
        courseName: 'Cơ sở dữ liệu',
        courseCode: 'DB101',
        instructor: 'Trần Thị B',
        location: 'Phòng 102',
        dayOfWeek: 'Thứ 3',
        startTime: '13:00',
        endTime: '16:00',
        startDate: DateTime(2024, 1, 1),
        endDate: DateTime(2024, 5, 1),
        status: 'active',
      ),
    ];
  }

  // Mock data cho màn hình thông báo
  static List<Notification> getMockNotifications() {
    return [
      Notification(
        id: '1',
        title: 'Thông báo mới',
        content: 'Có một thông báo mới từ giáo viên',
        type: 'general',
        priority: 'normal',
        recipients: ['1', '2', '3'],
        createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
        updatedAt: DateTime.now(),
      ),
      Notification(
        id: '2',
        title: 'Bài tập mới',
        content: 'Bài tập môn học đã được đăng',
        type: 'assignment',
        priority: 'high',
        recipients: ['1', '2'],
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  // Lấy dữ liệu mẫu cho danh sách bài tập
  static List<Assignment> getMockAssignments() {
    return [
      Assignment(
        id: '1',
        title: 'Bài tập 1 - Lập trình hướng đối tượng',
        description: 'Viết chương trình quản lý sinh viên sử dụng OOP',
        dueDate: DateTime.now().add(const Duration(days: 7)),
        courseId: '1',
        courseName: 'Lập trình hướng đối tượng',
        instructorId: '1',
        instructorName: 'Nguyễn Văn A',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Assignment(
        id: '2',
        title: 'Bài tập 2 - Cơ sở dữ liệu',
        description: 'Thiết kế và triển khai cơ sở dữ liệu cho hệ thống quản lý',
        dueDate: DateTime.now().add(const Duration(days: 14)),
        courseId: '2',
        courseName: 'Cơ sở dữ liệu',
        instructorId: '2',
        instructorName: 'Trần Thị B',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  // Mock data cho màn hình thảo luận
  static List<Discussion> getMockDiscussions() {
    return [
      Discussion(
        id: '1',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        className: 'Flutter 2024',
        title: 'Thảo luận về Flutter',
        content: 'Các bạn thấy Flutter thế nào?',
        authorId: '1',
        authorName: 'Nguyễn Văn A',
        createdAt: DateTime.now(),
        replies: [
          DiscussionReply(
            id: '1',
            content: 'Flutter rất tốt',
            createdBy: '2',
            createdAt: DateTime.now(),
          ),
          DiscussionReply(
            id: '2',
            content: 'Dễ học và phát triển',
            createdBy: '3',
            createdAt: DateTime.now(),
          ),
        ],
      ),
      Discussion(
        id: '2',
        courseId: '2',
        courseName: 'Cơ sở dữ liệu',
        className: 'Database 2024',
        title: 'Thảo luận về Database',
        content: 'Các bạn thấy Database thế nào?',
        authorId: '1',
        authorName: 'Nguyễn Văn A',
        createdAt: DateTime.now(),
        replies: [
          DiscussionReply(
            id: '3',
            content: 'Database rất quan trọng',
            createdBy: '2',
            createdAt: DateTime.now(),
          ),
        ],
      ),
    ];
  }

  // Mock data cho màn hình phản hồi
  static List<UserFeedback> getMockFeedback() {
    return [
      UserFeedback(
        id: '1',
        title: 'Đánh giá môn học Flutter',
        content: 'Môn học rất bổ ích',
        userName: 'Nguyễn Văn A',
        status: 'approved',
        createdAt: DateTime.now(),
        response: 'Cảm ơn bạn đã đánh giá tích cực',
        respondedAt: DateTime.now(),
      ),
      UserFeedback(
        id: '2',
        title: 'Đánh giá môn học Database',
        content: 'Giảng viên giảng dạy rất tốt',
        userName: 'Nguyễn Văn A',
        status: 'pending',
        createdAt: DateTime.now(),
      ),
    ];
  }

  // Mock data cho màn hình tài liệu học tập
  static List<LearningMaterial> getMockLearningMaterials() {
    return [
      LearningMaterial(
        id: '1',
        courseId: '1',
        courseName: 'Lập trình Flutter',
        className: 'Flutter 2024',
        title: 'Tài liệu Flutter cơ bản',
        description: 'Tài liệu học Flutter từ cơ bản đến nâng cao',
        fileUrl: 'https://example.com/flutter-basic.pdf',
        type: 'pdf',
        uploadedBy: '1',
        uploadedAt: DateTime.now(),
        fileSize: 1024,
        status: 'active',
      ),
      LearningMaterial(
        id: '2',
        courseId: '2',
        courseName: 'Cơ sở dữ liệu',
        className: 'Database 2024',
        title: 'Tài liệu Database',
        description: 'Tài liệu học Database từ cơ bản đến nâng cao',
        fileUrl: 'https://example.com/database-basic.pdf',
        type: 'pdf',
        uploadedBy: '2',
        uploadedAt: DateTime.now(),
        fileSize: 2048,
        status: 'active',
      ),
    ];
  }

  // Mock data cho màn hình hoạt động của con
  static List<ChildActivity> getMockChildActivities() {
    return [
      ChildActivity(
        id: '1',
        childId: '1',
        title: 'Hoạt động ngoại khóa',
        description: 'Tham gia câu lạc bộ thể thao',
        date: DateTime(2024, 1, 1),
        location: 'Sân trường',
        status: 'completed',
        type: 'sports',
        notes: 'Tham gia tích cực',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      ChildActivity(
        id: '2',
        childId: '1',
        title: 'Hoạt động văn nghệ',
        description: 'Biểu diễn văn nghệ',
        date: DateTime(2024, 1, 15),
        location: 'Hội trường',
        status: 'upcoming',
        type: 'art',
        notes: 'Chuẩn bị biểu diễn',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  // Mock data cho màn hình hành vi của con
  static List<ChildBehavior> getMockChildBehaviors() {
    return [
      ChildBehavior(
        id: '1',
        childId: '1',
        date: DateTime(2024, 1, 1),
        type: 'positive',
        description: 'Tích cực tham gia hoạt động',
        teacher: 'Nguyễn Thị C',
        severity: 'low',
        notes: 'Rất tích cực',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      ChildBehavior(
        id: '2',
        childId: '1',
        date: DateTime(2024, 1, 15),
        type: 'negative',
        description: 'Đi học muộn',
        teacher: 'Nguyễn Thị C',
        severity: 'medium',
        notes: 'Cần cải thiện',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  // Mock data cho màn hình thanh toán
  static List<Payment> getMockPayments() {
    return [
      Payment(
        id: '1',
        studentId: '1',
        amount: 2000000,
        description: 'Học phí học kỳ 1',
        date: DateTime(2024, 1, 1),
        status: 'paid',
        method: 'bank_transfer',
        transactionId: 'TXN001',
        notes: 'Thanh toán học phí kỳ 1',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
      Payment(
        id: '2',
        studentId: '1',
        amount: 500000,
        description: 'Sách giáo khoa',
        date: DateTime(2024, 1, 15),
        status: 'pending',
        method: 'cash',
        transactionId: 'TXN002',
        notes: 'Thanh toán sách giáo khoa',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    ];
  }

  // Mock data cho màn hình lịch giảng dạy
  static List<Schedule> getMockSchedules() {
    return [
      Schedule(
        id: '1',
        title: 'Buổi học Flutter cơ bản',
        description: 'Học về các widget cơ bản trong Flutter',
        className: 'Flutter 2024',
        date: DateTime.now(),
        startTime: '08:00',
        endTime: '11:00',
        location: 'Phòng 101',
        status: 'active',
      ),
      Schedule(
        id: '2',
        title: 'Buổi học Flutter nâng cao',
        description: 'Học về state management trong Flutter',
        className: 'Flutter 2024',
        date: DateTime.now().add(const Duration(days: 1)),
        startTime: '08:00',
        endTime: '11:00',
        location: 'Phòng 101',
        status: 'active',
      ),
    ];
  }

  // Mock data cho màn hình đánh giá học sinh
  static List<StudentEvaluation> getMockEvaluations() {
    return [
      StudentEvaluation(
        id: '1',
        studentId: '1',
        studentName: 'Nguyễn Văn A',
        className: 'Flutter 2024',
        date: DateTime.now(),
        attendance: 9.0,
        participation: 8.5,
        homework: 9.0,
        quiz: 8.5,
        exam: 9.0,
        totalScore: 8.8,
        comment: 'Học sinh có tiến bộ tốt',
      ),
      StudentEvaluation(
        id: '2',
        studentId: '2',
        studentName: 'Trần Thị B',
        className: 'Flutter 2024',
        date: DateTime.now(),
        attendance: 8.5,
        participation: 9.0,
        homework: 8.5,
        quiz: 9.0,
        exam: 8.5,
        totalScore: 8.7,
        comment: 'Học sinh tích cực tham gia',
      ),
    ];
  }
} 