import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';
import 'screens/audio_screen.dart';
import 'widgets/player.dart';
import 'utils.dart';

ValueNotifier<AudioObject?> currentlyPlaying = ValueNotifier(null);

const double playerMinHeight = 70;
const double playerMaxHeight = 370;
const miniplayerPercentageDeclaration = 0.2;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miniplayer Demo',
      theme: ThemeData(
        primaryColor: Colors.grey[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late AudioObject audioObject = AudioObject(),
  @override
  Widget build(BuildContext context) {
    // AudioObject? audioObject;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(title: Text('Miniplayer Demo')),
              Expanded(
                child: AudioUi(
                  onTap: (audioObject) => currentlyPlaying.value = audioObject,
                ),
              ),
            ],
          ),
    //   currentlyPlaying.value != null ?
          //   Miniplayer(
          //     onDismiss: () {
          //       currentlyPlaying.value = null;
          //     },
          //     minHeight: 70,
          //     maxHeight: 370,
          //     builder: (height, percentage) => Center(
          //       child: Text('$height, $percentage'),
          //     ),
          //   )
          // //  : Container(

          // // ),
          ValueListenableBuilder(
            valueListenable: currentlyPlaying,
            builder: (BuildContext context, AudioObject? audioObject,
                    Widget? child) =>
                audioObject != null
                    ? DetailedPlayer(audioObject: audioObject)
                    : Container(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
        ],
      ),
    );
  }
}
