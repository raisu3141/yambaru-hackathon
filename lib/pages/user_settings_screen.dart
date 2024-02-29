// user_settings_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  late SharedPreferences prefs;
  String userName = "ユーザー名";
  String userDetail = "詳細情報";
  File? avatarImage;

  @override
  void initState() {
    super.initState();
    _loadUserSettings();
  }

  _loadUserSettings() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? userName;
      userDetail = prefs.getString('userDetail') ?? userDetail;
      String? avatarImagePath = prefs.getString('avatarImagePath');
      if (avatarImagePath != null) {
        avatarImage = File(avatarImagePath);
      }
    });
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        avatarImage = File(pickedFile.path);
      }
    });
  }

  _saveUserSettings() async {
    await prefs.setString('userName', userName);
    await prefs.setString('userDetail', userDetail);
    if (avatarImage != null) {
      await prefs.setString('avatarImagePath', avatarImage!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー設定'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: avatarImage != null
                    ? FileImage(avatarImage!)
                    : const NetworkImage(
                        'https://pbs.twimg.com/profile_images/1761639045296472064/zvcfP8IN_400x400.jpg',
                      ) as ImageProvider<Object>,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'ユーザー名',
              ),
              controller: TextEditingController(text: userName),
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  userDetail = value;
                });
              },
              decoration: const InputDecoration(
                hintText: '詳細情報',
              ),
              controller: TextEditingController(text: userDetail),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveUserSettings();
                Navigator.pop(context);
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
