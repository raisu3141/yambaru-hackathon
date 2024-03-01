import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mic_factory/pages/tweet_compose_screen.dart';
import 'package:mic_factory/pages/user_settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TwitterClone extends StatefulWidget {
  const TwitterClone({super.key});

  @override
  State<TwitterClone> createState() => _TwitterCloneState();
}

class _TwitterCloneState extends State<TwitterClone> {
  List<Tweet> tweets = [];
  late String mainUserName;
  late String mainAvatarImagePath =
      'https://pbs.twimg.com/profile_images/1761639045296472064/zvcfP8IN_400x400.jpg';

  @override
  void initState() {
    super.initState();
    _loadMainUserInfo();
    _fetchTweets();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  _loadMainUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      mainUserName = prefs.getString('userName') ?? "デフォルトユーザー名";
      mainAvatarImagePath = prefs.getString('avatarImagePath') ??
          "https://pbs.twimg.com/profile_images/1761639045296472064/zvcfP8IN_400x400.jpg";
    });
  }

Future<void> _fetchTweets() async {
  // Firestoreのインスタンスを取得
  final db = FirebaseFirestore.instance;

  try {
    // "Tweets"コレクションへの参照を取得
    final tweetsCollection = db.collection("tweets");
    print("Tweetsコレクションへの参照を取得しました");

    // コレクション内のすべてのドキュメントを取得
    final snapshot = await tweetsCollection.get();
    print("ドキュメントを取得しました");

    // ドキュメントのリストを反復処理
    for (var doc in snapshot.docs) {
      // ドキュメントのデータを取得してTweetオブジェクトを作成
      final tweet = Tweet(
        userid: doc['userid'],
        tweetText: doc['tweetText'],
        imageUrl: doc['imageUrl'],
        additionalText: doc['additionalText'],
        likeCount: doc['likeCount'],
        code: doc['tweetid'],
        // isLiked: false,
        // comments: [],
        // isCommentOpen: false,
      );
      print("Tweetオブジェクトを作成しました");

      // 作成したTweetオブジェクトをtweetsリストに追加
      tweets.add(tweet);
      print("Tweetをリストに追加しました");
    }

    // データをフェッチしてリストが更新されたことを通知
    setState(() {
      print("データのフェッチが完了しました");
    });
  } catch (e) {
    // エラー処理
    print("Error fetching data: $e");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserSettingsScreen(),
              ),
            ).then((_) {
              _loadMainUserInfo();
            });
          },
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(mainAvatarImagePath),
          ),
        ),
        title: const Text('試運転ツイッター'),
      ),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          return TweetCard(
            tweet: tweets[index],
            onCommentToggle: () {
              setState(() {
                tweets[index].isCommentOpen = !tweets[index].isCommentOpen;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTweet = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TweetComposeScreen(),
            ),
          );
          _fetchTweets();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Tweet {
  final String userid;
  final String tweetText;
  final String imageUrl;
  final String additionalText;
  final String code;
  int likeCount;
  bool isLiked;
  List<Comment> comments;
  bool isCommentOpen;

  Tweet({
    required this.userid,
    required this.tweetText,
    required this.imageUrl,
    required this.additionalText,
    required this.code,
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


class TweetCard extends StatefulWidget {
  final Tweet tweet;
  final VoidCallback onCommentToggle;

  const TweetCard(
      {super.key, required this.tweet, required this.onCommentToggle});

  @override
  _TweetCardState createState() => _TweetCardState();

  
}

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> fetchUserData(String collectionName) async {
    try {

      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _firestore.collection('userset').doc(collectionName).get();

      if (documentSnapshot.exists) {
        final userData = documentSnapshot.data()!;
        return {
          'username': userData['username'],
         //  'detail': userData['userdatail'],
        };
      } else {
        throw Exception('Document does not exist');
      }
    } catch (e) {
      throw Exception('Error fetching user data: $e');
    }
  }

  Future<void> incrementFieldValue(String documentId) async {
    try {
      // 指定されたドキュメントの参照を取得
      final documentReference = _firestore.collection('tweets').doc(documentId);
      
      // フィールドの値をインクリメント
      await documentReference.update({
        'likeCount': FieldValue.increment(1),
      });
    } catch (e) {
      print('Error updating field: $e');
    }
  }
}


class _TweetCardState extends State<TweetCard> {
  final commentController = TextEditingController();
  String name = '';
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      FirestoreService firestoreService = FirestoreService();
      final userData = await firestoreService.fetchUserData(widget.tweet.userid);
      setState(() {
        name = userData['username']; // 取得したユーザー名をセット
      });
    } catch (error) {
      print('Error: $error');
    }
  }
  void incrementFieldValue(String documentId) async {
    try {
      FirestoreService firestoreService = FirestoreService();
      firestoreService.incrementFieldValue(widget.tweet.code);
    } catch (error) {
      print('Error: $error');
    }
  }

  
  @override
  Widget build(BuildContext context) {
     
    

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage('https://placekitten.com/100/100'),
            ),
            title: Text(name),
            subtitle: Text(widget.tweet.tweetText),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    widget.tweet.isLiked
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  color: widget.tweet.isLiked ? Colors.red : null,
                  onPressed: () {
                    // いいねの処理
                    setState(() {
                      if (widget.tweet.isLiked) {
                        widget.tweet.likeCount--;
                      } else {
                        incrementFieldValue(widget.tweet.code);
                      }
                      widget.tweet.isLiked = !widget.tweet.isLiked;
                    });
                  },
                ),
                Text('${widget.tweet.likeCount}'),
                IconButton(
                  icon: Icon(
                    widget.tweet.isCommentOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                  onPressed: () {
                    widget.onCommentToggle();
                  },
                ),
              ],
            ),
          ),
          Image.network(
            widget.tweet.imageUrl,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.tweet.additionalText),
          ),
          if (widget.tweet.isCommentOpen)
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
                  for (var comment in widget.tweet.comments)
                    CommentWidget(comment: comment),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: commentController,
                          decoration: const InputDecoration(
                            hintText: 'コメントを追加...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          setState(() {
                            widget.tweet.comments.add(
                              Comment(
                                username: 'ユーザー名',
                                text: commentController.text,
                              ),
                            );
                            commentController.clear();
                          });
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


class CommentWidget extends StatefulWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://placekitten.com/100/100'),
      ),
      title: Text(widget.comment.username),
      subtitle: Text(widget.comment.text),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              widget.comment.isLiked ? Icons.favorite : Icons.favorite_border,
            ),
            color: widget.comment.isLiked ? Colors.red : null,
            onPressed: () {
              setState(() {
                widget.comment.isLiked = !widget.comment.isLiked;
              });
            },
          ),
          Text('${widget.comment.likeCount}'),
        ],
      ),
    );
  }
}

// class TweetComposeScreen extends StatefulWidget {
//   const TweetComposeScreen({super.key});

//   @override
//   _TweetComposeScreenState createState() => _TweetComposeScreenState();
// }

// class _TweetComposeScreenState extends State<TweetComposeScreen> {
//   TextEditingController tweetController = TextEditingController();
//   TextEditingController imageUrlController = TextEditingController();
//   TextEditingController additionalTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('新しいツイート'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: tweetController,
//               decoration: const InputDecoration(
//                 hintText: 'ツイートを入力してください...',
//               ),
//               maxLines: 5,
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: imageUrlController,
//               decoration: const InputDecoration(
//                 hintText: '画像URLを入力してください...',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextField(
//               controller: additionalTextController,
//               decoration: const InputDecoration(
//                 hintText: '追加のテキストを入力してください...',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 final newTweet = Tweet(
//                   username: 'ユーザー名',
//                   tweetText: tweetController.text,
//                   imageUrl: imageUrlController.text,
//                   additionalText: additionalTextController.text,
//                   likeCount: 0,
//                   isLiked: false,
//                   comments: [],
//                   isCommentOpen: false,
//                 );

//                 Navigator.pop(context, newTweet);
//               },
//               child: const Text('ツイートする'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


