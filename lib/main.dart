import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // function to changed sound

    // void playSound({name: String}) {
    //   final player = AudioCache();
    //   player.play(name);
    // }

    final List<int> numberList = [1, 2, 3, 4, 5, 6, 7];
    final List<ColorSwatch<int>> color = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.greenAccent,
      Colors.blue,
      Colors.purple
    ];
    final List<String> text = ['Do', 'Re', 'Mi', 'Fa', 'So', 'La', 'Si'];

    void playSound(int soundNumber) {
      final player = AudioCache();
      player.play('note$soundNumber.wav');
    }

    Expanded buildKey({Color color, int soundNumber, String text}) {
      return Expanded(
        child: FlatButton(
          color: color,
          onPressed: () {
            playSound(soundNumber);
          },
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0;
                i < color.length & numberList.length & text.length;
                i++)
              buildKey(
                  color: color[i], soundNumber: numberList[i], text: text[i]),
          ],
        )),
      ),
    );
  }
}
