import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../core/models/settings.dart';
import '../../core/services/settings_service.dart';

// Events
abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [];
}

class LoadSettings extends SettingsEvent {}

class UpdateSettings extends SettingsEvent {
  final String siteName;
  final String siteDescription;
  final String contactEmail;
  final String contactPhone;
  final String address;
  final String theme;
  final String language;
  final bool maintenanceMode;
  final bool registrationEnabled;
  final bool emailNotifications;
  final bool smsNotifications;

  const UpdateSettings({
    required this.siteName,
    required this.siteDescription,
    required this.contactEmail,
    required this.contactPhone,
    required this.address,
    required this.theme,
    required this.language,
    required this.maintenanceMode,
    required this.registrationEnabled,
    required this.emailNotifications,
    required this.smsNotifications,
  });

  @override
  List<Object?> get props => [siteName, siteDescription, contactEmail, contactPhone, address, theme, language, maintenanceMode, registrationEnabled, emailNotifications, smsNotifications];
}

// States
abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final Settings settings;

  const SettingsLoaded(this.settings);

  @override
  List<Object?> get props => [settings];
}

class SettingsError extends SettingsState {
  final String message;

  const SettingsError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsService _settingsService;

  SettingsBloc(this._settingsService) : super(SettingsInitial()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
  }

  Future<void> _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(SettingsLoading());
      final settings = await _settingsService.getSettings();
      emit(SettingsLoaded(settings));
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }

  Future<void> _onUpdateSettings(
    UpdateSettings event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(SettingsLoading());
      await _settingsService.updateSettings(
        siteName: event.siteName,
        siteDescription: event.siteDescription,
        contactEmail: event.contactEmail,
        contactPhone: event.contactPhone,
        address: event.address,
        theme: event.theme,
        language: event.language,
        maintenanceMode: event.maintenanceMode,
        registrationEnabled: event.registrationEnabled,
        emailNotifications: event.emailNotifications,
        smsNotifications: event.smsNotifications,
      );
      final settings = await _settingsService.getSettings();
      emit(SettingsLoaded(settings));
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }
} 