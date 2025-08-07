import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;

  final AudioPlayer _player = AudioPlayer();

  final ValueNotifier<bool> isPlaying = ValueNotifier(false);
  final ValueNotifier<Duration> position = ValueNotifier(Duration.zero);
  final ValueNotifier<Duration> duration = ValueNotifier(Duration.zero);
  final ValueNotifier<bool> isLoading = ValueNotifier(true);
  final ValueNotifier<bool> isLooping = ValueNotifier(false);

  AudioManager._internal() {
    _player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
      isLoading.value = state.processingState == ProcessingState.loading ||
          state.processingState == ProcessingState.buffering;
    });

    _player.positionStream.listen((pos) {
      position.value = pos;
    });

    _player.durationStream.listen((dur) {
      duration.value = dur ?? Duration.zero;
    });
  }

  Future<void> playAudio(String url, {bool loop = false}) async {
    try {
      await _player.stop();
      await _player.setLoopMode(loop ? LoopMode.one : LoopMode.off);
      isLooping.value = loop;
      await _player.setUrl(url);
      await _player.play();
    } catch (e) {
      debugPrint("Error playing audio: $e");
    }
  }

  void play() => _player.play();
  void pause() => _player.pause();
  void toggleLoop() async {
    final loop = !isLooping.value;
    isLooping.value = loop;
    await _player.setLoopMode(loop ? LoopMode.one : LoopMode.off);
  }

  void seek(Duration pos) => _player.seek(pos);

  void dispose() {
    _player.dispose();
  }
}
