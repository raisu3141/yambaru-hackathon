// user_settings_screen.dart
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String userName = "";
  String userDetail = "";
  File? avatarImage;

  String? userid = FirebaseAuth.instance.currentUser?.uid;

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
              onChanged: (text) {
                setState(() {
                  userName = text;
                });
              },
              decoration: const InputDecoration(
                hintText: 'ユーザー名',
              ),
              // controller: TextEditingController(text: userName),
            ),
            const SizedBox(height: 16.0),
            // TextField(
            //   onChanged: (text) {
            //     setState(() {
            //       userDetail = text;
            //     });
            //   },
            //   decoration: const InputDecoration(
            //     hintText: '詳細情報',
            //   ),
            //   // controller: TextEditingController(text: userDetail),
            // ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addtofirebase();
                Navigator.pop(context);
              },
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }

  Future _addtofirebase() async{
    final db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final userset = <String, dynamic>{
      'userid': userid,
      'username': userName,
      'userdetail': userDetail,
    };

    // Add a new document with a generated ID
    await db.collection("userset").doc(userid).set(userset);

  }
}
