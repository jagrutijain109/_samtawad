// import 'package:audio_service/audio_service.dart';
// import 'package:just_audio/just_audio.dart';

// class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
//   final AudioPlayer _player;

//   AudioPlayerHandler(this._player) {
//     _player.playerStateStream.listen((state) {
//       playbackState.add(
//         PlaybackState(
//           controls: [
//             MediaControl.skipToPrevious,
//             state.playing ? MediaControl.pause : MediaControl.play,
//             MediaControl.skipToNext,
//           ],
//           systemActions: const {MediaAction.seek},
//           androidCompactActionIndices: const [0, 1, 2],
//           processingState: AudioProcessingState.ready,
//           playing: state.playing,
//           updatePosition: _player.position,
//         ),
//       );
//     });
//   }

//   // Future<void> playMedia(String url, String title) async {
//   //   await _player.setAudioSource(AudioSource.uri(Uri.parse(url), tag: title));
//   //   mediaItem.add(MediaItem(id: url, title: title));
//   //   await _player.play();
//   // }

//   // Future<void> playMedia(String url, String title,
//   //     {bool isLooping = false}) async {
//   //   try {
//   //     await _player.stop();
//   //     await _player.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
//   //     await _player.setAudioSource(AudioSource.uri(Uri.parse(url), tag: title));
//   //     mediaItem.add(MediaItem(id: url, title: title));
//   //     await _player.play();
//   //   } catch (e) {
//   //     print("AudioPlayerHandler error: $e");
//   //   }
//   // }

//   Future<void> playMedia(
//     String url,
//     String title, {
//     bool isLooping = false,
//     String? imageUrl,
//   }) async {
//     try {
//       final media = MediaItem(
//         id: url,
//         title: title,
//         artUri: imageUrl != null ? Uri.parse(imageUrl) : null,
//       );

//       await _player.stop();
//       await _player.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);

//       // await _player.setAudioSource(
//       //   AudioSource.uri(
//       //     Uri.parse(url),
//       //     tag: media, // ✅ Set full MediaItem as tag
//       //   ),
//       // );
//       //
//       await _player.setAudioSource(
//         AudioSource.uri(
//           Uri.parse(url),
//           tag: MediaItem(
//             id: url,
//             title: title,
//             artUri: imageUrl != null ? Uri.parse(imageUrl) : null,
//           ),
//         ),
//       );

//       mediaItem.add(media); // ✅ Still useful for other listeners
//       await _player.play();
//     } catch (e) {
//       print("AudioPlayerHandler error: $e");
//     }
//   }

//   @override
//   Future<void> play() => _player.play();
//   @override
//   Future<void> pause() => _player.pause();
//   @override
//   Future<void> stop() => _player.stop();
//   @override
//   Future<void> seek(Duration position) => _player.seek(position);
// }

import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AudioPlayerHandler extends BaseAudioHandler with SeekHandler {
  final AudioPlayer _player;

  AudioPlayerHandler(this._player) {
    _player.playerStateStream.listen((state) {
      playbackState.add(
        PlaybackState(
          controls: [
            MediaControl.skipToPrevious,
            state.playing ? MediaControl.pause : MediaControl.play,
            MediaControl.skipToNext,
          ],
          systemActions: const {MediaAction.seek},
          androidCompactActionIndices: const [0, 1, 2],
          processingState: AudioProcessingState.ready,
          playing: state.playing,
          updatePosition: _player.position,
        ),
      );
    });
  }

  //correct one

  // Future<void> playMedia(
  //   String url,
  //   String title, {
  //   bool isLooping = false,
  //   String? imageUrl,
  //   String? collectionName,
  // }) async {
  //   try {
  //     final media = MediaItem(
  //       id: url,
  //       title: title,
  //       artUri: (imageUrl != null && imageUrl.trim().isNotEmpty)
  //           ? Uri.tryParse(imageUrl)
  //           : null,
  //       extras: {
  //         'type': collectionName ?? '', // ✅ Embed the collection name as type
  //       },
  //     );

  //     await _player.stop();
  //     await _player.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
  //     await _player.setAudioSource(
  //       AudioSource.uri(
  //         Uri.parse(url),
  //         tag: media,
  //       ),
  //     );

  //     mediaItem.add(media);
  //     await _player.play();
  //   } catch (e) {
  //     print("AudioPlayerHandler error: $e");
  //   }
  // }
  //

  Future<void> playMedia(
    String url,
    String title, {
    bool isLooping = false,
    String? imageUrl,
    String? collectionName,
    Duration? initialSeekPosition,
    int? index,
    // DocumentReference<Map<String, dynamic>>? audioRef,
    DocumentReference<Object?>? audioRef,
  }) async {
    try {
      final safeIndex = index ?? 0;

      final media = MediaItem(
        id: url,
        title: title,
        artUri: (imageUrl != null && imageUrl.trim().isNotEmpty)
            ? Uri.tryParse(imageUrl)
            : null,
        extras: {
          'type': collectionName ?? '',
          'index': safeIndex,
          // if (audioRef != null) 'audioRefPath': audioRef.path,
          if (audioRef != null && audioRef.path.split('/').length.isOdd)
            'audioRefPath': audioRef.path,
        },
      );

      await _player.stop();
      await _player.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
      await _player.setAudioSource(
        AudioSource.uri(Uri.parse(url), tag: media),
      );
      mediaItem.add(media);

      // ✅ Wait for player to be ready
      await _player.processingStateStream.firstWhere(
        (state) => state == ProcessingState.ready,
      );

      if (initialSeekPosition != null) {
        await _player.seek(initialSeekPosition);
      }

      await _player.play();
    } catch (e) {
      print("AudioPlayerHandler error in playMedia: $e");
    }
  }

//working on nAVIGATION
  // Future<void> playMedia(
  //   String url,
  //   String title, {
  //   bool isLooping = false,
  //   String? imageUrl,
  //   String? collectionName,
  //   Duration? initialSeekPosition,
  // }) async {
  //   try {
  //     final media = MediaItem(
  //       id: url,
  //       title: title,
  //       artUri: (imageUrl != null && imageUrl.trim().isNotEmpty)
  //           ? Uri.tryParse(imageUrl)
  //           : null,
  //       extras: {'type': collectionName ?? ''},
  //     );

  //     await _player.stop();
  //     await _player.setLoopMode(isLooping ? LoopMode.one : LoopMode.off);
  //     await _player.setAudioSource(
  //       AudioSource.uri(Uri.parse(url), tag: media),
  //     );
  //     mediaItem.add(media);

  //     // ✅ Wait for player to be ready
  //     await _player.processingStateStream.firstWhere(
  //       (state) => state == ProcessingState.ready,
  //     );

  //     if (initialSeekPosition != null) {
  //       await _player.seek(initialSeekPosition);
  //     }

  //     await _player.play();
  //   } catch (e) {
  //     print("AudioPlayerHandler error in playMedia: $e");
  //   }
  // }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> seek(Duration position) => _player.seek(position);
}
