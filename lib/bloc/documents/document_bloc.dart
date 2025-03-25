import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/document.dart';
import '../../core/services/document_service.dart';

// Events
abstract class DocumentEvent extends Equatable {
  const DocumentEvent();

  @override
  List<Object?> get props => [];
}

class LoadDocuments extends DocumentEvent {}

class AddDocument extends DocumentEvent {
  final String title;
  final String description;
  final String type;
  final String category;
  final String courseId;
  final String courseName;
  final String fileUrl;
  final int fileSize;

  const AddDocument({
    required this.title,
    required this.description,
    required this.type,
    required this.category,
    required this.courseId,
    required this.courseName,
    required this.fileUrl,
    required this.fileSize,
  });

  @override
  List<Object?> get props => [title, description, type, category, courseId, courseName, fileUrl, fileSize];
}

class UpdateDocument extends DocumentEvent {
  final String id;
  final String title;
  final String description;
  final String type;
  final String category;
  final String courseId;
  final String courseName;
  final String fileUrl;
  final int fileSize;

  const UpdateDocument({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.category,
    required this.courseId,
    required this.courseName,
    required this.fileUrl,
    required this.fileSize,
  });

  @override
  List<Object?> get props => [id, title, description, type, category, courseId, courseName, fileUrl, fileSize];
}

class DeleteDocument extends DocumentEvent {
  final String id;

  const DeleteDocument(this.id);

  @override
  List<Object?> get props => [id];
}

// States
abstract class DocumentState extends Equatable {
  const DocumentState();

  @override
  List<Object?> get props => [];
}

class DocumentInitial extends DocumentState {}

class DocumentLoading extends DocumentState {}

class DocumentLoaded extends DocumentState {
  final List<Document> documents;

  const DocumentLoaded(this.documents);

  @override
  List<Object?> get props => [documents];
}

class DocumentError extends DocumentState {
  final String message;

  const DocumentError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  final DocumentService _documentService;

  DocumentBloc(this._documentService) : super(DocumentInitial()) {
    on<LoadDocuments>(_onLoadDocuments);
    on<AddDocument>(_onAddDocument);
    on<UpdateDocument>(_onUpdateDocument);
    on<DeleteDocument>(_onDeleteDocument);
  }

  Future<void> _onLoadDocuments(
    LoadDocuments event,
    Emitter<DocumentState> emit,
  ) async {
    try {
      emit(DocumentLoading());
      final documents = await _documentService.getDocuments();
      emit(DocumentLoaded(documents));
    } catch (e) {
      emit(DocumentError(e.toString()));
    }
  }

  Future<void> _onAddDocument(
    AddDocument event,
    Emitter<DocumentState> emit,
  ) async {
    try {
      emit(DocumentLoading());
      await _documentService.addDocument(
        title: event.title,
        description: event.description,
        type: event.type,
        category: event.category,
        courseId: event.courseId,
        courseName: event.courseName,
        fileUrl: event.fileUrl,
        fileSize: event.fileSize,
      );
      final documents = await _documentService.getDocuments();
      emit(DocumentLoaded(documents));
    } catch (e) {
      emit(DocumentError(e.toString()));
    }
  }

  Future<void> _onUpdateDocument(
    UpdateDocument event,
    Emitter<DocumentState> emit,
  ) async {
    try {
      emit(DocumentLoading());
      await _documentService.updateDocument(
        id: event.id,
        title: event.title,
        description: event.description,
        type: event.type,
        category: event.category,
        courseId: event.courseId,
        courseName: event.courseName,
        fileUrl: event.fileUrl,
        fileSize: event.fileSize,
      );
      final documents = await _documentService.getDocuments();
      emit(DocumentLoaded(documents));
    } catch (e) {
      emit(DocumentError(e.toString()));
    }
  }

  Future<void> _onDeleteDocument(
    DeleteDocument event,
    Emitter<DocumentState> emit,
  ) async {
    try {
      emit(DocumentLoading());
      await _documentService.deleteDocument(event.id);
      final documents = await _documentService.getDocuments();
      emit(DocumentLoaded(documents));
    } catch (e) {
      emit(DocumentError(e.toString()));
    }
  }
} 