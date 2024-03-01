// user_settings_data.dart
import 'dart:io';

class UserSettingsData {
  String userName;
  String userDetail;
  File? avatarImage;

  UserSettingsData({
    required this.userName,
    required this.userDetail,
    this.avatarImage,
  });
}


