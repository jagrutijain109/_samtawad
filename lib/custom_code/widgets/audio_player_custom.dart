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

import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';
import 'package:samtawad_team/custom_code/global_audio_manager.dart';

class AudioPlayerCustom extends StatefulWidget {
  final DocumentReference audioRef;
  final double? width;
  final double? height;

  const AudioPlayerCustom({
    Key? key,
    required this.audioRef,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<AudioPlayerCustom> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerCustom> {
  final AudioPlayer _player = GlobalAudioManager.sharedPlayer;

  String title = '';
  String audioUrl = '';
  String? imageUrl;

  bool _isPlaying = false;
  bool _loading = true;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    print('audioRef: ${widget.audioRef}');
    _setupAudioSession();
    _setupListeners();
    _loadData();
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

    _player.playerStateStream.listen((state) {
      if (!mounted) return;
      setState(() {
        _isPlaying = state.playing;
        _loading = state.processingState == ProcessingState.loading ||
            state.processingState == ProcessingState.buffering;
      });
    });
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);

    try {
      final doc = await widget.audioRef.get();
      if (!doc.exists) throw Exception('Document not found');

      final data = doc.data() as Map<String, dynamic>?;
      if (data == null) throw Exception('Invalid data');

      title = data['book_name'] ?? 'Untitled';
      audioUrl = data['book_audio'] ?? '';
      imageUrl = data['book_image'] ?? '';

      if (audioUrl.isEmpty) throw Exception('Audio URL missing');

      await GlobalAudioManager.audioHandler.playMedia(
        audioUrl,
        title,
        imageUrl: imageUrl,
        // collectionName: widget.audioRef.parent.id,
        // audioRef: widget.audioRef,
      );
    } catch (e) {
      setState(() => title = 'Error: ${e.toString()}');
    } finally {
      setState(() => _loading = false);
    }
  }

  void _togglePlayPause() {
    _isPlaying
        ? GlobalAudioManager.audioHandler.pause()
        : GlobalAudioManager.audioHandler.play();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return const Center(child: CircularProgressIndicator());

    if (audioUrl.isEmpty) {
      return const Center(child: Text("Audio failed to load."));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: widget.width ?? double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFC44C24),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 8),
            IconButton(
              icon: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 32,
              ),
              onPressed: _togglePlayPause,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_position),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
                Text(
                  _formatDuration(_duration),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.white54,
              min: 0,
              max: _duration.inSeconds.toDouble(),
              value:
                  _position.inSeconds.clamp(0, _duration.inSeconds).toDouble(),
              onChanged: (value) =>
                  _player.seek(Duration(seconds: value.toInt())),
            ),
          ],
        ),
      ),
    );
  }
}
