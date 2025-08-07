import 'package:just_audio/just_audio.dart';
import 'package:samtawad_team/custom_code/audio_player_handler.dart';
// import 'package:audio_service/audio_service.dart';

class GlobalAudioManager {
  static final AudioPlayer sharedPlayer = AudioPlayer();
  static final AudioPlayerHandler audioHandler =
      AudioPlayerHandler(sharedPlayer);
  // static late AudioHandler audioHandler;
}
