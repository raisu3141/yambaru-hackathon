import 'package:flutter/material.dart';

class TwitterClone extends StatefulWidget {
  const TwitterClone({super.key});

  @override
  State<TwitterClone> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TwitterClone> {
  List<Tweet> tweets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/220px-Logo_of_Twitter.svg.png',
            width: 40, // サイズを調整する場合はここで指定
            height: 40,
            fit: BoxFit.cover, // 画像をフィットさせる
          ),
        ),
        title: const Text('試運転ツイッター'),
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          return TweetCard(tweet: tweets[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // ツイート作成画面を表示し、新しいツイートを取得
          final newTweet = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TweetComposeScreen(),
            ),
          );

          // 新しいツイートがnullでなければ、リストに追加
          if (newTweet != null) {
            setState(() {
              tweets.add(newTweet);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Tweet {
  final String username;
  final String tweetText;
  final String imageUrl;
  final String additionalText;

  Tweet({
    required this.username,
    required this.tweetText,
    required this.imageUrl,
    required this.additionalText,
  });
}

class TweetCard extends StatefulWidget {
  final Tweet tweet;

  const TweetCard({super.key, required this.tweet});

  @override
  _TweetCardState createState() => _TweetCardState();
}

class _TweetCardState extends State<TweetCard> {
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://placekitten.com/100/100'),
            ),
            title: Text(widget.tweet.username),
            subtitle: Text(widget.tweet.tweetText),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    // いいねの処理を追加
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () {
                    // リツイートの処理を追加
                  },
                ),
              ],
            ),
          ),
          // 画像を表示
          Image.network(
            widget.tweet.imageUrl,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          // 追加のテキストを表示
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.tweet.additionalText),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'コメント',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Divider(),
                // コメントを表示
                for (var comment in comments)
                  ListTile(
                    title: Text(comment),
                  ),
                const SizedBox(height: 8.0),
                // コメント入力フィールド
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: 'コメントを追加...',
                        ),
                        onSubmitted: (String value) {
                          // コメントを追加
                          setState(() {
                            comments.add(value);
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        // コメントを追加
                        // ここでもコメントを追加する処理を追加できます
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TweetComposeScreen extends StatefulWidget {
  const TweetComposeScreen({super.key});

  @override
  _TweetComposeScreenState createState() => _TweetComposeScreenState();
}

class _TweetComposeScreenState extends State<TweetComposeScreen> {
  TextEditingController tweetController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController(); // 追加
  TextEditingController additionalTextController =
      TextEditingController(); // 追加

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
                // ツイートを投稿する処理
                final newTweet = Tweet(
                  username: 'ユーザー名', // 仮のユーザー名
                  tweetText: tweetController.text,
                  imageUrl: imageUrlController.text, // 入力された画像URL
                  additionalText: additionalTextController.text, // 入力された追加テキスト
                );

                // ツイートを閉じる前に新しいツイートを返す
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
