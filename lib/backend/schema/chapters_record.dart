import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChaptersRecord extends FirestoreRecord {
  ChaptersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapter_name" field.
  String? _chapterName;
  String get chapterName => _chapterName ?? '';
  bool hasChapterName() => _chapterName != null;

  // "chapter_audio" field.
  String? _chapterAudio;
  String get chapterAudio => _chapterAudio ?? '';
  bool hasChapterAudio() => _chapterAudio != null;

  // "cahpetr_number" field.
  String? _cahpetrNumber;
  String get cahpetrNumber => _cahpetrNumber ?? '';
  bool hasCahpetrNumber() => _cahpetrNumber != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "chapter_info" field.
  String? _chapterInfo;
  String get chapterInfo => _chapterInfo ?? '';
  bool hasChapterInfo() => _chapterInfo != null;

  // "favourite_by" field.
  List<DocumentReference>? _favouriteBy;
  List<DocumentReference> get favouriteBy => _favouriteBy ?? const [];
  bool hasFavouriteBy() => _favouriteBy != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "audio_lyrics" field.
  List<String>? _audioLyrics;
  List<String> get audioLyrics => _audioLyrics ?? const [];
  bool hasAudioLyrics() => _audioLyrics != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _chapterName = snapshotData['chapter_name'] as String?;
    _chapterAudio = snapshotData['chapter_audio'] as String?;
    _cahpetrNumber = snapshotData['cahpetr_number'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _chapterInfo = snapshotData['chapter_info'] as String?;
    _favouriteBy = getDataList(snapshotData['favourite_by']);
    _id = castToType<int>(snapshotData['id']);
    _audioLyrics = getDataList(snapshotData['audio_lyrics']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chapters')
          : FirebaseFirestore.instance.collectionGroup('chapters');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chapters').doc(id);

  static Stream<ChaptersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChaptersRecord.fromSnapshot(s));

  static Future<ChaptersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChaptersRecord.fromSnapshot(s));

  static ChaptersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChaptersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChaptersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChaptersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChaptersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChaptersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChaptersRecordData({
  String? chapterName,
  String? chapterAudio,
  String? cahpetrNumber,
  String? audioUrl,
  DateTime? createdTime,
  String? chapterInfo,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapter_name': chapterName,
      'chapter_audio': chapterAudio,
      'cahpetr_number': cahpetrNumber,
      'audio_url': audioUrl,
      'created_time': createdTime,
      'chapter_info': chapterInfo,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChaptersRecordDocumentEquality implements Equality<ChaptersRecord> {
  const ChaptersRecordDocumentEquality();

  @override
  bool equals(ChaptersRecord? e1, ChaptersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.chapterName == e2?.chapterName &&
        e1?.chapterAudio == e2?.chapterAudio &&
        e1?.cahpetrNumber == e2?.cahpetrNumber &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.chapterInfo == e2?.chapterInfo &&
        listEquality.equals(e1?.favouriteBy, e2?.favouriteBy) &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.audioLyrics, e2?.audioLyrics);
  }

  @override
  int hash(ChaptersRecord? e) => const ListEquality().hash([
        e?.chapterName,
        e?.chapterAudio,
        e?.cahpetrNumber,
        e?.audioUrl,
        e?.createdTime,
        e?.chapterInfo,
        e?.favouriteBy,
        e?.id,
        e?.audioLyrics
      ]);

  @override
  bool isValidKey(Object? o) => o is ChaptersRecord;
}
