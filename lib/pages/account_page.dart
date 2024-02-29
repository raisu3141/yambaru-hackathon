import "package:flutter/material.dart";
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

  void _generateCode() {
    setState(() {
      now = DateTime.now();
      _codeString = '$code $now';
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
