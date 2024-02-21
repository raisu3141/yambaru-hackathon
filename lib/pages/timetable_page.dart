import 'package:flutter/material.dart';
import 'dart:async';


class Timetable extends StatefulWidget {
  const Timetable({super.key});

  @override
  State<Timetable> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Timetable> {
    late DateTime currentTime;

  @override
  void initState() {
    super.initState();
    // 最初に時刻を取得
    currentTime = DateTime.now();
    // 1分ごとに時刻を更新
    Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  @override

    Widget build(BuildContext context) {
    DateTime now_jst = currentTime.add(Duration(hours: 9)); //現在時刻を取得

    String formattedHour = '${now_jst.hour}'.padLeft(2, '0');
    String formattedMinute = '${now_jst.minute}'.padLeft(2, '0');
    String formattedTime = '$formattedHour:$formattedMinute'; //string型にフォーマット

    List<String> weekdays = ['日', '月', '火', '水', '木', '金', '土'];
    String now_weekday = weekdays[now_jst.weekday % 7]; // 今日の曜日を取得


    return Scaffold(
      body: Center(
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                Text(
                  '$formattedTime $now_weekday', //現在時刻と曜日を表示
                  style: TextStyle(
                    fontSize: 48,
                  ),
                ),
              ],
            )
          ]
        ),
      ),
    );
  }
}