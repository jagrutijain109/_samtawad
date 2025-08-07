import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavouriteRecord extends FirestoreRecord {
  FavouriteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "About" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "imagelink" field.
  String? _imagelink;
  String get imagelink => _imagelink ?? '';
  bool hasImagelink() => _imagelink != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "iteam_id" field.
  String? _iteamId;
  String get iteamId => _iteamId ?? '';
  bool hasIteamId() => _iteamId != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "audiolink" field.
  String? _audiolink;
  String get audiolink => _audiolink ?? '';
  bool hasAudiolink() => _audiolink != null;

  // "indexNum" field.
  int? _indexNum;
  int get indexNum => _indexNum ?? 0;
  bool hasIndexNum() => _indexNum != null;

  // "guruDocRef" field.
  DocumentReference? _guruDocRef;
  DocumentReference? get guruDocRef => _guruDocRef;
  bool hasGuruDocRef() => _guruDocRef != null;

  // "question_number" field.
  String? _questionNumber;
  String get questionNumber => _questionNumber ?? '';
  bool hasQuestionNumber() => _questionNumber != null;

  // "question_name" field.
  String? _questionName;
  String get questionName => _questionName ?? '';
  bool hasQuestionName() => _questionName != null;

  // "question_answer" field.
  String? _questionAnswer;
  String get questionAnswer => _questionAnswer ?? '';
  bool hasQuestionAnswer() => _questionAnswer != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _status = snapshotData['status'] as bool?;
    _title = snapshotData['title'] as String?;
    _about = snapshotData['About'] as String?;
    _imagelink = snapshotData['imagelink'] as String?;
    _userId = snapshotData['userId'] as String?;
    _type = snapshotData['type'] as String?;
    _iteamId = snapshotData['iteam_id'] as String?;
    _audio = snapshotData['audio'] as String?;
    _audiolink = snapshotData['audiolink'] as String?;
    _indexNum = castToType<int>(snapshotData['indexNum']);
    _guruDocRef = snapshotData['guruDocRef'] as DocumentReference?;
    _questionNumber = snapshotData['question_number'] as String?;
    _questionName = snapshotData['question_name'] as String?;
    _questionAnswer = snapshotData['question_answer'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favourite');

  static Stream<FavouriteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavouriteRecord.fromSnapshot(s));

  static Future<FavouriteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavouriteRecord.fromSnapshot(s));

  static FavouriteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavouriteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavouriteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavouriteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavouriteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavouriteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavouriteRecordData({
  String? image,
  bool? status,
  String? title,
  String? about,
  String? imagelink,
  String? userId,
  String? type,
  String? iteamId,
  String? audio,
  String? audiolink,
  int? indexNum,
  DocumentReference? guruDocRef,
  String? questionNumber,
  String? questionName,
  String? questionAnswer,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'status': status,
      'title': title,
      'About': about,
      'imagelink': imagelink,
      'userId': userId,
      'type': type,
      'iteam_id': iteamId,
      'audio': audio,
      'audiolink': audiolink,
      'indexNum': indexNum,
      'guruDocRef': guruDocRef,
      'question_number': questionNumber,
      'question_name': questionName,
      'question_answer': questionAnswer,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavouriteRecordDocumentEquality implements Equality<FavouriteRecord> {
  const FavouriteRecordDocumentEquality();

  @override
  bool equals(FavouriteRecord? e1, FavouriteRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.status == e2?.status &&
        e1?.title == e2?.title &&
        e1?.about == e2?.about &&
        e1?.imagelink == e2?.imagelink &&
        e1?.userId == e2?.userId &&
        e1?.type == e2?.type &&
        e1?.iteamId == e2?.iteamId &&
        e1?.audio == e2?.audio &&
        e1?.audiolink == e2?.audiolink &&
        e1?.indexNum == e2?.indexNum &&
        e1?.guruDocRef == e2?.guruDocRef &&
        e1?.questionNumber == e2?.questionNumber &&
        e1?.questionName == e2?.questionName &&
        e1?.questionAnswer == e2?.questionAnswer;
  }

  @override
  int hash(FavouriteRecord? e) => const ListEquality().hash([
        e?.image,
        e?.status,
        e?.title,
        e?.about,
        e?.imagelink,
        e?.userId,
        e?.type,
        e?.iteamId,
        e?.audio,
        e?.audiolink,
        e?.indexNum,
        e?.guruDocRef,
        e?.questionNumber,
        e?.questionName,
        e?.questionAnswer
      ]);

  @override
  bool isValidKey(Object? o) => o is FavouriteRecord;
}
