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

class CustomAudioPlayer extends StatefulWidget {
  final String url;
  final int index;
  final double width;
  final double height;

  const CustomAudioPlayer({
    Key? key,
    required this.url,
    required this.index,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _CustomAudioPlayerState createState() => _CustomAudioPlayerState();
}

class _CustomAudioPlayerState extends State<CustomAudioPlayer> {
  final AudioPlayer _player = AudioPlayer();
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isPlaying = false;
  bool _isLooping = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _player.setUrl(widget.url);

      _player.durationStream.listen((d) {
        if (d != null && d != Duration.zero) {
          setState(() => _duration = d);
        }
      });

      _player.positionStream.listen((pos) {
        setState(() => _position = pos);
      });

      _player.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          if (_isLooping) {
            _player.seek(Duration.zero);
            _player.play();
          } else {
            FFAppState().currentIndexPlayerVani = widget.index + 1;
            _player.seek(Duration.zero);
            setState(() => _isPlaying = false);
          }
        }
      });

      _player.play();
      setState(() => _isPlaying = true);
    } catch (e) {
      print('Audio load error: $e');
    }
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    setState(() => _isPlaying = !_isPlaying);
  }

  void _seekTo(double value) {
    final position = Duration(milliseconds: value.toInt());
    _player.seek(position);
  }

  void _toggleLooping() {
    setState(() => _isLooping = !_isLooping);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          Slider(
            value: _position.inMilliseconds
                .clamp(0, _duration.inMilliseconds)
                .toDouble(),
            max: _duration.inMilliseconds > 0
                ? _duration.inMilliseconds.toDouble()
                : 1.0,
            onChanged: (val) => _seekTo(val),
          ),
          Text(
            '${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')} / '
            '${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: _togglePlayPause,
              ),
              IconButton(
                icon: Icon(
                  Icons.loop,
                  color: _isLooping ? Colors.blue : Colors.grey,
                ),
                onPressed: _toggleLooping,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
