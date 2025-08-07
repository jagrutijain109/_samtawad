import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurujiQuestionRecord extends FirestoreRecord {
  GurujiQuestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question_name" field.
  String? _questionName;
  String get questionName => _questionName ?? '';
  bool hasQuestionName() => _questionName != null;

  // "question_number" field.
  int? _questionNumber;
  int get questionNumber => _questionNumber ?? 0;
  bool hasQuestionNumber() => _questionNumber != null;

  // "page_no" field.
  String? _pageNo;
  String get pageNo => _pageNo ?? '';
  bool hasPageNo() => _pageNo != null;

  // "vachan" field.
  List<String>? _vachan;
  List<String> get vachan => _vachan ?? const [];
  bool hasVachan() => _vachan != null;

  // "description" field.
  List<String>? _description;
  List<String> get description => _description ?? const [];
  bool hasDescription() => _description != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "question_id" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  bool hasQuestionId() => _questionId != null;

  void _initializeFields() {
    _questionName = snapshotData['question_name'] as String?;
    _questionNumber = castToType<int>(snapshotData['question_number']);
    _pageNo = snapshotData['page_no'] as String?;
    _vachan = getDataList(snapshotData['vachan']);
    _description = getDataList(snapshotData['description']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _questionId = snapshotData['question_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guruji_question');

  static Stream<GurujiQuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GurujiQuestionRecord.fromSnapshot(s));

  static Future<GurujiQuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GurujiQuestionRecord.fromSnapshot(s));

  static GurujiQuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GurujiQuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurujiQuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurujiQuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurujiQuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurujiQuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurujiQuestionRecordData({
  String? questionName,
  int? questionNumber,
  String? pageNo,
  DateTime? createdTime,
  String? questionId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_name': questionName,
      'question_number': questionNumber,
      'page_no': pageNo,
      'created_time': createdTime,
      'question_id': questionId,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurujiQuestionRecordDocumentEquality
    implements Equality<GurujiQuestionRecord> {
  const GurujiQuestionRecordDocumentEquality();

  @override
  bool equals(GurujiQuestionRecord? e1, GurujiQuestionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionName == e2?.questionName &&
        e1?.questionNumber == e2?.questionNumber &&
        e1?.pageNo == e2?.pageNo &&
        listEquality.equals(e1?.vachan, e2?.vachan) &&
        listEquality.equals(e1?.description, e2?.description) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.questionId == e2?.questionId;
  }

  @override
  int hash(GurujiQuestionRecord? e) => const ListEquality().hash([
        e?.questionName,
        e?.questionNumber,
        e?.pageNo,
        e?.vachan,
        e?.description,
        e?.createdTime,
        e?.questionId
      ]);

  @override
  bool isValidKey(Object? o) => o is GurujiQuestionRecord;
}
