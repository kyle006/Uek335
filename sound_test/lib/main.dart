import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(SoundTestApp());
}

class SoundTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoundTestScreen(),
    );
  }
}

class SoundTestScreen extends StatelessWidget {
  final AudioPlayer _audioPlayer = AudioPlayer();

  SoundTestScreen() {
    _preloadSound();
  }

  void _preloadSound() async {
    await _audioPlayer.setSource(AssetSource('sound1.mp3'));
  }

  void _playSound() async {
    print("Soundeffekt ausgelöst!");
    await _audioPlayer.resume(); // Play the preloaded sound
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sound Test")),
      body: Center(
        child: ElevatedButton(
          onPressed: _playSound,
          child: Text("Sound abspielen"),
        ),
      ),
    );
  }
}
