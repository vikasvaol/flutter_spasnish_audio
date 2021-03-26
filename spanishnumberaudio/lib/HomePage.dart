import 'package:flutter/material.dart';
import 'NumberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioplayer = AudioCache();
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.orange, "Two"),
    NumberAudio("three.wav", Colors.lightBlue, "Three"),
    NumberAudio("four.wav", Colors.yellow, "Four"),
    NumberAudio("five.wav", Colors.green, "Five"),
    NumberAudio("six.wav", Colors.pink, "Six"),
    NumberAudio("seven.wav", Colors.grey, "Seven"),
    NumberAudio("eight.wav", Colors.brown, "Eight"),
    NumberAudio("nine.wav", Colors.blueGrey, "Nine"),
    NumberAudio("ten.wav", Colors.teal, "Ten"),
  ];

  play(String uri) {
    audioplayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('spanish number'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.all(10.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.0,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: numberList.length,
                      itemBuilder: (context, i) => SizedBox(
                            width: 100.0,
                            height: 50.0,
                            child: RaisedButton(
                              color: numberList[i].buttonColor,
                              child: Text(
                                numberList[i].buttonText,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                play(numberList[i].audioUri);
                              },
                            ),
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
