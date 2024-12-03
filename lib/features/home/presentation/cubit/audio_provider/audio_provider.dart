import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class AudioProvider with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isPlay = false;
  final AudioPlayer audioPlayer = AudioPlayer();

  AudioProvider() {
    // Listen for the audio completion event
    audioPlayer.onPlayerComplete.listen((event) {
      // Replay the audio when it finishes
      playMusic();
    });
  }

  Future<void> playMusic() async {
    _isPlay = true;
    await audioPlayer.play(AssetSource('music/music.mp3'));
    notifyListeners();
  }

  Future<void> pauseMusic() async {
    _isPlay = false;
    await audioPlayer.pause();
    notifyListeners();
  }

  bool get isplay => _isPlay;
}
