import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color vacantColor = Color(0xFF66BD44);
    const Color occupiedColor = Color(0xfffff82c4);
    const Color unavailableColor = Color(0xFFA1AEBE);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50.0,
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
                    ).build(),
                    Room(
                      name: '研究室1-2',
                      author: 'サビケ',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '研究室1-3',
                      author: '島尻',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '研究室1-4',
                      author: '谷藤',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                    ).build(),
                    Room(
                      name: '研究室1-5',
                      author: '高良',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                    ).build(),
                    Room(
                      name: '研究室1-6',
                      author: '中平',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '研究室1-7',
                      author: '玉城(梓)',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '研究室1-8',
                      author: 'スリヨン',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '研究室1-9',
                      author: '和多野',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
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
                    ).build(),
                    Room(
                      name: '研究室1-2',
                      author: '4年メディア',
                      width: 130,
                      height: 100,
                      color: vacantColor,
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
                    ).build(),
                    Room(
                      name: '研究室1-4',
                      author: '4年機械',
                      width: 130,
                      height: 100,
                      color: vacantColor,
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
                    ).build(),
                    Room(
                      name: '研究室1-11',
                      author: '平良',
                      width: 100,
                      height: 50,
                      color: unavailableColor,
                    ).build(),
                    Room(
                      name: '研究室1-12',
                      author: '三宮',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '研究室1-13',
                      author: '嶽本',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                    ).build(),
                    Room(
                      name: '研究室1-14',
                      author: '今井',
                      width: 100,
                      height: 50,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '研究室1-15',
                      author: '空室',
                      width: 100,
                      height: 50,
                      color: unavailableColor,
                    ).build(),
                    Room(
                      name: '研究室1-16',
                      author: '武村',
                      width: 100,
                      height: 50,
                      color: occupiedColor,
                    ).build(),
                    Room(
                      name: '研究室1-17',
                      author: '空室',
                      width: 100,
                      height: 50,
                      color: unavailableColor,
                    ).build(),
                    Room(
                      name: '研究室1-18',
                      author: '山城',
                      width: 100,
                      height: 50,
                      color: vacantColor,
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
                    ).build(),
                    Room(
                      name: '準備室1',
                      author: '情報科',
                      width: 140,
                      height: 50,
                      color: unavailableColor,
                    ).build(),
                    Room(
                      name: '準備室2',
                      author: '情報科',
                      width: 140,
                      height: 50,
                      color: unavailableColor,
                    ).build(),
                    Room(
                      name: 'ネットワーク演習室',
                      author: 'メディア科',
                      width: 140,
                      height: 200,
                      color: vacantColor,
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
                    ).build(),
                    Room(
                      name: '創造工房',
                      author: '機械科',
                      width: 140,
                      height: 200,
                      color: vacantColor,
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
                    ).build(),
                    Row(
                      children: [
                        Room(
                          name: '',
                          author: '',
                          width: 70,
                          height: 100,
                          color: unavailableColor,
                        ).build(),
                        Room(
                          name: '',
                          author: '',
                          width: 70,
                          height: 100,
                          color: unavailableColor,
                        ).build(),
                      ],
                    ),
                    Room(
                      name: '精密計測室',
                      author: '生物科',
                      width: 140,
                      height: 100,
                      color: vacantColor,
                    ).build(),
                    Room(
                      name: '材料特性評価室',
                      author: '生物科',
                      width: 140,
                      height: 150,
                      color: vacantColor,
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

  Room({
    required this.name,
    required this.author,
    required this.width,
    required this.height,
    required this.color,
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
}
