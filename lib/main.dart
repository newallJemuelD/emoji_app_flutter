import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedEmojiIndex = 0;

  List emoji = [
    './images/006-sad.png',
    './images/007-sad-1.png',
    './images/008-sad-2.png',
    './images/009-sad-3.png',
    './images/005-confused.png',
    './images/004-happy.png',
    './images/010-laughing.png',
    './images/001-cool.png',
    './images/003-in-love-1.png',
    './images/002-in-love.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'How is your mood today?',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 170,
                child: Image(
                  image: AssetImage(
                    emoji[selectedEmojiIndex],
                  ),
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                         BoxShadow(
                          color: Colors.grey[200],
                        ),
                         BoxShadow(
                          color: Colors.white,
                          spreadRadius: -8.0,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    height: 180,
                    margin: EdgeInsets.only(top: 50),
                    child: ListWheelScrollView(
                      itemExtent: 65,
                      useMagnifier: true,
                      magnification: 1.3,
                      onSelectedItemChanged: (index) => {
                        setState(() {
                          selectedEmojiIndex = index;
                        })
                      },
                      children: [
                        rating('1'),
                        rating('2'),
                        rating('3'),
                        rating('4'),
                        rating('5'),
                        rating('6'),
                        rating('7'),
                        rating('8'),
                        rating('9'),
                        rating('10'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rating(String rating) {
    return Container(
      child: Text(
        rating,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
