import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ImageWithMusic extends StatefulWidget {
  @override
  _ImageWithMusicState createState() => _ImageWithMusicState();
}

class _ImageWithMusicState extends State<ImageWithMusic> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String audioFilePath = 'assets/audios/audio.mp3';
  Source source = AssetSource('audios/audio.mp3');

  @override
  void initState() {
    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.playing) {
        setState(() {
          isPlaying = true;
        });
      } else if (state == PlayerState.paused ||
          state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
    super.initState();
  }

  playMusic() async {
    audioPlayer.play(
      source,
      position: Duration(milliseconds: 2500),
      mode: PlayerMode.mediaPlayer,
    );
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }

  stopAudio() async {
    await audioPlayer.stop();
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image with Music'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
              'assets/images/1.png'), // Replace with your image asset path
          IconButton(
            icon: isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
            onPressed: () {
              if (isPlaying) {
                pauseAudio();
              } else {
                playMusic();
              }
            },
            iconSize: 64.0,
            color: Colors.white,
          ),
          // IconButton(
          //   icon: Icon(Icons.stop),
          //   onPressed: stopAudio,
          //   iconSize: 48.0,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
//
// class ImageWithBackgroundMusic extends StatefulWidget {
//   @override
//   _ImageWithBackgroundMusicState createState() =>
//       _ImageWithBackgroundMusicState();
// }
//
// class _ImageWithBackgroundMusicState extends State<ImageWithBackgroundMusic> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   String audioUrl = 'assets/audios/audio.mp3';
//   String imageUrl = 'assets/images/1.png';
//   Source source = AssetSource("assets/audios/audio.mp3");
//   PlayerState audioPlayerState = PlayerState.stopped;
//
//   @override
//   void initState() {
//     super.initState();
//     playBackgroundMusic();
//   }
//
//   @override
//   void dispose() {
//     audioPlayer.release();
//     audioPlayer.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image with Background Music'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(imageUrl),
//           ElevatedButton(
//             child: Text('Stop Music'),
//             onPressed: () {
//               stopBackgroundMusic();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   playBackgroundMusic() async {
//     audioPlayer.play(
//       source,
//       volume: 5,
//       mode: PlayerMode.mediaPlayer,
//     );
//
//     setState(() {
//       audioPlayerState = PlayerState.playing;
//     });
//   }
//
//   stopBackgroundMusic() async {
//     await audioPlayer.stop();
//     setState(() {
//       audioPlayerState = PlayerState.stopped;
//     });
//   }
// }
