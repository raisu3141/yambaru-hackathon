import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color vacantColor = Color(0xFF66BD44);
    const Color occupiedColor = Color(0xFFFF82C4);
    const Color unavailableColor = Color(0xFFA1AEBE);
    

    return Scaffold(
      floatingActionButton: SizedBox(
        width: 220.0,
        height: 100.0,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          splashColor: Colors.transparent, // 波紋効果を透明に
          highlightElevation: 0.0,
          child: const Image(
            image: AssetImage('assets/images/notes.png'),
            width: double.infinity,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Room(
                      name: '研究室1-1',
                      author: '学生入室不可',
                      width: 100,
                      height: 50,
                      color: unavailableColor,
                      roomid: 0101,
                    ).build(),
                    Room(
                      name: '研究室1-2',
                      author: 'サビケ',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0102,
                    ).build(),
                    Room(
                      name: '研究室1-3',
                      author: '島尻',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0103,
                    ).build(),
                    Room(
                      name: '研究室1-4',
                      author: '谷藤',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                      roomid: 0104,
                    ).build(),
                    Room(
                      name: '研究室1-5',
                      author: '高良',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                      roomid: 0105,
                    ).build(),
                    Room(
                      name: '研究室1-6',
                      author: '中平',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0106,
                    ).build(),
                    Room(
                      name: '研究室1-7',
                      author: '玉城(梓)',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0107,
                    ).build(),
                    Room(
                      name: '研究室1-8',
                      author: 'スリヨン',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0108,
                    ).build(),
                    Room(
                      name: '研究室1-9',
                      author: '和多野',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                      roomid: 0109,
                    ).build(),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Room(
                      name: '講義室1-1',
                      author: '4年情報',
                      width: 130,
                      height: 100,
                      color: occupiedColor,
                      roomid: 1101,
                    ).build(),
                    Room(
                      name: '研究室1-2',
                      author: '4年メディア',
                      width: 130,
                      height: 100,
                      color: vacantColor,
                      roomid: 1102,
                    ).build(),
                    const SizedBox(
                      height: 150.0,
                    ),
                    Room(
                      name: '講義室1-3',
                      author: '4年生物',
                      width: 130,
                      height: 100,
                      color: vacantColor,
                      roomid: 1103,
                    ).build(),
                    Room(
                      name: '研究室1-4',
                      author: '4年機械',
                      width: 130,
                      height: 100,
                      color: vacantColor,
                      roomid: 1104,
                    ).build(),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Room(
                      name: '研究室1-10',
                      author: '田中(博)',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                      roomid: 0110,
                    ).build(),
                    Room(
                      name: '研究室1-11',
                      author: '平良',
                      width: 100,
                      height: 50,
                      color: unavailableColor,
                      roomid: 0111,
                    ).build(),
                    Room(
                      name: '研究室1-12',
                      author: '三宮',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0112,
                    ).build(),
                    Room(
                      name: '研究室1-13',
                      author: '嶽本',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                      roomid: 0113,
                    ).build(),
                    Room(
                      name: '研究室1-14',
                      author: '今井',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0114,
                    ).build(),
                    Room(
                      name: '研究室1-15',
                      author: '空室',
                      width: 100,
                      height: 50,
                      color: unavailableColor,
                      roomid: 0115,
                    ).build(),
                    Room(
                      name: '研究室1-16',
                      author: '武村',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                      roomid: 0116,
                    ).build(),
                    Room(
                      name: '研究室1-17',
                      author: '空室',
                      width: 100,
                      height: 50,
                      color: unavailableColor,
                      roomid: 0117,
                    ).build(),
                    Room(
                      name: '研究室1-18',
                      author: '山城',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                      roomid: 0118,
                    ).build(),
                  ],
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    Room(
                      name: '情報通信工学実験室',
                      author: '情報科',
                      width: 140,
                      height: 200,
                      color: vacantColor,
                      roomid: 2101,
                    ).build(),
                    Room(
                      name: '準備室1',
                      author: '情報科',
                      width: 140,
                      height: 50,
                      color: unavailableColor,
                      roomid: 1,
                    ).build(),
                    Room(
                      name: '準備室2',
                      author: '情報科',
                      width: 140,
                      height: 50,
                      color: unavailableColor,
                      roomid: 1,
                    ).build(),
                    Room(
                      name: 'ネットワーク演習室',
                      author: 'メディア科',
                      width: 140,
                      height: 200,
                      color: vacantColor,
                      roomid: 2102,
                    ).build(),
                    const SizedBox(
                      height: 100,
                    ),
                    Room(
                      name: 'テクノセンター1-2',
                      author: '機械科',
                      width: 140,
                      height: 100,
                      color: unavailableColor,
                      roomid: 1,
                    ).build(),
                    Room(
                      name: '創造工房',
                      author: '機械科',
                      width: 140,
                      height: 200,
                      color: vacantColor,
                      roomid: 2103,
                    ).build(),
                    const SizedBox(
                      height: 50,
                    ),
                    Room(
                      name: '中央機器分析室',
                      author: '生物科',
                      width: 140,
                      height: 200,
                      color: vacantColor,
                      roomid: 0,
                    ).build(),
                    Row(
                      children: [
                        Room(
                          name: '',
                          author: '',
                          width: 70,
                          height: 100,
                          color: unavailableColor,
                          roomid: 1,
                        ).build(),
                        Room(
                          name: '',
                          author: '',
                          width: 70,
                          height: 100,
                          color: unavailableColor,
                          roomid: 1,
                        ).build(),
                      ],
                    ),
                    Room(
                      name: '精密計測室',
                      author: '生物科',
                      width: 140,
                      height: 100,
                      color: vacantColor,
                      roomid: 0,
                    ).build(),
                    Room(
                      name: '材料特性評価室',
                      author: '生物科',
                      width: 140,
                      height: 150,
                      color: vacantColor,
                      roomid: 2104,
                    ).build(),
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}

class Room {
  final String name;
  final String author;
  final int width;
  final int height;
  final Color color;
  final int roomid;

  Room({
    required this.name,
    required this.author,
    required this.width,
    required this.height,
    required this.color,
    required this.roomid,
  });


  Widget build() {
    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              author,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isNowused(int roomid) {
    int period = getCurrentPeriod(); //現在何限目か取得



    return true;
  }

  Future<DocumentSnapshot> getSubjectName(int roomid) async {
    // Firestoreからtimetableコレクションのドキュメントを取得
    DocumentSnapshot timetableDoc =
        await FirebaseFirestore.instance.collection('timetable').doc('periods').get();


    // timetableコレクション内のperiodsフィールドから該当するsubjectsの参照を取得
    DocumentReference subjectRef = timetableDoc[timetableValue];

    // subjectのドキュメントを取得して返す
    return subjectRef.get();
  }

  int getCurrentPeriod() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;

    if ((hour == 8 && minute >= 50) || (hour == 9 && minute <= 20)) {
      return 1;
    } else if ((hour == 10 && minute >= 30) || (hour == 11 && minute <= 59)) {
      return 2;
    } else if ((hour == 13 && minute >= 10) || (hour == 14 && minute <= 40)) {
      return 3;
    } else if ((hour == 14 && minute >= 50) || (hour == 16 && minute <= 20)) {
      return 4;
    } else {
      return 0;
    }
  }
}
