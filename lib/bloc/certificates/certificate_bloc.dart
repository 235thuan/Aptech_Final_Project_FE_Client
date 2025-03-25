import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/certificate.dart';
import '../../core/services/certificate_service.dart';

// Events
abstract class CertificateEvent extends Equatable {
  const CertificateEvent();

  @override
  List<Object?> get props => [];
}

class LoadCertificates extends CertificateEvent {}

class AddCertificate extends CertificateEvent {
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final String issueDate;
  final String expiryDate;
  final String status;
  final String certificateNumber;

  const AddCertificate({
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.issueDate,
    required this.expiryDate,
    required this.status,
    required this.certificateNumber,
  });

  @override
  List<Object?> get props => [studentId, studentName, courseId, courseName, issueDate, expiryDate, status, certificateNumber];
}

class UpdateCertificate extends CertificateEvent {
  final String id;
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final String issueDate;
  final String expiryDate;
  final String status;
  final String certificateNumber;

  const UpdateCertificate({
    required this.id,
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.issueDate,
    required this.expiryDate,
    required this.status,
    required this.certificateNumber,
  });

  @override
  List<Object?> get props => [id, studentId, studentName, courseId, courseName, issueDate, expiryDate, status, certificateNumber];
}

class DeleteCertificate extends CertificateEvent {
  final String id;

  const DeleteCertificate(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class CertificateState extends Equatable {
  const CertificateState();

  @override
  List<Object?> get props => [];
}

class CertificateInitial extends CertificateState {}

class CertificateLoading extends CertificateState {}

class CertificateLoaded extends CertificateState {
  final List<Certificate> certificates;

  const CertificateLoaded(this.certificates);

  @override
  List<Object?> get props => [certificates];
}

class CertificateError extends CertificateState {
  final String message;

  const CertificateError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class CertificateBloc extends Bloc<CertificateEvent, CertificateState> {
  final CertificateService _certificateService;

  CertificateBloc(this._certificateService) : super(CertificateInitial()) {
    on<LoadCertificates>(_onLoadCertificates);
    on<AddCertificate>(_onAddCertificate);
    on<UpdateCertificate>(_onUpdateCertificate);
    on<DeleteCertificate>(_onDeleteCertificate);
  }

  Future<void> _onLoadCertificates(
    LoadCertificates event,
    Emitter<CertificateState> emit,
  ) async {
    try {
      emit(CertificateLoading());
      final certificates = await _certificateService.getCertificates();
      emit(CertificateLoaded(certificates));
    } catch (e) {
      emit(CertificateError(e.toString()));
    }
  }

  Future<void> _onAddCertificate(
    AddCertificate event,
    Emitter<CertificateState> emit,
  ) async {
    try {
      emit(CertificateLoading());
      await _certificateService.addCertificate(
        studentId: event.studentId,
        studentName: event.studentName,
        courseId: event.courseId,
        courseName: event.courseName,
        issueDate: event.issueDate,
        expiryDate: event.expiryDate,
        status: event.status,
        certificateNumber: event.certificateNumber,
      );
      final certificates = await _certificateService.getCertificates();
      emit(CertificateLoaded(certificates));
    } catch (e) {
      emit(CertificateError(e.toString()));
    }
  }

  Future<void> _onUpdateCertificate(
    UpdateCertificate event,
    Emitter<CertificateState> emit,
  ) async {
    try {
      emit(CertificateLoading());
      await _certificateService.updateCertificate(
        id: event.id,
        studentId: event.studentId,
        studentName: event.studentName,
        courseId: event.courseId,
        courseName: event.courseName,
        issueDate: event.issueDate,
        expiryDate: event.expiryDate,
        status: event.status,
        certificateNumber: event.certificateNumber,
      );
      final certificates = await _certificateService.getCertificates();
      emit(CertificateLoaded(certificates));
    } catch (e) {
      emit(CertificateError(e.toString()));
    }
  }

  Future<void> _onDeleteCertificate(
    DeleteCertificate event,
    Emitter<CertificateState> emit,
  ) async {
    try {
      emit(CertificateLoading());
      await _certificateService.deleteCertificate(event.id);
      final certificates = await _certificateService.getCertificates();
      emit(CertificateLoaded(certificates));
    } catch (e) {
      emit(CertificateError(e.toString()));
    }
  }
} 