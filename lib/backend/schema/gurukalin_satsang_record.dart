import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurukalinSatsangRecord extends FirestoreRecord {
  GurukalinSatsangRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "satsang_title" field.
  String? _satsangTitle;
  String get satsangTitle => _satsangTitle ?? '';
  bool hasSatsangTitle() => _satsangTitle != null;

  // "spaker_name" field.
  String? _spakerName;
  String get spakerName => _spakerName ?? '';
  bool hasSpakerName() => _spakerName != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "last_listned_date_time" field.
  DateTime? _lastListnedDateTime;
  DateTime? get lastListnedDateTime => _lastListnedDateTime;
  bool hasLastListnedDateTime() => _lastListnedDateTime != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "audio_time" field.
  String? _audioTime;
  String get audioTime => _audioTime ?? '';
  bool hasAudioTime() => _audioTime != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "guruKalin_audio_url" field.
  String? _guruKalinAudioUrl;
  String get guruKalinAudioUrl => _guruKalinAudioUrl ?? '';
  bool hasGuruKalinAudioUrl() => _guruKalinAudioUrl != null;

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

  // "vani_category" field.
  String? _vaniCategory;
  String get vaniCategory => _vaniCategory ?? '';
  bool hasVaniCategory() => _vaniCategory != null;

  // "audio_lyrics" field.
  List<String>? _audioLyrics;
  List<String> get audioLyrics => _audioLyrics ?? const [];
  bool hasAudioLyrics() => _audioLyrics != null;

  void _initializeFields() {
    _satsangTitle = snapshotData['satsang_title'] as String?;
    _spakerName = snapshotData['spaker_name'] as String?;
    _category = snapshotData['category'] as String?;
    _tags = snapshotData['tags'] as String?;
    _information = snapshotData['information'] as String?;
    _lastListnedDateTime = snapshotData['last_listned_date_time'] as DateTime?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _audioTime = snapshotData['audio_time'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _guruKalinAudioUrl = snapshotData['guruKalin_audio_url'] as String?;
    _doha = snapshotData['doha'] as String?;
    _audiourl = snapshotData['audiourl'] as String?;
    _favoriteBy = getDataList(snapshotData['favorite_by']);
    _id = castToType<int>(snapshotData['id']);
    _vaniCategory = snapshotData['vani_category'] as String?;
    _audioLyrics = getDataList(snapshotData['audio_lyrics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gurukalin_satsang');

  static Stream<GurukalinSatsangRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GurukalinSatsangRecord.fromSnapshot(s));

  static Future<GurukalinSatsangRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GurukalinSatsangRecord.fromSnapshot(s));

  static GurukalinSatsangRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GurukalinSatsangRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurukalinSatsangRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurukalinSatsangRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurukalinSatsangRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurukalinSatsangRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurukalinSatsangRecordData({
  String? satsangTitle,
  String? spakerName,
  String? category,
  String? tags,
  String? information,
  DateTime? lastListnedDateTime,
  String? contactInfo,
  String? audioTime,
  String? imageUrl,
  String? audioUrl,
  DateTime? createdTime,
  String? guruKalinAudioUrl,
  String? doha,
  String? audiourl,
  int? id,
  String? vaniCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'satsang_title': satsangTitle,
      'spaker_name': spakerName,
      'category': category,
      'tags': tags,
      'information': information,
      'last_listned_date_time': lastListnedDateTime,
      'contact_info': contactInfo,
      'audio_time': audioTime,
      'image_url': imageUrl,
      'audio_url': audioUrl,
      'created_time': createdTime,
      'guruKalin_audio_url': guruKalinAudioUrl,
      'doha': doha,
      'audiourl': audiourl,
      'id': id,
      'vani_category': vaniCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurukalinSatsangRecordDocumentEquality
    implements Equality<GurukalinSatsangRecord> {
  const GurukalinSatsangRecordDocumentEquality();

  @override
  bool equals(GurukalinSatsangRecord? e1, GurukalinSatsangRecord? e2) {
    const listEquality = ListEquality();
    return e1?.satsangTitle == e2?.satsangTitle &&
        e1?.spakerName == e2?.spakerName &&
        e1?.category == e2?.category &&
        e1?.tags == e2?.tags &&
        e1?.information == e2?.information &&
        e1?.lastListnedDateTime == e2?.lastListnedDateTime &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.audioTime == e2?.audioTime &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.audioUrl == e2?.audioUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.guruKalinAudioUrl == e2?.guruKalinAudioUrl &&
        e1?.doha == e2?.doha &&
        e1?.audiourl == e2?.audiourl &&
        listEquality.equals(e1?.favoriteBy, e2?.favoriteBy) &&
        e1?.id == e2?.id &&
        e1?.vaniCategory == e2?.vaniCategory &&
        listEquality.equals(e1?.audioLyrics, e2?.audioLyrics);
  }

  @override
  int hash(GurukalinSatsangRecord? e) => const ListEquality().hash([
        e?.satsangTitle,
        e?.spakerName,
        e?.category,
        e?.tags,
        e?.information,
        e?.lastListnedDateTime,
        e?.contactInfo,
        e?.audioTime,
        e?.imageUrl,
        e?.audioUrl,
        e?.createdTime,
        e?.guruKalinAudioUrl,
        e?.doha,
        e?.audiourl,
        e?.favoriteBy,
        e?.id,
        e?.vaniCategory,
        e?.audioLyrics
      ]);

  @override
  bool isValidKey(Object? o) => o is GurukalinSatsangRecord;
}
