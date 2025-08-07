// Automatic FlutterFlow imports
import '../../pages/player_copy2/player_copy2_widget.dart';
import '../../pages/player_copy2_copy/player_copy2_copy_widget.dart';
import '../../pages/player_copy2_copy_copy/player_copy2_copy_copy_widget.dart';
import '../../pages/player_copy3/player_copy3_widget.dart';
import '/backend/backend.dart';import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';
import 'package:samtawad_team/custom_code/global_audio_manager.dart';

class NowPlayingBar extends StatefulWidget {
  final double? width;
  final double? height;

  const NowPlayingBar({Key? key, this.width, this.height}) : super(key: key);

  @override
  _NowPlayingBarState createState() => _NowPlayingBarState();
}

class _NowPlayingBarState extends State<NowPlayingBar> {
  final AudioPlayer _player = GlobalAudioManager.sharedPlayer;
  late StreamSubscription<PlayerState> _playerStateSub;
  late StreamSubscription<SequenceState?> _sequenceStateSub;

  bool _isVisible = false;
  bool _isPlaying = false;
  String _title = '';
  String? id;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();

    // Listen to playback state
    _playerStateSub = _player.playerStateStream.listen((state) {
      if (!mounted) return;
      setState(() {
        _isPlaying = state.playing;
        _isVisible =
            state.playing || state.processingState == ProcessingState.ready;
      });
    });

    // Listen to sequence state to update title and image
    _sequenceStateSub = _player.sequenceStateStream.listen((state) {
      if (!mounted) return;

      final tag = state?.currentSource?.tag;
      if (tag is MediaItem) {
        setState(() {
          _title = tag.title;
          _imageUrl = tag.artUri?.toString();
          id = tag.id.toString();
          _isVisible = true;
        });
        print('NowPlayingBar: title=${tag.title}, imageUrl=${tag.artUri},ID =${tag.id}');
      } else {
        setState(() {
          _title = '';
          _imageUrl = null;
          _isVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _playerStateSub.cancel();
    _sequenceStateSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return const SizedBox.shrink();

    return GestureDetector(
      // onTap: () => context.pushNamed('Player'),
      // onTap: () {
      //   final tag = _player.sequenceState?.currentSource?.tag;

      //   if (tag is MediaItem) {
      //     final type = tag.extras?['type'] as String? ?? '';
      //     // final title = tag.title;
      //     final currentIndex = _player.currentIndex;
      //     // final currentIndex = _player.currentIndex;
      //     if (currentIndex != null) {
      //       // use currentIndex as a single value
      //       print(currentIndex); // not a list
      //     }

      //     context.pushNamed(
      //       'Player',
      //       queryParameters: {
      //         'type': type,
      //         'currentIndex': currentIndex.toString(),
      //       },
      //     );
      //   } else {
      //     context.pushNamed('Player');
      //     print('Missing type or index');
      //   }
      // },
      //

      // onTap: () {
      //   final tag = _player.sequenceState?.currentSource?.tag;

      //   if (tag is MediaItem) {
      //     final type = tag.extras?['type'] as String? ?? '';
      //     final collectionName = tag.extras?['collectionName'] as String? ?? '';
      //     final audioRefPath = tag.extras?['audioRefPath'] as String?;

      //     // final documentRef = tag.extras?['documentRef'];
      //     final currentPosition = _player.position.inSeconds;
      //     final index = tag.extras?['index'] as int?;

      //     print('ð§ NowPlayingBar Tapped');
      //     print('ð MediaItem.title: ${tag.title}');
      //     print('ð¼ï¸ MediaItem.image: ${tag.artUri}');
      //     print('ð¦ Extras: ${tag.extras}');
      //     print('ð Type: $type');
      //     print('ð Collection: $collectionName');
      //     print('ð¢ Index: $index');
      //     print('â±ï¸ Position: $currentPosition');
      //     print('â±ï¸ Document Ref: $audioRefPath');

      //     if (type == 'audio_book' && audioRefPath != null) {
      //       context.pushNamed(
      //         'Book2',
      //         queryParameters: {
      //           'audioDocumnetRef': audioRefPath,
      //         },
      //       );
      //       return;
      //     } else if (type.isNotEmpty && index != null) {
      //       context.pushNamed(
      //         'Player',
      //         queryParameters: {
      //           'type': type,
      //           'currentIndex': index.toString(),
      //           'pos': currentPosition.toString(),
      //         },
      //       );
      //     } else {
      //       print('Navigation blocked: type is empty or index is null');
      //     }
      //   } else {
      //     print('Navigation blocked: no MediaItem tag found');
      //   }
      // },
      onTap: () {
        final tag = _player.sequenceState?.currentSource?.tag;

        if (tag is MediaItem) {
          final type = tag.extras?['type'] as String? ?? '';

          int? index = tag.extras?['index'] as int?;
          final currentPosition = _player.position.inSeconds;
          final audioRefPath = tag.extras?['audioRefPath'];

          index ??= _player.currentIndex;

          print('🎧 Tapped NowPlayingBar');
          print('📛 Title: ${tag.title}');
          print('📦 Extras: ${tag.extras}');
          print('🆔 RefPath: $audioRefPath');
          print('🔢 Index: $index');
          print('⏱️ Position: $currentPosition');

          if (type.isNotEmpty && index != null) {
            final params = {
              'type': type,
              'currentIndex': index.toString(),
              'pos': currentPosition.toString(),
              'audioDocumnetRef': audioRefPath,
            };

            switch (type) {
              case 'audio':
                context.pushNamed(
                  PlayerCopy3Widget.routeName,
                  queryParameters: {
                    'id':index.toString(),
                    // serializeParam(
                    //   listViewAudioRecord.id,
                    //   ParamType.int,
                    // ),
                    'currentIndex':index.toString(),
                    // serializeParam(
                    //   listViewAudioRecord.id,
                    //   ParamType.int,
                    // ),
                    'type': serializeParam(
                      'audio',
                      ParamType.String,
                    ),
                    'pos': currentPosition.toString(),
                    'audioref':audioRefPath
                    // serializeParam(
                    //   listViewAudioRecord.reference,
                    //   ParamType.DocumentReference,
                    // ),
                  }.withoutNulls,
                );
                // _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                safeSetState(() {});
                break;
              case 'gurukalin_satsang':
                context.pushNamed(
                    PlayerCopy2CopyWidget.routeName,
                    queryParameters: {
                      'id':index.toString(),
                      // serializeParam(
                      //   listViewGurukalinSatsangRecord.id,
                      //   ParamType.int,
                      // ),
                      'type': serializeParam(
                        'gurukalin_satsang',
                        ParamType.String,
                      ),
                      'pos':currentPosition.toString()
                    }.withoutNulls,
                  );

                  // _model.gurukaliSatsang = _model.gurukaliSatsang.toList().cast<GurukalinSatsangRecord>();
                  safeSetState(() {});

                break;
              case 'satsang':
                context.pushNamed(
                  PlayerCopy2Widget.routeName,
                  queryParameters: {
                    'currentIndex': index.toString(),
                    // serializeParam(
                    //   listViewSatsangRecord.id,
                    //   ParamType.int,
                    // ),
                    'type': serializeParam(
                      'satsang',
                      ParamType.String,
                    ),
                    'pos': currentPosition.toString(),
                    'id':index.toString(),
                    // serializeParam(
                    //   listViewSatsangRecord.id,
                    //   ParamType.int,
                    // ),
                    'audioref':audioRefPath,
                    // serializeParam(
                    //   listViewSatsangRecord.reference,
                    //   ParamType.DocumentReference,
                    // ),
                  }.withoutNulls,
                );

                // _model.vaniList = _model.vaniList.toList().cast<AudioRecord>();
                safeSetState(() {});
                break;
              case 'chapters':
                context.pushNamed(PlayerCopy2CopyCopyWidget.routeName,queryParameters: {
                  'id':index.toString(),
                  'type':serializeParam('chapters', ParamType.String),
                  'pos':serializeParam(0, ParamType.int),
                }.withoutNulls);
                setState(() {

                });
                // context.pushNamed('PlayerCopy2CopyCopy', queryParameters: params);
                break;
              default:
                print('Unknown type: $type');
            }
          } else {
            print('❌ Missing type or index in MediaItem extras');
          }
        } else {
          print('❌ No MediaItem tag found');
        }
      },

      child: Container(
        width: widget.width ?? 70,
        height: widget.height ?? 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: Color(0xFFC44C24),
        ),
        padding: const EdgeInsets.all(10), // Prevent overflow
        child: Center(
          child: IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size:25,

            ),
            onPressed: () {
              _isPlaying ? _player.pause() : _player.play();
            },
          ),
        ),
      ),


      // child: Container(
      //   width: widget.width ?? double.infinity,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(35),
      //     color: Color(0xFFC44C24)
      //   ),
      //
      //   height: widget.height ?? 70,
      //   // color: const Color(0xFFC44C24),
      //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //   child: SingleChildScrollView(
      //     child: Row(
      //       children: [
      //         // if (_imageUrl != null && _imageUrl!.isNotEmpty)
      //         //   ClipRRect(
      //         //     borderRadius: BorderRadius.circular(8),
      //         //     child: Image.network(
      //         //       _imageUrl!,
      //         //       width: 50,
      //         //       height: 50,
      //         //       fit: BoxFit.cover,
      //         //       errorBuilder: (context, error, stackTrace) => const Icon(
      //         //         Icons.broken_image,
      //         //         size: 50,
      //         //         color: Colors.white70,
      //         //       ),
      //         //     ),
      //         //   ),
      //         // const SizedBox(width: 10),
      //         // Expanded(
      //         //   child: Text(
      //         //     _title.isNotEmpty ? _title : 'गाना बज रहा है',
      //         //     style: const TextStyle(
      //         //       color: Colors.white,
      //         //       fontSize: 16,
      //         //     ),
      //         //     overflow: TextOverflow.ellipsis,
      //         //   ),
      //         // ),
      //         IconButton(
      //           icon: Icon(
      //             _isPlaying ? Icons.pause : Icons.play_arrow,
      //             color: Colors.white,
      //             size: 30,
      //           ),
      //           onPressed: () {
      //             _isPlaying ? _player.pause() : _player.play();
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}