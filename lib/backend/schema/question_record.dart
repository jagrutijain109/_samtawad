import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionRecord extends FirestoreRecord {
  QuestionRecord._(
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

  // "question_id" field.
  String? _questionId;
  String get questionId => _questionId ?? '';
  bool hasQuestionId() => _questionId != null;

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

  void _initializeFields() {
    _questionName = snapshotData['question_name'] as String?;
    _questionNumber = castToType<int>(snapshotData['question_number']);
    _questionId = snapshotData['question_id'] as String?;
    _pageNo = snapshotData['page_no'] as String?;
    _vachan = getDataList(snapshotData['vachan']);
    _description = getDataList(snapshotData['description']);
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('question');

  static Stream<QuestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuestionRecord.fromSnapshot(s));

  static Future<QuestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuestionRecord.fromSnapshot(s));

  static QuestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuestionRecordData({
  String? questionName,
  int? questionNumber,
  String? questionId,
  String? pageNo,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question_name': questionName,
      'question_number': questionNumber,
      'question_id': questionId,
      'page_no': pageNo,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuestionRecordDocumentEquality implements Equality<QuestionRecord> {
  const QuestionRecordDocumentEquality();

  @override
  bool equals(QuestionRecord? e1, QuestionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionName == e2?.questionName &&
        e1?.questionNumber == e2?.questionNumber &&
        e1?.questionId == e2?.questionId &&
        e1?.pageNo == e2?.pageNo &&
        listEquality.equals(e1?.vachan, e2?.vachan) &&
        listEquality.equals(e1?.description, e2?.description) &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(QuestionRecord? e) => const ListEquality().hash([
        e?.questionName,
        e?.questionNumber,
        e?.questionId,
        e?.pageNo,
        e?.vachan,
        e?.description,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is QuestionRecord;
}
