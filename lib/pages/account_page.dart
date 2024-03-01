import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:mic_factory/pages/auth.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int code = 249999;
  DateTime now = DateTime.now();
  late String _codeString = '$code $now';
  bool loginstate = false;

  void _generateCode() {
    setState(() {
      now = DateTime.now();
      _codeString = '$code $now';
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        loginstate = user != null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF094D9E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Spacer(),
                      FloatingActionButton.extended(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()), // ログインページの呼び出し
                          );
                        },
                        label: Text(
                          loginstate ? 'ログイン中' : 'ログインする',
                          style: TextStyle(fontSize: 16),
                        ),
                        icon: loginstate ? Icon(Icons.face) : Icon(Icons.login),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // ボタンの形状を設定
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                  SizedBox(height: 16,),
                  const Text(
                    '学生証QRコード',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  QrImageView(
                    data: _codeString,
                    size: 250,
                    padding: const EdgeInsets.all(25),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '学籍番号：$code',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$now',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _generateCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF094D9E),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.refresh,
                      color: Color(0xFF094D9E),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
