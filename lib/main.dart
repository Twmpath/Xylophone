import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});


  void playSound(int noteNumber) {
    final AudioPlayer player = AudioPlayer();
    player.play(AssetSource('note$noteNumber.wav'),);
//                  player1.resume()
  }
   Expanded buildKeyButton(int keyNumber) {
     List<Color> colours = [Colors.red, Colors.orange, Colors.yellow, Colors.green,
     Colors.teal, Colors.blue, Colors.purple];

    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: FractionallySizedBox(
          widthFactor: 1-(0.1*keyNumber),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colours[keyNumber-1]),
            ),
            onPressed: (){
              playSound(keyNumber);
            },
            child: Text(''),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Load up the assets so they're waiting to be played

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i=1; i<=7; i++)
                buildKeyButton(i),
            ],
          ),
          ),
        ),
      ),
    );
  }
}
