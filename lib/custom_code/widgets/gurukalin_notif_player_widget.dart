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

import 'package:samtawad_team/pages/component/play_widget_gurukalin_satsang_copy/play_widget_gurukalin_satsang_copy_widget.dart';
// import 'package:samtawad_team/pages/component/satsang_cont/satsang_cont_widget.dart';
import 'package:samtawad_team/pages/component/audio_cont_gurukalin_satsang_copy/audio_cont_gurukalin_satsang_copy_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:samtawad_team/custom_code/global_audio_manager.dart';
import 'package:samtawad_team/custom_code/audio_player_handler.dart';

class GurukalinPlayerWidget extends StatefulWidget {
  final List<DocumentReference> audioRefs;
  final int initialIndex;
  final double? width;
  final double? height;

  const GurukalinPlayerWidget({
    Key? key,
    required this.audioRefs,
    this.initialIndex = 0,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<GurukalinPlayerWidget> createState() => _GurukalinPlayerWidgetState();
}

class _GurukalinPlayerWidgetState extends State<GurukalinPlayerWidget> {
  final AudioPlayer _player = GlobalAudioManager.sharedPlayer;
  final AudioPlayerHandler _audioHandler =
      GlobalAudioManager.audioHandler as AudioPlayerHandler;

  late int _currentIndex;
  Map<String, dynamic>? currentData; // ✅ Stores fetched document data
  bool _isLooping = false;
  bool _isPlaying = false;
  bool _loading = true;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _setupAudioSession();
    _currentIndex = widget.initialIndex;
    _loadData();

    _player.positionStream.listen((pos) {
      if (mounted) setState(() => _position = pos);
    });
    _player.durationStream.listen((dur) {
      if (mounted) setState(() => _duration = dur ?? Duration.zero);
    });
    _player.playerStateStream.listen((state) {
      if (!mounted) return;
      if (state.playing != _isPlaying) {
        setState(() => _isPlaying = state.playing);
      }
      if (state.processingState == ProcessingState.completed && !_isLooping) {
        _nextAudio();
      }
    });
  }

  Future<void> _setupAudioSession() async {
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

  Future<void> _loadData() async {
    if (_currentIndex < 0 || _currentIndex >= widget.audioRefs.length) return;

    setState(() {
      _loading = true;
      currentData = null;
    });

    try {
      final stopwatch = Stopwatch()..start();
      final doc = await widget.audioRefs[_currentIndex]
          .get()
          .timeout(Duration(seconds: 5));
      stopwatch.stop();
      print('[Firestore] Loaded in ${stopwatch.elapsedMilliseconds} ms');

      if (!doc.exists) {
        print('[Error] Document does not exist');
        setState(() => _loading = false);
        return;
      }

      final data = doc.data() as Map<String, dynamic>?;
      if (data == null ||
          data['audio_url'] == null ||
          data['audio_url'].toString().isEmpty) {
        print('[Error] Invalid audio data');
        setState(() => _loading = false);
        return;
      }

      currentData = data;
      await _player.stop();
      await _player.setLoopMode(_isLooping ? LoopMode.one : LoopMode.off);
      await _player.setUrl(data['audio_url']);
      _player.play();
    } catch (e) {
      print('[Error] Failed to load audio: $e');
    }

    if (mounted) setState(() => _loading = false);
  }

  Future<void> _nextAudio() async {
    _currentIndex = (_currentIndex + 1) % widget.audioRefs.length;
    await _loadData();
  }

  Future<void> _previousAudio() async {
    _currentIndex =
        (_currentIndex - 1 + widget.audioRefs.length) % widget.audioRefs.length;
    await _loadData();
  }

  void _togglePlayPause() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
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
    _player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (currentData == null) {
      return const Center(child: Text("Failed to load audio data"));
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// ✅ Pass current data instead of ref
          AudioContGurukalinSatsangCopyWidget(
            documentRef: widget.audioRefs[_currentIndex],
          ),
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
                  // Text(
                  //   currentData?['satsang_title'] ?? 'Untitled',
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.white,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  Text(
                    'Audio ${_currentIndex + 1} of ${widget.audioRefs.length}',
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
                        onPressed: _previousAudio,
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
                        onPressed: _nextAudio,
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
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PlayWidgetGurukalinSatsangCopyWidget(
              audioList: widget.audioRefs[_currentIndex],
            ),
          ),
        ],
      ),
    );
  }
}
