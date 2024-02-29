// user_settings.dart
import 'dart:io';

class UserSettings {
  String userName;
  String userDetail;
  File? avatarImage;

  UserSettings({
    required this.userName,
    required this.userDetail,
    this.avatarImage,
  });
}
