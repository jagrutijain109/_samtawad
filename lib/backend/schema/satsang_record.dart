import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SatsangRecord extends FirestoreRecord {
  SatsangRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "speaker_name" field.
  String? _speakerName;
  String get speakerName => _speakerName ?? '';
  bool hasSpeakerName() => _speakerName != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "last_listned_time" field.
  DateTime? _lastListnedTime;
  DateTime? get lastListnedTime => _lastListnedTime;
  bool hasLastListnedTime() => _lastListnedTime != null;

  // "audio_time" field.
  String? _audioTime;
  String get audioTime => _audioTime ?? '';
  bool hasAudioTime() => _audioTime != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "satsang_audio_url" field.
  String? _satsangAudioUrl;
  String get satsangAudioUrl => _satsangAudioUrl ?? '';
  bool hasSatsangAudioUrl() => _satsangAudioUrl != null;

  // "doha" field.
  String? _doha;
  String get doha => _doha ?? '';
  bool hasDoha() => _doha != null;

  // "audiourl" field.
  String? _audiourl;
  String get audiourl => _audiourl ?? '';
  bool hasAudiourl() => _audiourl != null;

  // "favorite_by" field.
  List<DocumentReference>? _favoriteBy;
  List<DocumentReference> get favoriteBy => _favoriteBy ?? const [];
  bool hasFavoriteBy() => _favoriteBy != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "satsang_category" field.
  String? _satsangCategory;
  String get satsangCategory => _satsangCategory ?? '';
  bool hasSatsangCategory() => _satsangCategory != null;

  // "satsang_lyrics" field.
  List<String>? _satsangLyrics;
  List<String> get satsangLyrics => _satsangLyrics ?? const [];
  bool hasSatsangLyrics() => _satsangLyrics != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _speakerName = snapshotData['speaker_name'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _category = snapshotData['category'] as String?;
    _information = snapshotData['information'] as String?;
    _lastListnedTime = snapshotData['last_listned_time'] as DateTime?;
    _audioTime = snapshotData['audio_time'] as String?;
    _tags = snapshotData['tags'] as String?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _satsangAudioUrl = snapshotData['satsang_audio_url'] as String?;
    _doha = snapshotData['doha'] as String?;
    _audiourl = snapshotData['audiourl'] as String?;
    _favoriteBy = getDataList(snapshotData['favorite_by']);
    _id = castToType<int>(snapshotData['id']);
    _satsangCategory = snapshotData['satsang_category'] as String?;
    _satsangLyrics = getDataList(snapshotData['satsang_lyrics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('satsang');

  static Stream<SatsangRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SatsangRecord.fromSnapshot(s));

  static Future<SatsangRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SatsangRecord.fromSnapshot(s));

  static SatsangRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SatsangRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SatsangRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SatsangRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SatsangRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SatsangRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSatsangRecordData({
  String? title,
  String? speakerName,
  String? audioUrl,
  String? imageUrl,
  String? category,
  String? information,
  DateTime? lastListnedTime,
  String? audioTime,
  String? tags,
  String? contactInfo,
  DateTime? createdTime,
  String? satsangAudioUrl,
  String? doha,
  String? audiourl,
  int? id,
  String? satsangCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'speaker_name': speakerName,
      'audio_url': audioUrl,
      'image_url': imageUrl,
      'category': category,
      'information': information,
      'last_listned_time': lastListnedTime,
      'audio_time': audioTime,
      'tags': tags,
      'contact_info': contactInfo,
      'created_time': createdTime,
      'satsang_audio_url': satsangAudioUrl,
      'doha': doha,
      'audiourl': audiourl,
      'id': id,
      'satsang_category': satsangCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class SatsangRecordDocumentEquality implements Equality<SatsangRecord> {
  const SatsangRecordDocumentEquality();

  @override
  bool equals(SatsangRecord? e1, SatsangRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.speakerName == e2?.speakerName &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.category == e2?.category &&
        e1?.information == e2?.information &&
        e1?.lastListnedTime == e2?.lastListnedTime &&
        e1?.audioTime == e2?.audioTime &&
        e1?.tags == e2?.tags &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.createdTime == e2?.createdTime &&
        e1?.satsangAudioUrl == e2?.satsangAudioUrl &&
        e1?.doha == e2?.doha &&
        e1?.audiourl == e2?.audiourl &&
        listEquality.equals(e1?.favoriteBy, e2?.favoriteBy) &&
        e1?.id == e2?.id &&
        e1?.satsangCategory == e2?.satsangCategory &&
        listEquality.equals(e1?.satsangLyrics, e2?.satsangLyrics);
  }

  @override
  int hash(SatsangRecord? e) => const ListEquality().hash([
        e?.title,
        e?.speakerName,
        e?.audioUrl,
        e?.imageUrl,
        e?.category,
        e?.information,
        e?.lastListnedTime,
        e?.audioTime,
        e?.tags,
        e?.contactInfo,
        e?.createdTime,
        e?.satsangAudioUrl,
        e?.doha,
        e?.audiourl,
        e?.favoriteBy,
        e?.id,
        e?.satsangCategory,
        e?.satsangLyrics
      ]);

  @override
  bool isValidKey(Object? o) => o is SatsangRecord;
}
