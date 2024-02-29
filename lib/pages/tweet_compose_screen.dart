// tweet_compose_screen.dart
import 'package:flutter/material.dart';

class TweetComposeScreen extends StatefulWidget {
  const TweetComposeScreen({super.key});

  @override
  State<TweetComposeScreen> createState() => _TweetComposeScreenState();
}

class _TweetComposeScreenState extends State<TweetComposeScreen> {
  TextEditingController tweetController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController additionalTextController = TextEditingController();

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
              controller: tweetController,
              decoration: const InputDecoration(
                hintText: 'ツイートを入力してください...',
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                hintText: '画像URLを入力してください...',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: additionalTextController,
              decoration: const InputDecoration(
                hintText: '追加のテキストを入力してください...',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // ここで新しいツイートを作成
                final newTweet = Tweet(
                  username: 'ユーザー名',
                  tweetText: tweetController.text,
                  imageUrl: imageUrlController.text,
                  additionalText: additionalTextController.text,
                  likeCount: 0,
                  isLiked: false,
                  comments: [],
                  isCommentOpen: false,
                );

                Navigator.pop(context, newTweet);
              },
              child: const Text('ツイートする'),
            ),
          ],
        ),
      ),
    );
  }
}

class Tweet {
  final String username;
  final String tweetText;
  final String imageUrl;
  final String additionalText;
  int likeCount;
  bool isLiked;
  List<Comment> comments;
  bool isCommentOpen;

  Tweet({
    required this.username,
    required this.tweetText,
    required this.imageUrl,
    required this.additionalText,
    this.likeCount = 0,
    this.isLiked = false,
    this.comments = const [],
    this.isCommentOpen = false,
  });
}

class Comment {
  final String username;
  final String text;
  int likeCount;
  bool isLiked;

  Comment({
    required this.username,
    required this.text,
    this.likeCount = 0,
    this.isLiked = false,
  });
}
