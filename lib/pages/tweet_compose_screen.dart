import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TweetComposeScreen extends StatefulWidget {
  const TweetComposeScreen({super.key});

  @override
  State<TweetComposeScreen> createState() => _TweetComposeScreenState();
}

class _TweetComposeScreenState extends State<TweetComposeScreen> {
  // TextEditingController tweetController = TextEditingController();
  // TextEditingController imageUrlController = TextEditingController();
  // TextEditingController additionalTextController = TextEditingController();
  String tweettext = '';
  String imgurl = '';
  String addtext = '';

  String? userid = FirebaseAuth.instance.currentUser?.uid;
  DateTime now = DateTime.now();
  late String code = '$userid' + '_' + '$now';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新しいツイート'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ここでメイン画面のユーザーアイコンを表示
            const CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1761639045296472064/zvcfP8IN_400x400.jpg',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                hintText: 'ツイートを入力してください...',
              ),
              onChanged: (text) {
                tweettext = text;                
              },
              maxLines: 5,
            ),
            const SizedBox(height: 16.0),
            TextField(
              // controller: imageUrlController,
              decoration: const InputDecoration(
                hintText: '画像URLを入力してください...',
              ),
              onChanged: (text) {
                imgurl = text;                
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              // controller: additionalTextController,
              decoration: const InputDecoration(
                hintText: '追加のテキストを入力してください...',
              ),
              onChanged: (text) {
                addtext = text;                
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async{
                // 新しいツイートをFirestoreに保存
                await _addtofirebase();
                Navigator.pop(context);
              },
              child: const Text('ツイートする'),
            ),
          ],
        ),
      ),
    );
  }

  Future _addtofirebase() async{
    final db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final tweet = <String, dynamic>{
      'username': userid,
      'tweetText': tweettext,
      'imageUrl': imgurl,
      'additionalText': addtext,
      'likeCount': 0,
      'isLiked': false,
      'comments': [],
      'isCommentOpen': false,
      'timestamp': FieldValue.serverTimestamp(),
    };

    // Add a new document with a generated ID
    await db.collection("tweets").doc(code).set(tweet);

  }
}
