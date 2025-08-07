// // // Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:audio_service/audio_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samtawad_team/custom_code/global_audio_manager.dart';
import 'package:samtawad_team/custom_code/audio_player_handler.dart';
import 'package:samtawad_team/pages/component/play_widget/play_widget_widget.dart';
import 'package:samtawad_team/pages/component/audio_cont/audio_cont_widget.dart';

// working with previous and next previous
// class AudioPlayerWidget extends StatefulWidget {
//   final List<DocumentReference> audioRefs;
//   final int? initialId;
//   final int? initialPosition;
//   final double? width;
//   final double? height;
//
//   const AudioPlayerWidget({
//     Key? key,
//     required this.audioRefs,
//     this.initialId,
//     this.initialPosition,
//     this.width,
//     this.height,
//   }) : super(key: key);
//
//   @override
//   State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
// }
//
// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   final AudioPlayer _player = GlobalAudioManager.sharedPlayer;
//   final _audioHandler = GlobalAudioManager.audioHandler;
//
//   int? _currentId;
//   int? _currentIndex;
//
//   String title = '';
//   String audioUrl = '';
//   String? imageUrl;
//   bool _isLooping = false;
//   bool _isPlaying = false;
//   bool _loading = true;
//   bool _isAutoSwitching = false;
//
//   Duration _duration = Duration.zero;
//   Duration _position = Duration.zero;
//
//   List<Map<String, dynamic>?> _audioDataCache = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _audioDataCache = List<Map<String, dynamic>?>.filled(widget.audioRefs.length, null);
//     _initializeAudio();
//   }
//
//   Future<void> _initializeAudio() async {
//     if (widget.initialId != null) {
//       _currentId = widget.initialId;
//       _currentIndex = await _findIndexInRefs(widget.initialId!);
//     }
//
//     if (_currentIndex == null) {
//       _currentIndex = 0;
//     }
//
//     try {
//       final initialRef = widget.audioRefs[_currentIndex!];
//       final doc = await initialRef.get();
//       final data = doc.data() as Map<String, dynamic>? ?? {};
//
//       if (_audioDataCache.length <= _currentIndex!) {
//         _audioDataCache.length = widget.audioRefs.length;
//       }
//       _audioDataCache[_currentIndex!] = data;
//       _currentId ??= data['id'] as int?;
//     } catch (e) {
//       debugPrint('Failed to load initial audio metadata: $e');
//       return;
//     }
//
//     _setupAudioSession();
//     _setupListeners();
//
//     await _loadData(initial: true);
//     // _prefetchRemainingMetadataInBackground();
//   }
//   Future<void> _prefetchAllRemainingAudios() async {
//     try {
//       final futures = <Future<void>>[];
//
//       for (int i = 0; i < widget.audioRefs.length; i++) {
//         if (_audioDataCache[i] != null) continue;
//
//         futures.add(widget.audioRefs[i].get().then((doc) {
//           final data = doc.data() as Map<String, dynamic>? ?? {};
//           _audioDataCache[i] = data;
//         }));
//       }
//
//       await Future.wait(futures);
//       debugPrint("All remaining audios prefetched.");
//     } catch (e) {
//       debugPrint("Error prefetching all metadata: $e");
//     }
//   }
//
//
//   Future<int?> _findIndexInRefs(int targetId) async {
//     final fetchFutures = widget.audioRefs.map((ref) => ref.get()).toList();
//     final snapshots = await Future.wait(fetchFutures);
//
//     for (int i = 0; i < snapshots.length; i++) {
//       final data = snapshots[i].data() as Map<String, dynamic>? ?? {};
//       _audioDataCache[i] = data; // ✅ Use assignment, not add()
//       if (data['id'] == targetId) return i;
//     }
//
//     return null;
//   }
//
//   void _setupAudioSession() async {
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration.music());
//     session.becomingNoisyEventStream.listen((_) => _player.pause());
//     session.interruptionEventStream.listen((event) {
//       if (event.begin) {
//         _player.pause();
//       } else if (event.type == AudioInterruptionType.pause) {
//         _player.play();
//       }
//     });
//   }
//
//   void _setupListeners() {
//     _player.positionStream.listen((pos) {
//       if (!mounted) return;
//       setState(() => _position = pos);
//     });
//     _player.durationStream.listen((dur) {
//       if (!mounted) return;
//       setState(() => _duration = dur ?? Duration.zero);
//     });
//     _player.playerStateStream.listen((state) async {
//       if (!mounted) return;
//       if (mounted) {
//         setState(() {
//           _isPlaying = state.playing;
//           _loading = state.processingState == ProcessingState.loading ||
//               state.processingState == ProcessingState.buffering;
//         });
//       }
//       if (state.processingState == ProcessingState.completed &&
//           !_isLooping &&
//           !_isAutoSwitching) {
//         _isAutoSwitching = true;
//         await _playNextById();
//         _isAutoSwitching = false;
//       }
//     });
//   }
//
//   Future<void> _loadData({bool initial = false}) async {
//     if (_currentIndex == null ||
//         _currentIndex! < 0 ||
//         _currentIndex! >= widget.audioRefs.length) {
//       if (mounted) {
//         setState(() {
//           _loading = false;
//           title = 'Invalid audio reference';
//         });
//       }
//       return;
//     }
//
//     final cachedData = _audioDataCache[_currentIndex!];
//     final Map<String, dynamic> data = cachedData ??
//         await widget.audioRefs[_currentIndex!]
//             .get()
//             .then((doc) => doc.data() as Map<String, dynamic>? ?? {});
//
//     _audioDataCache[_currentIndex!] = data;
//
//     if (mounted) {
//       setState(() {
//         _loading = true;
//         title = data['audio_title'] ?? 'Untitled';
//         audioUrl = data['audio'] ?? '';
//         imageUrl = data['image'] ?? '';
//       });
//     }
//
//     try {
//       final collectionName = widget.audioRefs[_currentIndex!].parent.id;
//
//       final positionToSeek = (initial && widget.initialPosition != null)
//           ? Duration(seconds: widget.initialPosition!)
//           : Duration.zero;
//
//       await _audioHandler.playMedia(
//         audioUrl,
//         title,
//         imageUrl: imageUrl,
//         isLooping: _isLooping,
//         collectionName: collectionName,
//         initialSeekPosition: positionToSeek,
//         index: _currentIndex!,
//       );
//       // 👇 FULL METADATA PREFETCH AFTER INITIAL PLAYBACK BEGINS
//       if (initial) {
//         Future.delayed(const Duration(milliseconds: 500), () {
//           _prefetchAllRemainingAudios(); // <- your renamed method
//         });
//       }
//     } catch (e) {
//       if (mounted) {
//         setState(() {
//           title = 'Error: ${e.toString()}';
//         });
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _loading = false);
//       }
//     }
//   }
//
//   Future<void> _playNextById() async {
//     if (_currentId == null) return;
//     final nextId = _currentId! + 1;
//     final index = _audioDataCache.indexWhere((data) => data?['id'] == nextId);
//     if (index != -1) {
//       if (mounted) {
//         setState(() {
//           _currentId = nextId;
//           _currentIndex = index;
//           _loading = true;
//         });
//       }
//       await _loadData();
//     } else {
//       print("No audio found with id=$nextId");
//     }
//   }
//
//   Future<void> _playPreviousById() async {
//     if (_currentId == null) return;
//     final prevId = _currentId! - 1;
//     final index = _audioDataCache.indexWhere((data) => data?['id'] == prevId);
//     if (index != -1) {
//       if (mounted) {
//         setState(() {
//           _currentId = prevId;
//           _currentIndex = index;
//           _loading = true;
//         });
//       }
//       await _loadData();
//     } else {
//       print("No audio found with id=$prevId");
//     }
//   }
//
//   void _togglePlayPause() {
//     _player.playing ? _audioHandler.pause() : _audioHandler.play();
//   }
//
//   void _toggleLoop() async {
//     if (mounted) {
//       setState(() => _isLooping = !_isLooping);
//     }
//     await _player.setLoopMode(_isLooping ? LoopMode.one : LoopMode.off);
//   }
//
//   String _formatDuration(Duration d) {
//     final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }
//
//   @override
//   void dispose() {
//     _isAutoSwitching = false;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_loading) return const Center(child: CircularProgressIndicator());
//     if (audioUrl.isEmpty) return const Center(child: Text("Audio failed to load."));
//
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AudioContWidget(documentRef: widget.audioRefs[_currentIndex!]),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Container(
//               width: widget.width ?? double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFC44C24),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Audio: $_currentId',
//                     style: const TextStyle(fontSize: 14, color: Colors.white70),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           _isLooping ? Icons.repeat_one : Icons.repeat,
//                           color: _isLooping ? Colors.greenAccent : Colors.white,
//                         ),
//                         onPressed: _toggleLoop,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.skip_previous, color: Colors.white),
//                         onPressed: _playPreviousById,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           _isPlaying ? Icons.pause : Icons.play_arrow,
//                           color: Colors.white,
//                           size: 32,
//                         ),
//                         onPressed: _togglePlayPause,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.skip_next, color: Colors.white),
//                         onPressed: _playNextById,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(_formatDuration(_position),
//                           style: const TextStyle(color: Colors.white, fontSize: 12)),
//                       Text(_formatDuration(_duration),
//                           style: const TextStyle(color: Colors.white, fontSize: 12)),
//                     ],
//                   ),
//                   Slider(
//                     activeColor: Colors.white,
//                     inactiveColor: Colors.white54,
//                     min: 0,
//                     max: _duration.inSeconds.toDouble(),
//                     value: _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
//                     onChanged: (value) =>
//                         _player.seek(Duration(seconds: value.toInt())),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           PlayWidgetWidget(audioList: widget.audioRefs[_currentIndex!]),
//         ],
//       ),
//     );
//   }
// }

class AudioPlayerWidget extends StatefulWidget {
  final List<DocumentReference> audioRefs;
  final int? initialId;
  final int? initialPosition;
  final double? width;
  final double? height;

  const AudioPlayerWidget({
    Key? key,
    required this.audioRefs,
    this.initialId,
    this.initialPosition,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _player = GlobalAudioManager.sharedPlayer;
  final _audioHandler = GlobalAudioManager.audioHandler;

  int? _currentId;
  int? _currentIndex;

  String title = '';
  String audioUrl = '';
  String? imageUrl;
  bool _isLooping = false;
  bool _isPlaying = false;
  bool _loading = true;
  bool _isAutoSwitching = false;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  List<Map<String, dynamic>?> _audioDataCache = [];

  @override
  void initState() {
    super.initState();
    _audioDataCache = List<Map<String, dynamic>?>.filled(widget.audioRefs.length, null);
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    if (widget.initialId != null) {
      _currentId = widget.initialId;
      _currentIndex = await _findIndexInRefs(widget.initialId!);
    }

    if (_currentIndex == null) {
      _currentIndex = 0;
    }

    try {
      final initialRef = widget.audioRefs[_currentIndex!];
      final doc = await initialRef.get();
      final data = doc.data() as Map<String, dynamic>? ?? {};

      if (_audioDataCache.length <= _currentIndex!) {
        _audioDataCache.length = widget.audioRefs.length;
      }
      _audioDataCache[_currentIndex!] = data;
      _currentId ??= data['id'] as int?;
    } catch (e) {
      debugPrint('Failed to load initial audio metadata: $e');
      return;
    }

    _setupAudioSession();
    _setupListeners();

    await _loadData(initial: true);
    // _prefetchRemainingMetadataInBackground();
  }
  Future<void> _prefetchAllRemainingAudios() async {
    try {
      final futures = <Future<void>>[];

      for (int i = 0; i < widget.audioRefs.length; i++) {
        if (_audioDataCache[i] != null) continue;

        futures.add(widget.audioRefs[i].get().then((doc) {
          final data = doc.data() as Map<String, dynamic>? ?? {};
          _audioDataCache[i] = data;
        }));
      }

      await Future.wait(futures);
      debugPrint("All remaining audios prefetched.");
    } catch (e) {
      debugPrint("Error prefetching all metadata: $e");
    }
  }

  Future<void> _prefetchNearbyAudios() async {
    final indicesToPrefetch = [
      _currentIndex! - 2,
      _currentIndex! - 1,
      _currentIndex!,
      _currentIndex! + 1,
      _currentIndex! + 2,
    ].where((i) => i >= 0 && i < widget.audioRefs.length).toSet();

    for (final i in indicesToPrefetch) {
      if (_audioDataCache[i] == null) {
        try {
          final doc = await widget.audioRefs[i].get();
          final data = doc.data() as Map<String, dynamic>? ?? {};
          _audioDataCache[i] = data;
        } catch (e) {
          debugPrint("Prefetch error for index $i: $e");
        }
      }
    }
  }



  Future<int?> _findIndexInRefs(int targetId) async {
    final fetchFutures = widget.audioRefs.map((ref) => ref.get()).toList();
    final snapshots = await Future.wait(fetchFutures);

    for (int i = 0; i < snapshots.length; i++) {
      final data = snapshots[i].data() as Map<String, dynamic>? ?? {};
      _audioDataCache[i] = data; // ✅ Use assignment, not add()
      if (data['id'] == targetId) return i;
    }

    return null;
  }

  void _setupAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration.music());
    session.becomingNoisyEventStream.listen((_) => _player.pause());
    session.interruptionEventStream.listen((event) {
      if (event.begin) {
        _player.pause();
      } else if (event.type == AudioInterruptionType.pause) {
        _player.play();
      }
    });
  }

  void _setupListeners() {
    _player.positionStream.listen((pos) {
      if (!mounted) return;
      setState(() => _position = pos);
    });
    _player.durationStream.listen((dur) {
      if (!mounted) return;
      setState(() => _duration = dur ?? Duration.zero);
    });
    _player.playerStateStream.listen((state) async {
      if (!mounted) return;
      if (mounted) {
        setState(() {
          _isPlaying = state.playing;
          _loading = state.processingState == ProcessingState.loading ||
              state.processingState == ProcessingState.buffering;
        });
      }
      if (state.processingState == ProcessingState.completed &&
          !_isLooping &&
          !_isAutoSwitching) {
        _isAutoSwitching = true;
        await _playNextById();
        _isAutoSwitching = false;
      }
    });
  }

  Future<void> _loadData({bool initial = false}) async {
    if (_currentIndex == null ||
        _currentIndex! < 0 ||
        _currentIndex! >= widget.audioRefs.length) {
      if (mounted) {
        setState(() {
          _loading = false;
          title = 'Invalid audio reference';
        });
      }
      return;
    }

    final cachedData = _audioDataCache[_currentIndex!];
    final Map<String, dynamic> data = cachedData ??
        await widget.audioRefs[_currentIndex!]
            .get()
            .then((doc) => doc.data() as Map<String, dynamic>? ?? {});

    _audioDataCache[_currentIndex!] = data;

    if (mounted) {
      setState(() {
        _loading = true;
        title = data['audio_title'] ?? 'Untitled';
        audioUrl = data['audio'] ?? '';
        imageUrl = data['image'] ?? '';
      });
    }

    try {
      final collectionName = widget.audioRefs[_currentIndex!].parent.id;

      final positionToSeek = (initial && widget.initialPosition != null)
          ? Duration(seconds: widget.initialPosition!)
          : Duration.zero;

      await _audioHandler.playMedia(
        audioUrl,
        title,
        imageUrl: imageUrl,
        isLooping: _isLooping,
        collectionName: collectionName,
        initialSeekPosition: positionToSeek,
        index: _currentIndex!,
      );

      /// 👇 Prefetch 2 before and 2 after
      await _prefetchNearbyAudios();

      /// 👇 Full prefetch after initial load (optional, can be removed)
      if (initial) {
        Future.delayed(const Duration(milliseconds: 500), () {
          _prefetchAllRemainingAudios();
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          title = 'Error: ${e.toString()}';
        });
      }
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }


  // Future<void> _loadData({bool initial = false}) async {
  //   if (_currentIndex == null ||
  //       _currentIndex! < 0 ||
  //       _currentIndex! >= widget.audioRefs.length) {
  //     if (mounted) {
  //       setState(() {
  //         _loading = false;
  //         title = 'Invalid audio reference';
  //       });
  //     }
  //     return;
  //   }
  //
  //   final cachedData = _audioDataCache[_currentIndex!];
  //   final Map<String, dynamic> data = cachedData ??
  //       await widget.audioRefs[_currentIndex!]
  //           .get()
  //           .then((doc) => doc.data() as Map<String, dynamic>? ?? {});
  //
  //   _audioDataCache[_currentIndex!] = data;
  //
  //   if (mounted) {
  //     setState(() {
  //       _loading = true;
  //       title = data['audio_title'] ?? 'Untitled';
  //       audioUrl = data['audio'] ?? '';
  //       imageUrl = data['image'] ?? '';
  //     });
  //   }
  //
  //   try {
  //     final collectionName = widget.audioRefs[_currentIndex!].parent.id;
  //
  //     final positionToSeek = (initial && widget.initialPosition != null)
  //         ? Duration(seconds: widget.initialPosition!)
  //         : Duration.zero;
  //
  //     await _audioHandler.playMedia(
  //       audioUrl,
  //       title,
  //       imageUrl: imageUrl,
  //       isLooping: _isLooping,
  //       collectionName: collectionName,
  //       initialSeekPosition: positionToSeek,
  //       index: _currentIndex!,
  //     );
  //     // 👇 FULL METADATA PREFETCH AFTER INITIAL PLAYBACK BEGINS
  //     if (initial) {
  //       Future.delayed(const Duration(milliseconds: 500), () {
  //         _prefetchAllRemainingAudios(); // <- your renamed method
  //       });
  //     }
  //   } catch (e) {
  //     if (mounted) {
  //       setState(() {
  //         title = 'Error: ${e.toString()}';
  //       });
  //     }
  //   } finally {
  //     if (mounted) {
  //       setState(() => _loading = false);
  //     }
  //   }
  // }

  Future<void> _playNextById() async {
    if (_currentId == null) return;
    final nextId = _currentId! + 1;
    final index = _audioDataCache.indexWhere((data) => data?['id'] == nextId);
    if (index != -1) {
      if (mounted) {
        setState(() {
          _currentId = nextId;
          _currentIndex = index;
          _loading = true;
        });
      }
      await _loadData();
    } else {
      print("No audio found with id=$nextId");
    }
  }

  Future<void> _playPreviousById() async {
    if (_currentId == null) return;
    final prevId = _currentId! - 1;
    final index = _audioDataCache.indexWhere((data) => data?['id'] == prevId);
    if (index != -1) {
      if (mounted) {
        setState(() {
          _currentId = prevId;
          _currentIndex = index;
          _loading = true;
        });
      }
      await _loadData();
    } else {
      print("No audio found with id=$prevId");
    }
  }

  void _togglePlayPause() {
    _player.playing ? _audioHandler.pause() : _audioHandler.play();
  }

  void _toggleLoop() async {
    if (mounted) {
      setState(() => _isLooping = !_isLooping);
    }
    await _player.setLoopMode(_isLooping ? LoopMode.one : LoopMode.off);
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _isAutoSwitching = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (audioUrl.isEmpty) return const Center(child: Text("Audio failed to load."));

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AudioContWidget(documentRef: widget.audioRefs[_currentIndex!]),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: widget.width ?? double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFC44C24),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Audio: $_currentId',
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          _isLooping ? Icons.repeat_one : Icons.repeat,
                          color: _isLooping ? Colors.greenAccent : Colors.white,
                        ),
                        onPressed: _toggleLoop,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous, color: Colors.white),
                        onPressed: _playPreviousById,
                      ),
                      IconButton(
                        icon: Icon(
                          _isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 32,
                        ),
                        onPressed: _togglePlayPause,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next, color: Colors.white),
                        onPressed: _playNextById,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDuration(_position),
                          style: const TextStyle(color: Colors.white, fontSize: 12)),
                      Text(_formatDuration(_duration),
                          style: const TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    value: _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
                    onChanged: (value) =>
                        _player.seek(Duration(seconds: value.toInt())),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          PlayWidgetWidget(audioList: widget.audioRefs[_currentIndex!]),
        ],
      ),
    );
  }
}




// working one perfect

// class AudioPlayerWidget extends StatefulWidget {
//   final List<DocumentReference> audioRefs;
//   final int? initialId;
//   final int? initialPosition;
//   final double? width;
//   final double? height;
//
//   const AudioPlayerWidget({
//     Key? key,
//     required this.audioRefs,
//     this.initialId,
//     this.initialPosition,
//     this.width,
//     this.height,
//   }) : super(key: key);
//
//   @override
//   State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
// }
//
// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   final AudioPlayer _player = GlobalAudioManager.sharedPlayer;
//   final _audioHandler = GlobalAudioManager.audioHandler;
//
//   int? _currentId;
//   int? _currentIndex;
//
//   String title = '';
//   String audioUrl = '';
//   String? imageUrl;
//   bool _isLooping = false;
//   bool _isPlaying = false;
//   bool _loading = true;
//   bool _isAutoSwitching = false;
//
//   Duration _duration = Duration.zero;
//   Duration _position = Duration.zero;
//
//   String? _lastAudioUrl;
//
//   // NEW: cache of audio metadata
//   List<Map<String, dynamic>> _audioDataCache = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeAudio();
//   }
//
//   Future<void> _initializeAudio() async {
//     // Step 1: prefetch all metadata
//     await _prefetchAllMetadata();
//
//     // Step 2: find initial index by id
//     if (widget.initialId != null) {
//       _currentId = widget.initialId;
//       _currentIndex = await _findIndexById(_currentId!);
//     }
//
//     if (_currentIndex == null) {
//       // fallback: use first audio
//       _currentIndex = 0;
//       _currentId = _audioDataCache.isNotEmpty ? _audioDataCache[0]['id'] as int? : null;
//     }
//
//     _setupAudioSession();
//     _setupListeners();
//
//     await _loadData(initial: true);
//   }
//
//   Future<void> _prefetchAllMetadata() async {
//     _audioDataCache.clear();
//     for (final ref in widget.audioRefs) {
//       final doc = await ref.get();
//       _audioDataCache.add(doc.data() as Map<String, dynamic>? ?? {});
//     }
//   }
//
//   Future<int?> _findIndexById(int targetId) async {
//     for (int i = 0; i < _audioDataCache.length; i++) {
//       if (_audioDataCache[i]['id'] == targetId) {
//         return i;
//       }
//     }
//     return null;
//   }
//
//   void _setupAudioSession() async {
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration.music());
//     session.becomingNoisyEventStream.listen((_) => _player.pause());
//     session.interruptionEventStream.listen((event) {
//       if (event.begin) {
//         _player.pause();
//       } else if (event.type == AudioInterruptionType.pause) {
//         _player.play();
//       }
//     });
//   }
//
//   void _setupListeners() {
//     _player.positionStream.listen((pos) {
//       if (!mounted) return;
//       setState(() => _position = pos);
//     });
//     _player.durationStream.listen((dur) {
//       if (!mounted) return;
//       setState(() => _duration = dur ?? Duration.zero);
//     });
//     _player.playerStateStream.listen((state) async {
//       if (!mounted) return;
//       setState(() {
//         _isPlaying = state.playing;
//         _loading = state.processingState == ProcessingState.loading ||
//             state.processingState == ProcessingState.buffering;
//       });
//       if (state.processingState == ProcessingState.completed &&
//           !_isLooping &&
//           !_isAutoSwitching) {
//         _isAutoSwitching = true;
//         await _playNextById();
//         _isAutoSwitching = false;
//       }
//     });
//   }
//
//   Future<void> _loadData({bool initial = false}) async {
//     if (_currentIndex == null ||
//         _currentIndex! < 0 ||
//         _currentIndex! >= _audioDataCache.length) {
//       setState(() {
//         _loading = false;
//         title = 'Invalid audio reference';
//       });
//       return;
//     }
//
//     setState(() {
//       _loading = true;
//       // update UI immediately from cache
//       final data = _audioDataCache[_currentIndex!];
//       title = data['audio_title'] ?? 'Untitled';
//       audioUrl = data['audio'] ?? '';
//       imageUrl = data['image'] ?? '';
//     });
//
//     try {
//       final collectionName = widget.audioRefs[_currentIndex!].parent.id;
//
//       final positionToSeek = (initial && widget.initialPosition != null)
//           ? Duration(seconds: widget.initialPosition!)
//           : Duration.zero;
//
//       // start audio loading in background
//       await _audioHandler.playMedia(
//         audioUrl,
//         title,
//         imageUrl: imageUrl,
//         isLooping: _isLooping,
//         collectionName: collectionName,
//         initialSeekPosition: positionToSeek,
//         index: _currentIndex!,
//       );
//     } catch (e) {
//       setState(() {
//         title = 'Error: ${e.toString()}';
//       });
//     } finally {
//       if (mounted) {
//         setState(() => _loading = false);
//       }
//     }
//   }
//
//
//   Future<void> _playNextById() async {
//     if (_currentId == null) return;
//     final nextId = _currentId! + 1;
//     final index = await _findIndexById(nextId);
//     if (index != null) {
//       setState(() {
//         _currentId = nextId;
//         _currentIndex = index;
//         _loading = true; // show loading immediately
//       });
//       await _loadData();
//     } else {
//       print("No audio found with id=$nextId");
//     }
//   }
//
//   Future<void> _playPreviousById() async {
//     if (_currentId == null) return;
//     final prevId = _currentId! - 1;
//     final index = await _findIndexById(prevId);
//     if (index != null) {
//       setState(() {
//         _currentId = prevId;
//         _currentIndex = index;
//         _loading = true; // show loading immediately
//       });
//       await _loadData();
//     } else {
//       print("No audio found with id=$prevId");
//     }
//   }
//
//   void _togglePlayPause() {
//     _player.playing ? _audioHandler.pause() : _audioHandler.play();
//   }
//
//   void _toggleLoop() async {
//     setState(() => _isLooping = !_isLooping);
//     await _player.setLoopMode(_isLooping ? LoopMode.one : LoopMode.off);
//   }
//
//   String _formatDuration(Duration d) {
//     final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
//     final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
//     return '$minutes:$seconds';
//   }
//
//   @override
//   void dispose() {
//     _isAutoSwitching = false;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_loading) return const Center(child: CircularProgressIndicator());
//     if (audioUrl.isEmpty) return const Center(child: Text("Audio failed to load."));
//
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AudioContWidget(documentRef: widget.audioRefs[_currentIndex!]),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Container(
//               width: widget.width ?? double.infinity,
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFC44C24),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Audio: $_currentId',
//                     style: const TextStyle(fontSize: 14, color: Colors.white70),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           _isLooping ? Icons.repeat_one : Icons.repeat,
//                           color: _isLooping ? Colors.greenAccent : Colors.white,
//                         ),
//                         onPressed: _toggleLoop,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.skip_previous, color: Colors.white),
//                         onPressed: _playPreviousById,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           _isPlaying ? Icons.pause : Icons.play_arrow,
//                           color: Colors.white,
//                           size: 32,
//                         ),
//                         onPressed: _togglePlayPause,
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.skip_next, color: Colors.white),
//                         onPressed: _playNextById,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(_formatDuration(_position),
//                           style: const TextStyle(color: Colors.white, fontSize: 12)),
//                       Text(_formatDuration(_duration),
//                           style: const TextStyle(color: Colors.white, fontSize: 12)),
//                     ],
//                   ),
//                   Slider(
//                     activeColor: Colors.white,
//                     inactiveColor: Colors.white54,
//                     min: 0,
//                     max: _duration.inSeconds.toDouble(),
//                     value: _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
//                     onChanged: (value) =>
//                         _player.seek(Duration(seconds: value.toInt())),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 8),
//           PlayWidgetWidget(audioList: widget.audioRefs[_currentIndex!]),
//         ],
//       ),
//     );
//   }
// }
