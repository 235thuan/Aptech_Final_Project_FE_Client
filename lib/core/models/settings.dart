// Model cho cài đặt hệ thống
class Settings {
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

  Settings({
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

  // Tạo Settings từ JSON
  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      siteName: json['siteName'] as String,
      siteDescription: json['siteDescription'] as String,
      contactEmail: json['contactEmail'] as String,
      contactPhone: json['contactPhone'] as String,
      address: json['address'] as String,
      theme: json['theme'] as String,
      language: json['language'] as String,
      maintenanceMode: json['maintenanceMode'] as bool,
      registrationEnabled: json['registrationEnabled'] as bool,
      emailNotifications: json['emailNotifications'] as bool,
      smsNotifications: json['smsNotifications'] as bool,
    );
  }

  // Chuyển Settings thành JSON
  Map<String, dynamic> toJson() {
    return {
      'siteName': siteName,
      'siteDescription': siteDescription,
      'contactEmail': contactEmail,
      'contactPhone': contactPhone,
      'address': address,
      'theme': theme,
      'language': language,
      'maintenanceMode': maintenanceMode,
      'registrationEnabled': registrationEnabled,
      'emailNotifications': emailNotifications,
      'smsNotifications': smsNotifications,
    };
  }
} 