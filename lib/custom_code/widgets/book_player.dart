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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'package:just_audio/just_audio.dart';
import 'package:samtawad_team/custom_code/global_audio_manager.dart';

class BookPlayer extends StatefulWidget {
  final String audioUrl;
  final double? width;
  final double? height;

  const BookPlayer({
    Key? key,
    required this.audioUrl,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<BookPlayer> createState() => _BookPlayerState();
}

class _BookPlayerState extends State<BookPlayer> {
  final AudioPlayer _player = GlobalAudioManager.sharedPlayer;

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  bool _isLoading = true;
  String? _lastPlayedUrl;

  @override
  void initState() {
    super.initState();
    _setupListeners();
  }

  void _setupListeners() {
    _player.positionStream.listen((pos) {
      if (mounted) setState(() => _position = pos);
    });

    _player.durationStream.listen((dur) {
      if (mounted) setState(() => _duration = dur ?? Duration.zero);
    });

    _player.playerStateStream.listen((state) {
      if (mounted) setState(() => _isPlaying = state.playing);
    });
  }

  Future<void> _playNewAudio() async {
    try {
      await _player.stop();
      await _player.setUrl(widget.audioUrl);
      await _player.play();

      setState(() {
        _lastPlayedUrl = widget.audioUrl;
        _isLoading = false;
      });
    } catch (e) {
      print("Audio error: $e");
    }
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      if (_lastPlayedUrl != widget.audioUrl) {
        await _playNewAudio();
      } else {
        await _player.play();
      }
    }
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _lastPlayedUrl != widget.audioUrl) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFC44C24),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(_position),
                style: const TextStyle(color: Colors.white),
              ),
              Expanded(
                child: Slider(
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
              ),
              Text(
                _formatDuration(_duration),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 4),
          IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
              size: 40,
              color: Colors.white,
            ),
            onPressed: _togglePlayPause,
          ),
        ],
      ),
    );
  }
}
