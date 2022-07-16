import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({Key? key}) : super(key: key);

  final AudioPlayer player = AudioPlayer();

  final List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];

  Widget buildKey({
    required Color color,
    required int soundNum,
  }) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
        ),
        onPressed: () async {
          // TODO: wait for fix
          await player.setPlayerMode(PlayerMode.mediaPlayer);
          await player.play(
            AssetSource('note$soundNum.wav'),
          );
        },
        child: const Text(''),
      ),
    );
  }

  List<Widget> listBuilder() {
    List<Widget> list = [];
    for (var i = 0; i < colors.length; i++) {
      list.add(buildKey(color: colors[i], soundNum: i));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    player.setPlayerMode(PlayerMode.mediaPlayer);
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: listBuilder(),
          ),
        ),
      ),
    );
  }
}
