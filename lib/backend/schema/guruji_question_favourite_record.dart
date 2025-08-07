import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurujiQuestionFavouriteRecord extends FirestoreRecord {
  GurujiQuestionFavouriteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "questionDocumentID" field.
  String? _questionDocumentID;
  String get questionDocumentID => _questionDocumentID ?? '';
  bool hasQuestionDocumentID() => _questionDocumentID != null;

  // "questionname" field.
  String? _questionname;
  String get questionname => _questionname ?? '';
  bool hasQuestionname() => _questionname != null;

  // "questionnumber" field.
  String? _questionnumber;
  String get questionnumber => _questionnumber ?? '';
  bool hasQuestionnumber() => _questionnumber != null;

  // "pageno" field.
  String? _pageno;
  String get pageno => _pageno ?? '';
  bool hasPageno() => _pageno != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "favoriteDocID" field.
  String? _favoriteDocID;
  String get favoriteDocID => _favoriteDocID ?? '';
  bool hasFavoriteDocID() => _favoriteDocID != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _questionDocumentID = snapshotData['questionDocumentID'] as String?;
    _questionname = snapshotData['questionname'] as String?;
    _questionnumber = snapshotData['questionnumber'] as String?;
    _pageno = snapshotData['pageno'] as String?;
    _userId = snapshotData['userId'] as String?;
    _favoriteDocID = snapshotData['favoriteDocID'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _uid = snapshotData['uid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guruji_question_favourite');

  static Stream<GurujiQuestionFavouriteRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GurujiQuestionFavouriteRecord.fromSnapshot(s));

  static Future<GurujiQuestionFavouriteRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GurujiQuestionFavouriteRecord.fromSnapshot(s));

  static GurujiQuestionFavouriteRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      GurujiQuestionFavouriteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurujiQuestionFavouriteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurujiQuestionFavouriteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurujiQuestionFavouriteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurujiQuestionFavouriteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurujiQuestionFavouriteRecordData({
  String? questionDocumentID,
  String? questionname,
  String? questionnumber,
  String? pageno,
  String? userId,
  String? favoriteDocID,
  DateTime? timestamp,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questionDocumentID': questionDocumentID,
      'questionname': questionname,
      'questionnumber': questionnumber,
      'pageno': pageno,
      'userId': userId,
      'favoriteDocID': favoriteDocID,
      'timestamp': timestamp,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurujiQuestionFavouriteRecordDocumentEquality
    implements Equality<GurujiQuestionFavouriteRecord> {
  const GurujiQuestionFavouriteRecordDocumentEquality();

  @override
  bool equals(
      GurujiQuestionFavouriteRecord? e1, GurujiQuestionFavouriteRecord? e2) {
    return e1?.questionDocumentID == e2?.questionDocumentID &&
        e1?.questionname == e2?.questionname &&
        e1?.questionnumber == e2?.questionnumber &&
        e1?.pageno == e2?.pageno &&
        e1?.userId == e2?.userId &&
        e1?.favoriteDocID == e2?.favoriteDocID &&
        e1?.timestamp == e2?.timestamp &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(GurujiQuestionFavouriteRecord? e) => const ListEquality().hash([
        e?.questionDocumentID,
        e?.questionname,
        e?.questionnumber,
        e?.pageno,
        e?.userId,
        e?.favoriteDocID,
        e?.timestamp,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is GurujiQuestionFavouriteRecord;
}
