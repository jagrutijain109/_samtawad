import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioBookRecord extends FirestoreRecord {
  AudioBookRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "book_name" field.
  String? _bookName;
  String get bookName => _bookName ?? '';
  bool hasBookName() => _bookName != null;

  // "book_image" field.
  String? _bookImage;
  String get bookImage => _bookImage ?? '';
  bool hasBookImage() => _bookImage != null;

  // "book_audio" field.
  String? _bookAudio;
  String get bookAudio => _bookAudio ?? '';
  bool hasBookAudio() => _bookAudio != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "book_auther" field.
  String? _bookAuther;
  String get bookAuther => _bookAuther ?? '';
  bool hasBookAuther() => _bookAuther != null;

  // "chapter_name" field.
  List<String>? _chapterName;
  List<String> get chapterName => _chapterName ?? const [];
  bool hasChapterName() => _chapterName != null;

  // "audio_book_id" field.
  String? _audioBookId;
  String get audioBookId => _audioBookId ?? '';
  bool hasAudioBookId() => _audioBookId != null;

  // "chapter_number" field.
  List<int>? _chapterNumber;
  List<int> get chapterNumber => _chapterNumber ?? const [];
  bool hasChapterNumber() => _chapterNumber != null;

  // "doha" field.
  String? _doha;
  String get doha => _doha ?? '';
  bool hasDoha() => _doha != null;

  // "book_info" field.
  String? _bookInfo;
  String get bookInfo => _bookInfo ?? '';
  bool hasBookInfo() => _bookInfo != null;

  // "audio_book_url" field.
  String? _audioBookUrl;
  String get audioBookUrl => _audioBookUrl ?? '';
  bool hasAudioBookUrl() => _audioBookUrl != null;

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

  void _initializeFields() {
    _bookName = snapshotData['book_name'] as String?;
    _bookImage = snapshotData['book_image'] as String?;
    _bookAudio = snapshotData['book_audio'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _bookAuther = snapshotData['book_auther'] as String?;
    _chapterName = getDataList(snapshotData['chapter_name']);
    _audioBookId = snapshotData['audio_book_id'] as String?;
    _chapterNumber = getDataList(snapshotData['chapter_number']);
    _doha = snapshotData['doha'] as String?;
    _bookInfo = snapshotData['book_info'] as String?;
    _audioBookUrl = snapshotData['audio_book_url'] as String?;
    _favouriteBy = getDataList(snapshotData['favourite_by']);
    _id = castToType<int>(snapshotData['id']);
    _audioLyrics = getDataList(snapshotData['audio_lyrics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audio_book');

  static Stream<AudioBookRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioBookRecord.fromSnapshot(s));

  static Future<AudioBookRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioBookRecord.fromSnapshot(s));

  static AudioBookRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioBookRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioBookRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioBookRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioBookRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioBookRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioBookRecordData({
  String? bookName,
  String? bookImage,
  String? bookAudio,
  DateTime? createdTime,
  String? bookAuther,
  String? audioBookId,
  String? doha,
  String? bookInfo,
  String? audioBookUrl,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'book_name': bookName,
      'book_image': bookImage,
      'book_audio': bookAudio,
      'created_time': createdTime,
      'book_auther': bookAuther,
      'audio_book_id': audioBookId,
      'doha': doha,
      'book_info': bookInfo,
      'audio_book_url': audioBookUrl,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioBookRecordDocumentEquality implements Equality<AudioBookRecord> {
  const AudioBookRecordDocumentEquality();

  @override
  bool equals(AudioBookRecord? e1, AudioBookRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookName == e2?.bookName &&
        e1?.bookImage == e2?.bookImage &&
        e1?.bookAudio == e2?.bookAudio &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bookAuther == e2?.bookAuther &&
        listEquality.equals(e1?.chapterName, e2?.chapterName) &&
        e1?.audioBookId == e2?.audioBookId &&
        listEquality.equals(e1?.chapterNumber, e2?.chapterNumber) &&
        e1?.doha == e2?.doha &&
        e1?.bookInfo == e2?.bookInfo &&
        e1?.audioBookUrl == e2?.audioBookUrl &&
        listEquality.equals(e1?.favouriteBy, e2?.favouriteBy) &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.audioLyrics, e2?.audioLyrics);
  }

  @override
  int hash(AudioBookRecord? e) => const ListEquality().hash([
        e?.bookName,
        e?.bookImage,
        e?.bookAudio,
        e?.createdTime,
        e?.bookAuther,
        e?.chapterName,
        e?.audioBookId,
        e?.chapterNumber,
        e?.doha,
        e?.bookInfo,
        e?.audioBookUrl,
        e?.favouriteBy,
        e?.id,
        e?.audioLyrics
      ]);

  @override
  bool isValidKey(Object? o) => o is AudioBookRecord;
}
