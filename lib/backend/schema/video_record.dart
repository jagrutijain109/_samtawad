import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoRecord extends FirestoreRecord {
  VideoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video_title" field.
  String? _videoTitle;
  String get videoTitle => _videoTitle ?? '';
  bool hasVideoTitle() => _videoTitle != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "speaker_name" field.
  String? _speakerName;
  String get speakerName => _speakerName ?? '';
  bool hasSpeakerName() => _speakerName != null;

  // "video_time" field.
  String? _videoTime;
  String get videoTime => _videoTime ?? '';
  bool hasVideoTime() => _videoTime != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _videoTitle = snapshotData['video_title'] as String?;
    _category = snapshotData['category'] as String?;
    _speakerName = snapshotData['speaker_name'] as String?;
    _videoTime = snapshotData['video_time'] as String?;
    _information = snapshotData['information'] as String?;
    _tags = snapshotData['tags'] as String?;
    _video = snapshotData['video'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video');

  static Stream<VideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoRecord.fromSnapshot(s));

  static Future<VideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoRecord.fromSnapshot(s));

  static VideoRecord fromSnapshot(DocumentSnapshot snapshot) => VideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoRecordData({
  String? videoTitle,
  String? category,
  String? speakerName,
  String? videoTime,
  String? information,
  String? tags,
  String? video,
  DateTime? createdTime,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video_title': videoTitle,
      'category': category,
      'speaker_name': speakerName,
      'video_time': videoTime,
      'information': information,
      'tags': tags,
      'video': video,
      'created_time': createdTime,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoRecordDocumentEquality implements Equality<VideoRecord> {
  const VideoRecordDocumentEquality();

  @override
  bool equals(VideoRecord? e1, VideoRecord? e2) {
    return e1?.videoTitle == e2?.videoTitle &&
        e1?.category == e2?.category &&
        e1?.speakerName == e2?.speakerName &&
        e1?.videoTime == e2?.videoTime &&
        e1?.information == e2?.information &&
        e1?.tags == e2?.tags &&
        e1?.video == e2?.video &&
        e1?.createdTime == e2?.createdTime &&
        e1?.id == e2?.id;
  }

  @override
  int hash(VideoRecord? e) => const ListEquality().hash([
        e?.videoTitle,
        e?.category,
        e?.speakerName,
        e?.videoTime,
        e?.information,
        e?.tags,
        e?.video,
        e?.createdTime,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is VideoRecord;
}
