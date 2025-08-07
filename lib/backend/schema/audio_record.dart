import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioRecord extends FirestoreRecord {
  AudioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "audio_title" field.
  String? _audioTitle;
  String get audioTitle => _audioTitle ?? '';
  bool hasAudioTitle() => _audioTitle != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "audio_time" field.
  String? _audioTime;
  String get audioTime => _audioTime ?? '';
  bool hasAudioTime() => _audioTime != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "speaker_name" field.
  String? _speakerName;
  String get speakerName => _speakerName ?? '';
  bool hasSpeakerName() => _speakerName != null;

  // "last_listned_time" field.
  DateTime? _lastListnedTime;
  DateTime? get lastListnedTime => _lastListnedTime;
  bool hasLastListnedTime() => _lastListnedTime != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "audio_link" field.
  String? _audioLink;
  String get audioLink => _audioLink ?? '';
  bool hasAudioLink() => _audioLink != null;

  // "doha" field.
  String? _doha;
  String get doha => _doha ?? '';
  bool hasDoha() => _doha != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  // "favorite_by" field.
  List<DocumentReference>? _favoriteBy;
  List<DocumentReference> get favoriteBy => _favoriteBy ?? const [];
  bool hasFavoriteBy() => _favoriteBy != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "isnew" field.
  bool? _isnew;
  bool get isnew => _isnew ?? false;
  bool hasIsnew() => _isnew != null;

  // "vani_category" field.
  String? _vaniCategory;
  String get vaniCategory => _vaniCategory ?? '';
  bool hasVaniCategory() => _vaniCategory != null;

  // "audio_lyrics" field.
  List<String>? _audioLyrics;
  List<String> get audioLyrics => _audioLyrics ?? const [];
  bool hasAudioLyrics() => _audioLyrics != null;

  void _initializeFields() {
    _audioTitle = snapshotData['audio_title'] as String?;
    _category = snapshotData['category'] as String?;
    _audioTime = snapshotData['audio_time'] as String?;
    _information = snapshotData['information'] as String?;
    _image = snapshotData['image'] as String?;
    _tags = snapshotData['tags'] as String?;
    _audio = snapshotData['audio'] as String?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _speakerName = snapshotData['speaker_name'] as String?;
    _lastListnedTime = snapshotData['last_listned_time'] as DateTime?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _audioLink = snapshotData['audio_link'] as String?;
    _doha = snapshotData['doha'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
    _favoriteBy = getDataList(snapshotData['favorite_by']);
    _id = castToType<int>(snapshotData['id']);
    _isnew = snapshotData['isnew'] as bool?;
    _vaniCategory = snapshotData['vani_category'] as String?;
    _audioLyrics = getDataList(snapshotData['audio_lyrics']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audio');

  static Stream<AudioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioRecord.fromSnapshot(s));

  static Future<AudioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioRecord.fromSnapshot(s));

  static AudioRecord fromSnapshot(DocumentSnapshot snapshot) => AudioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioRecordData({
  String? audioTitle,
  String? category,
  String? audioTime,
  String? information,
  String? image,
  String? tags,
  String? audio,
  String? contactInfo,
  String? speakerName,
  DateTime? lastListnedTime,
  DateTime? createdTime,
  String? audioLink,
  String? doha,
  String? audioUrl,
  int? id,
  bool? isnew,
  String? vaniCategory,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'audio_title': audioTitle,
      'category': category,
      'audio_time': audioTime,
      'information': information,
      'image': image,
      'tags': tags,
      'audio': audio,
      'contact_info': contactInfo,
      'speaker_name': speakerName,
      'last_listned_time': lastListnedTime,
      'created_time': createdTime,
      'audio_link': audioLink,
      'doha': doha,
      'audio_url': audioUrl,
      'id': id,
      'isnew': isnew,
      'vani_category': vaniCategory,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioRecordDocumentEquality implements Equality<AudioRecord> {
  const AudioRecordDocumentEquality();

  @override
  bool equals(AudioRecord? e1, AudioRecord? e2) {
    const listEquality = ListEquality();
    return e1?.audioTitle == e2?.audioTitle &&
        e1?.category == e2?.category &&
        e1?.audioTime == e2?.audioTime &&
        e1?.information == e2?.information &&
        e1?.image == e2?.image &&
        e1?.tags == e2?.tags &&
        e1?.audio == e2?.audio &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.speakerName == e2?.speakerName &&
        e1?.lastListnedTime == e2?.lastListnedTime &&
        e1?.createdTime == e2?.createdTime &&
        e1?.audioLink == e2?.audioLink &&
        e1?.doha == e2?.doha &&
        e1?.audioUrl == e2?.audioUrl &&
        listEquality.equals(e1?.favoriteBy, e2?.favoriteBy) &&
        e1?.id == e2?.id &&
        e1?.isnew == e2?.isnew &&
        e1?.vaniCategory == e2?.vaniCategory &&
        listEquality.equals(e1?.audioLyrics, e2?.audioLyrics);
  }

  @override
  int hash(AudioRecord? e) => const ListEquality().hash([
        e?.audioTitle,
        e?.category,
        e?.audioTime,
        e?.information,
        e?.image,
        e?.tags,
        e?.audio,
        e?.contactInfo,
        e?.speakerName,
        e?.lastListnedTime,
        e?.createdTime,
        e?.audioLink,
        e?.doha,
        e?.audioUrl,
        e?.favoriteBy,
        e?.id,
        e?.isnew,
        e?.vaniCategory,
        e?.audioLyrics
      ]);

  @override
  bool isValidKey(Object? o) => o is AudioRecord;
}
