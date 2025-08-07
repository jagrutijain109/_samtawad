// Automatic FlutterFlow imports
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

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:audio_service/audio_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samtawad_team/custom_code/global_audio_manager.dart';
import 'package:samtawad_team/custom_code/audio_player_handler.dart';
import 'package:samtawad_team/pages/component/audio_cont_book/audio_cont_book_widget.dart';

class AudioBookPlayerWidget extends StatefulWidget {
  final List<DocumentReference> audioRefs;
  final int? initialId; // 🎯 Use id from Firestore document
  final int? initialPosition;
  final double? width;
  final double? height;

  const AudioBookPlayerWidget({
    Key? key,
    required this.audioRefs,
    this.initialId,
    this.initialPosition,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<AudioBookPlayerWidget> createState() => _AudioBookPlayerWidgetState();
}

class _AudioBookPlayerWidgetState extends State<AudioBookPlayerWidget> {
  final AudioPlayer _player = GlobalAudioManager.sharedPlayer;
  final _audioHandler = GlobalAudioManager.audioHandler;

  // int _currentIndex = 0;
  int? _currentId;
  int? _currentIndex;

  String title = '';
  String audioUrl = '';
  bool _isLooping = false;
  bool _isPlaying = false;
  bool _loading = true;
  bool _isAutoSwitching = false;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String? _lastAudioUrl;
  List<Map<String, dynamic>> _audioDataCache = [];

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  // Future<void> _initializeAudio() async {
  //   if (widget.initialId != null) {
  //     final index = await _findIndexById(widget.initialId!);
  //     if (index != null) {
  //       _currentIndex = index;
  //     } else {
  //       _currentIndex = 0;
  //     }
  //   } else {
  //     _currentIndex = 0;
  //   }
  //   _setupAudioSession();
  //   _setupListeners();
  //   await _loadData(initial: true);
  // }
  Future<void> _initializeAudio() async {
    // Step 1: prefetch all metadata
    await _prefetchAllMetadata();

    // Step 2: find initial index by id
    if (widget.initialId != null) {
      _currentId = widget.initialId;
      _currentIndex = await _findIndexById(_currentId!);
    }

    if (_currentIndex == null) {
      // fallback: use first audio
      _currentIndex = 0;
      _currentId = _audioDataCache.isNotEmpty ? _audioDataCache[0]['id'] as int? : null;
    }

    _setupAudioSession();
    _setupListeners();

    await _loadData(initial: true);
  }

  Future<void> _prefetchAllMetadata() async {
    _audioDataCache.clear();
    for (final ref in widget.audioRefs) {
      final doc = await ref.get();
      _audioDataCache.add(doc.data() as Map<String, dynamic>? ?? {});
    }
  }

  Future<int?> _findIndexById(int targetId) async {
    for (int i = 0; i < _audioDataCache.length; i++) {
      if (_audioDataCache[i]['id'] == targetId) {
        return i;
      }
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
      setState(() {
        _isPlaying = state.playing;
        _loading = state.processingState == ProcessingState.loading ||
            state.processingState == ProcessingState.buffering;
      });

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
        _currentIndex! >= _audioDataCache.length) {
      setState(() {
        _loading = false;
        title = 'Invalid audio reference';
      });
      return;
    }

    setState(() {
      _loading = true;
      // update UI immediately from cache
      final data = _audioDataCache[_currentIndex!];
      title = data['chapter_name'] ?? 'Untitled';
      audioUrl = data['chapter_audio'] ?? '';

    });

    try {
      final collectionName = widget.audioRefs[_currentIndex!].parent.id;

      final positionToSeek = (initial && widget.initialPosition != null)
          ? Duration(seconds: widget.initialPosition!)
          : Duration.zero;

      // start audio loading in background
      await _audioHandler.playMedia(
        audioUrl,
        title,
        imageUrl: null,
        isLooping: _isLooping,
        collectionName: collectionName,
        initialSeekPosition: positionToSeek,
        index: _currentIndex!,
      );
    } catch (e) {
      setState(() {
        title = 'Error: ${e.toString()}';
      });
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  Future<void> _playNextById() async {
    if (_currentId == null) return;
    final nextId = _currentId! + 1;
    final index = await _findIndexById(nextId);
    if (index != null) {
      setState(() {
        _currentId = nextId;
        _currentIndex = index;
        _loading = true; // show loading immediately
      });
      await _loadData();
    } else {
      print("No audio found with id=$nextId");
    }
  }

  Future<void> _playPreviousById() async {
    if (_currentId == null) return;
    final prevId = _currentId! - 1;
    final index = await _findIndexById(prevId);
    if (index != null) {
      setState(() {
        _currentId = prevId;
        _currentIndex = index;
        _loading = true; // show loading immediately
      });
      await _loadData();
    } else {
      print("No audio found with id=$prevId");
    }
  }

  void _togglePlayPause() {
    _player.playing ? _audioHandler.pause() : _audioHandler.play();
  }

  void _toggleLoop() async {
    setState(() => _isLooping = !_isLooping);
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

    if (audioUrl.isEmpty) {
      return const Center(child: Text("Audio failed to load."));
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AudioContBookWidget(documentRef: widget.audioRefs[_currentIndex!]),
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
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Audio ${widget.initialId} of ${widget.audioRefs.length}',
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
                        icon: const Icon(Icons.skip_previous,
                            color: Colors.white),
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
                      Text(
                        _formatDuration(_position),
                        style:
                        const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        _formatDuration(_duration),
                        style:
                        const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                    min: 0,
                    max: _duration.inSeconds.toDouble(),
                    value: _position.inSeconds
                        .clamp(0, _duration.inSeconds)
                        .toDouble(),
                    onChanged: (value) =>
                        _player.seek(Duration(seconds: value.toInt())),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// // Automatic FlutterFlow imports
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import 'index.dart'; // Imports other custom widgets
// import '/custom_code/actions/index.dart'; // Imports custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!
//
// import '/custom_code/widgets/index.dart';
// import '/custom_code/actions/index.dart';
// import '/flutter_flow/custom_functions.dart';
//
// import 'package:just_audio/just_audio.dart';
// import 'package:audio_session/audio_session.dart';
// import 'package:audio_service/audio_service.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:samtawad_team/custom_code/global_audio_manager.dart';
// import 'package:samtawad_team/custom_code/audio_player_handler.dart';
// import 'package:samtawad_team/pages/component/audio_cont_book/audio_cont_book_widget.dart';
//
// class AudioBookPlayerWidget extends StatefulWidget {
//   final List<DocumentReference> audioRefs;
//   final int? initialId; // 🎯 Use id from Firestore document
//   final int? initialPosition;
//   final double? width;
//   final double? height;
//
//   const AudioBookPlayerWidget({
//     Key? key,
//     required this.audioRefs,
//     this.initialId,
//     this.initialPosition,
//     this.width,
//     this.height,
//   }) : super(key: key);
//
//   @override
//   State<AudioBookPlayerWidget> createState() => _AudioBookPlayerWidgetState();
// }
//
// class _AudioBookPlayerWidgetState extends State<AudioBookPlayerWidget> {
//   final AudioPlayer _player = GlobalAudioManager.sharedPlayer;
//   final _audioHandler = GlobalAudioManager.audioHandler;
//
//   int _currentIndex = 0;
//   String title = '';
//   String audioUrl = '';
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
//   @override
//   void initState() {
//     super.initState();
//     _initializeAudio();
//   }
//
//   Future<void> _initializeAudio() async {
//     if (widget.initialId != null) {
//       final index = await _findIndexById(widget.initialId!);
//       if (index != null) {
//         _currentIndex = index;
//       } else {
//         _currentIndex = 0;
//       }
//     } else {
//       _currentIndex = 0;
//     }
//     _setupAudioSession();
//     _setupListeners();
//     await _loadData(initial: true);
//   }
//
//   Future<int?> _findIndexById(int targetId) async {
//     for (int i = 0; i < widget.audioRefs.length; i++) {
//       final doc = await widget.audioRefs[i].get();
//       if (!doc.exists) continue;
//
//       final data = doc.data() as Map<String, dynamic>?;
//       if (data == null) continue;
//
//       if (data['id'] == targetId) {
//         return i;
//       }
//     }
//     return null;
//   }
//
//   void _setupAudioSession() async {
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration.music());
//
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
//
//     _player.durationStream.listen((dur) {
//       if (!mounted) return;
//       setState(() => _duration = dur ?? Duration.zero);
//     });
//
//     _player.playerStateStream.listen((state) async {
//       if (!mounted) return;
//       setState(() {
//         _isPlaying = state.playing;
//         _loading = state.processingState == ProcessingState.loading ||
//             state.processingState == ProcessingState.buffering;
//       });
//
//       if (state.processingState == ProcessingState.completed &&
//           !_isLooping &&
//           !_isAutoSwitching) {
//         _isAutoSwitching = true;
//         await _nextAudio();
//         _isAutoSwitching = false;
//       }
//     });
//   }
//
//   Future<void> _loadData({bool initial = false}) async {
//     if (widget.audioRefs.isEmpty ||
//         _currentIndex < 0 ||
//         _currentIndex >= widget.audioRefs.length) {
//       setState(() {
//         _loading = false;
//         title = 'Invalid audio reference';
//       });
//       return;
//     }
//
//     setState(() {
//       _loading = true;
//     });
//
//     try {
//       final doc = await widget.audioRefs[_currentIndex].get();
//       if (!doc.exists) throw Exception('Document not found');
//
//       final data = doc.data() as Map<String, dynamic>?;
//       if (data == null) throw Exception('Invalid data');
//
//       title = data['chapter_name'] ?? 'Untitled';
//       audioUrl = data['chapter_audio'] ?? '';
//       final collectionName = widget.audioRefs[_currentIndex].parent.id;
//
//       if (audioUrl.isEmpty) throw Exception('Audio URL missing');
//
//       final isSameAudio = audioUrl == _lastAudioUrl;
//       _lastAudioUrl = audioUrl;
//
//       final positionToSeek =
//           (initial && widget.initialPosition != null && !isSameAudio)
//               ? Duration(seconds: widget.initialPosition!)
//               : Duration.zero;
//
//       await _audioHandler.playMedia(
//         audioUrl,
//         title,
//         imageUrl: null,
//         isLooping: _isLooping,
//         collectionName: collectionName,
//         initialSeekPosition: positionToSeek,
//         index: _currentIndex,
//       );
//     } catch (e) {
//       setState(() {
//         title = 'Error: ${e.toString()}';
//       });
//     } finally {
//       setState(() => _loading = false);
//     }
//   }
//
//   Future<void> _nextAudio() async {
//     setState(() {
//       _currentIndex = (_currentIndex + 1) % widget.audioRefs.length;
//     });
//     await _loadData();
//   }
//
//   Future<void> _previousAudio() async {
//     setState(() {
//       _currentIndex = (_currentIndex - 1 + widget.audioRefs.length) %
//           widget.audioRefs.length;
//     });
//     await _loadData();
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
//
//     if (audioUrl.isEmpty) {
//       return const Center(child: Text("Audio failed to load."));
//     }
//
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AudioContBookWidget(documentRef: widget.audioRefs[_currentIndex]),
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
//                     title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     'Audio ${widget.initialId} of ${widget.audioRefs.length}',
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
//                         icon: const Icon(Icons.skip_previous,
//                             color: Colors.white),
//                         onPressed: _previousAudio,
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
//                         onPressed: _nextAudio,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         _formatDuration(_position),
//                         style:
//                             const TextStyle(color: Colors.white, fontSize: 12),
//                       ),
//                       Text(
//                         _formatDuration(_duration),
//                         style:
//                             const TextStyle(color: Colors.white, fontSize: 12),
//                       ),
//                     ],
//                   ),
//                   Slider(
//                     activeColor: Colors.white,
//                     inactiveColor: Colors.white54,
//                     min: 0,
//                     max: _duration.inSeconds.toDouble(),
//                     value: _position.inSeconds
//                         .clamp(0, _duration.inSeconds)
//                         .toDouble(),
//                     onChanged: (value) =>
//                         _player.seek(Duration(seconds: value.toInt())),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
