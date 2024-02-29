import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Timetable extends StatefulWidget {
  final Function(
    int,
  ) onDataSend;

  const Timetable({super.key, required this.onDataSend});

  @override
  State<Timetable> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Timetable>
    with SingleTickerProviderStateMixin {
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
    DateTime nowJst = currentTime; //現在時刻を取得

    String formattedHour = '${nowJst.hour}'.padLeft(2, '0');
    String formattedMinute = '${nowJst.minute}'.padLeft(2, '0');
    String formattedTime = '$formattedHour:$formattedMinute'; //string型にフォーマット

    List<String> weekdays = ['日', '月', '火', '水', '木', '金', '土'];
    String nowWeekday = weekdays[nowJst.weekday % 7]; // 今日の曜日を取得

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: const [
          Tab(text: '時間割'),
          Tab(text: '科目'),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: AspectRatio(
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 4, 12, 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Row(
                                    children: [
                                      Spacer(
                                        flex: 1,
                                      ),
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
                                      Spacer(
                                        flex: 2,
                                      ),
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
                                      Spacer(
                                        flex: 2,
                                      ),
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
                                      Spacer(
                                        flex: 2,
                                      ),
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
                                      Spacer(
                                        flex: 2,
                                      ),
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
                                      Spacer(
                                        flex: 1,
                                      ),
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
                      const Row(
                        children: [
                          Text(''),
                          SizedBox(
                            width: 21,
                          )
                        ],
                      ),
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
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
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
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          showtimetablesubject('101'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('102'),
                          const SizedBox(
                            height: 10,
                          ),
                          showtimetablesubject('103'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('104'),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          showtimetablesubject('201'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('202'),
                          const SizedBox(
                            height: 10,
                          ),
                          showtimetablesubject('203'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('204'),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          showtimetablesubject('301'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('302'),
                          const SizedBox(
                            height: 10,
                          ),
                          showtimetablesubject('303'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('304'),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          showtimetablesubject('401'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('402'),
                          const SizedBox(
                            height: 10,
                          ),
                          showtimetablesubject('403'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('404'),
                        ],
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          showtimetablesubject('501'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('502'),
                          const SizedBox(
                            height: 10,
                          ),
                          showtimetablesubject('503'),
                          const SizedBox(
                            height: 2,
                          ),
                          showtimetablesubject('504'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(children: [
              showsubjectdata('ECE'),
              showsubjectdata('ELD'),
              showsubjectdata('CE2'),
              showsubjectdata('BM1'),
              showsubjectdata('STW'),
              showsubjectdata('PLJ'),
              showsubjectdata('CE1'),
              showsubjectdata('SP'),
              showsubjectdata('AM'),
              showsubjectdata('AI'),
              showsubjectdata('APH'),
              showsubjectdata('INT'),
              showsubjectdata('AP1'),
              showsubjectdata('ICE3'),
              showsubjectdata('SP4'),
              showsubjectdata('RCT'),
              showsubjectdata('ECP4'),
              showsubjectdata('CIC'),
              showsubjectdata('CHE2'),
              showsubjectdata('PS'),
            ]),
          ),
        ],
      ),
    );
  }

  Widget showsubjectdata(String subjectid) {
    return FutureBuilder(
        future: getsubjectdata(subjectid),
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
            String classroom = subjectDoc['roomname'].toString();

            return Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 7),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('$name: '),
                              ],
                            ),
                            Column(
                              children: [
                                Text('講義室:$classroom'),
                                Text('担当:$teacher1'),
                                if (teacher2 != '') Text(teacher2)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
          }
        });
  }

  Widget showtimetablesubject(String period) {
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
          Color roomcolor = const Color(0xffffffff);
          Color textcolor = const Color(0xFF094D9E);
          if (isNowused(period)) {
            roomcolor = const Color.fromARGB(199, 82, 212, 255);
            textcolor = const Color.fromARGB(255, 39, 50, 249);
          }

          double sizewidth = MediaQuery.of(context).size.width * 0.14;
          double sizeheight = MediaQuery.of(context).size.height * 0.12;

          return Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: roomcolor, //背景色
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
                        onPressed: () {
                          // Navigator.of(context).pop(); // ダイアログを閉じる
                          widget.onDataSend(4); // 別のページに遷移
                        },
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: textcolor,
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

  Future<DocumentSnapshot> getsubjectdata(String subjectid) async {
    DocumentSnapshot subjectdata = await FirebaseFirestore.instance
        .collection('subjects')
        .doc(subjectid)
        .get();

    // 科目のドキュメントを取得して返す
    return subjectdata;
  }

  Future<DocumentSnapshot> getPeriodData(String timetableValue) async {
    // Firestoreからtimetableコレクションのドキュメントを取得
    DocumentSnapshot timetableDoc = await FirebaseFirestore.instance
        .collection('timetable')
        .doc('periods')
        .get();

    // timetableコレクション内のperiodsフィールドから該当するsubjectsの参照を取得
    DocumentReference subjectRef = timetableDoc[timetableValue];

    // subjectのドキュメントを取得して返す
    return subjectRef.get();
  }

  int getCurrentPeriod() {
    DateTime now = DateTime.now(); //現在時刻を取得
    int hour = now.hour;
    int minute = now.minute;

    if ((hour == 8 && minute >= 50) ||
        (hour == 9) ||
        (hour == 10 && minute <= 20)) {
      return 1;
    } else if ((hour == 10 && minute >= 30) || (hour == 11 && minute <= 59)) {
      return 2;
    } else if ((hour == 13 && minute >= 10) || (hour == 14 && minute <= 40)) {
      return 3;
    } else if ((hour == 14 && minute >= 50) ||
        (hour == 15) ||
        (hour == 16 && minute <= 20)) {
      return 4;
    } else {
      return 0;
    }
  }

  bool isNowused(String period) {
    String currentPeriod = getCurrentPeriod().toString();
    DateTime now = DateTime.now(); //現在時刻を取得
    String nowweekday = '0';
    if (now.weekday >= 1 && now.weekday <= 5) {
      nowweekday = now.weekday.toString();
    }
    String timetablevalue = '${nowweekday}0$currentPeriod';

    if (period == timetablevalue) {
      return true;
    } else {
      return false;
    }
  }
}
