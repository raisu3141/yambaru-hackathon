import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Timetable> with SingleTickerProviderStateMixin {
    late DateTime currentTime;
    late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 最初に時刻を取得
    currentTime = DateTime.now();
    // 1分ごとに時刻を更新
    Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });

     _tabController = TabController(length: 2, vsync: this);

  }

  @override

    Widget build(BuildContext context) {
    DateTime nowJst = currentTime.add(const Duration(hours: 9)); //現在時刻を取得

    String formattedHour = '${nowJst.hour}'.padLeft(2, '0');
    String formattedMinute = '${nowJst.minute}'.padLeft(2, '0');
    String formattedTime = '$formattedHour:$formattedMinute'; //string型にフォーマット

    List<String> weekdays = ['日', '月', '火', '水', '木', '金', '土'];
    String nowWeekday = weekdays[nowJst.weekday % 7]; // 今日の曜日を取得



    return Scaffold (
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs:const [
            Tab(text:'時間割'),
            Tab(text: '科目'),
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: AspectRatio(
              aspectRatio: MediaQuery.of(context).size.width / MediaQuery.of(context).size.height,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$formattedTime $nowWeekday', //現在時刻と曜日を表示
                      style: const TextStyle(
                        fontSize: 48,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/account_icon_selected.png',
                              width: 64,
                              height: 64,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Spacer(flex: 1,),
                                    Flexible(
                                      child: Text(
                                        '月',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 2,),
                                    Flexible(
                                      child: Text(
                                        '火',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 2,),
                                    Flexible(
                                      child: Text(
                                        '水',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 2,),
                                    Flexible(
                                      child: Text(
                                        '木',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 2,),
                                    Flexible(
                                      child: Text(
                                        '金',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    Spacer(flex: 1,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Row(children: [Text(''), SizedBox(width: 21,)],),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 35, 16, 35),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 40,),
                              Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 80,),
                              Text(
                                '3',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 40,),
                              Text(
                                '4',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        showsubject('101'),
                        const SizedBox(height: 2,),
                        showsubject('102'),
                        const SizedBox(height: 10,),
                        showsubject('103'),
                        const SizedBox(height: 2,),
                        showsubject('104'),
                      ],
                    ),
                    const SizedBox(width: 2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        showsubject('201'),
                        const SizedBox(height: 2,),
                        showsubject('202'),
                        const SizedBox(height: 10,),
                        showsubject('203'),
                        const SizedBox(height: 2,),
                        showsubject('204'),
                      ],
                    ),
                    const SizedBox(width: 2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        showsubject('301'),
                        const SizedBox(height: 2,),
                        showsubject('302'),
                        const SizedBox(height: 10,),
                        showsubject('303'),
                        const SizedBox(height: 2,),
                        showsubject('304'),
                      ],
                    ),
                    const SizedBox(width: 2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        showsubject('401'),
                        const SizedBox(height: 2,),
                        showsubject('402'),
                        const SizedBox(height: 10,),
                        showsubject('403'),
                        const SizedBox(height: 2,),
                        showsubject('404'),
                      ],
                    ),
                    const SizedBox(width: 2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        showsubject('501'),
                        const SizedBox(height: 2,),
                        showsubject('502'),
                        const SizedBox(height: 10,),
                        showsubject('503'),
                        const SizedBox(height: 2,),
                        showsubject('504'),
                      ],
                    ),
                  ],
                ),
              ],
                      ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                showsubjectdata('hoge'),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget showsubjectdata(String subjectid){
    return Container(
      child: Row(
        children: [
          Text('$subjectid')
        ],
      )
    );
  }

  Widget showsubject(String period) {
    return FutureBuilder<DocumentSnapshot>(
      future: getPeriodData(period),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // ローディング中の表示
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Container(
            child: const Text('Er'),
          ); // エラーが発生した場合の表示
        } else {
          DocumentSnapshot subjectDoc = snapshot.data!;
          String name = subjectDoc['name'].toString(); //subjectのnameを格納
          String teacher1 = subjectDoc['teacher1'].toString();
          String teacher2 = subjectDoc['teacher2'].toString();
          String roomname = subjectDoc['roomname'].toString();

          double sizewidth = MediaQuery.of(context).size.width * 0.14;
          double sizeheight = MediaQuery.of(context).size.height * 0.12;

          return Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFFFFFFFF), //背景色
                side: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
                padding: EdgeInsets.zero,
                minimumSize: Size(sizewidth, sizeheight),
                maximumSize: Size(sizewidth, sizeheight),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            '教室：$roomname',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '先生：$teacher1',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            teacher2,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Jump',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Close',
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xFF094D9E),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<DocumentSnapshot> getPeriodData(String timetableValue) async {
    // Firestoreからtimetableコレクションのドキュメントを取得
    DocumentSnapshot timetableDoc =
        await FirebaseFirestore.instance.collection('timetable').doc('periods').get();


    // timetableコレクション内のperiodsフィールドから該当するsubjectsの参照を取得
    DocumentReference subjectRef = timetableDoc[timetableValue];

    // subjectのドキュメントを取得して返す
    return subjectRef.get();
  }
}