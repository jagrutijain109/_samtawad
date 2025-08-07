import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/index.dart';
import 'add_audio_book_widget.dart' show AddAudioBookWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddAudioBookModel extends FlutterFlowModel<AddAudioBookWidget> {
  ///  Local state fields for this page.

  List<int> chapternumberList = [];
  void addToChapternumberList(int item) => chapternumberList.add(item);
  void removeFromChapternumberList(int item) => chapternumberList.remove(item);
  void removeAtIndexFromChapternumberList(int index) =>
      chapternumberList.removeAt(index);
  void insertAtIndexInChapternumberList(int index, int item) =>
      chapternumberList.insert(index, item);
  void updateChapternumberListAtIndex(int index, Function(int) updateFn) =>
      chapternumberList[index] = updateFn(chapternumberList[index]);

  List<String> chapternameList = [];
  void addToChapternameList(String item) => chapternameList.add(item);
  void removeFromChapternameList(String item) => chapternameList.remove(item);
  void removeAtIndexFromChapternameList(int index) =>
      chapternameList.removeAt(index);
  void insertAtIndexInChapternameList(int index, String item) =>
      chapternameList.insert(index, item);
  void updateChapternameListAtIndex(int index, Function(String) updateFn) =>
      chapternameList[index] = updateFn(chapternameList[index]);

  List<String> chapterAudioList = [];
  void addToChapterAudioList(String item) => chapterAudioList.add(item);
  void removeFromChapterAudioList(String item) => chapterAudioList.remove(item);
  void removeAtIndexFromChapterAudioList(int index) =>
      chapterAudioList.removeAt(index);
  void insertAtIndexInChapterAudioList(int index, String item) =>
      chapterAudioList.insert(index, item);
  void updateChapterAudioListAtIndex(int index, Function(String) updateFn) =>
      chapterAudioList[index] = updateFn(chapterAudioList[index]);

  AudioBookRecord? audiobook;

  int? id;

  String? uploadedImageURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadBookImage = false;
  FFUploadedFile uploadedLocalFile_uploadBookImage =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadBookImage = '';

  bool isDataUploading_uploadAudioBookLyrics = false;
  List<FFUploadedFile> uploadedLocalFiles_uploadAudioBookLyrics = [];
  List<String> uploadedFileUrls_uploadAudioBookLyrics = [];

  // State field(s) for book_name widget.
  FocusNode? bookNameFocusNode;
  TextEditingController? bookNameTextController;
  String? Function(BuildContext, String?)? bookNameTextControllerValidator;
  bool isDataUploading_uploadDataLpg = false;
  FFUploadedFile uploadedLocalFile_uploadDataLpg =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataLpg = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? audiobookcount;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AudioBookRecord? audioref;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    bookNameFocusNode?.dispose();
    bookNameTextController?.dispose();
  }
}
