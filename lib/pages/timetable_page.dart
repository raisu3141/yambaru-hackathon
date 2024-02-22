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
    Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        currentTime = DateTime.now();
      });
    });

     _tabController = TabController(length: 2, vsync: this); 

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
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs:[
            Tab(text:'時間割'),
            Tab(text: '科目'),
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$formattedTime $now_weekday', //現在時刻と曜日を表示
                  style: const TextStyle(
                    fontSize: 48,
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/images/account_icon_selected.png',
                        width: 64, height: 64), 
                        SizedBox(width: 8,),
                        Container(
                          padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                '月',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 32),
                              Text(
                                '火',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 32),
                              Text(
                                '水',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 32),
                              Text(
                                '木',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 32),
                              Text(
                                '金',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ], 
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
                Row(children: [Text(''), SizedBox(width: 21,)],),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(16, 35, 16, 35),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
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
                SizedBox(width: 14,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                    SizedBox(height: 10,),
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                  ],
                ),
                SizedBox(width: 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                    SizedBox(height: 10,),
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                  ],
                ),
                SizedBox(width: 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                    SizedBox(height: 10,),
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                  ],
                ),
                SizedBox(width: 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                    SizedBox(height: 10,),
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                  ],
                ),
                SizedBox(width: 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                    SizedBox(height: 10,),
                    showsubject('応用物理'),
                    SizedBox(height: 2,),
                    showsubject('応用物理'),
                  ],
                ),
              ],
            ),
          ],
        ),
        ],
      ),
    );

  }

  Widget showsubject(String text){
    return Container(
      child: ElevatedButton(
        child:  Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            children: [
              Text(
                '$text',
                style: TextStyle(
                  color: Color(0xFF094D9E),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10) 
                ),
            backgroundColor: Color(0xFFFFFFFF), //背景色
            side: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            
            padding: EdgeInsets.zero,
            minimumSize: Size(60, 100),
            maximumSize: Size(60, 100),
        ),
        onPressed: (){},
      ),
    );
  }
}