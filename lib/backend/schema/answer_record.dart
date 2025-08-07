import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnswerRecord extends FirestoreRecord {
  AnswerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "answerId" field.
  String? _answerId;
  String get answerId => _answerId ?? '';
  bool hasAnswerId() => _answerId != null;

  // "vachan" field.
  String? _vachan;
  String get vachan => _vachan ?? '';
  bool hasVachan() => _vachan != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _answerId = snapshotData['answerId'] as String?;
    _vachan = snapshotData['vachan'] as String?;
    _description = snapshotData['description'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('answer')
          : FirebaseFirestore.instance.collectionGroup('answer');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('answer').doc(id);

  static Stream<AnswerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AnswerRecord.fromSnapshot(s));

  static Future<AnswerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AnswerRecord.fromSnapshot(s));

  static AnswerRecord fromSnapshot(DocumentSnapshot snapshot) => AnswerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AnswerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AnswerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AnswerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AnswerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswerRecordData({
  String? answerId,
  String? vachan,
  String? description,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'answerId': answerId,
      'vachan': vachan,
      'description': description,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AnswerRecordDocumentEquality implements Equality<AnswerRecord> {
  const AnswerRecordDocumentEquality();

  @override
  bool equals(AnswerRecord? e1, AnswerRecord? e2) {
    return e1?.answerId == e2?.answerId &&
        e1?.vachan == e2?.vachan &&
        e1?.description == e2?.description &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(AnswerRecord? e) => const ListEquality()
      .hash([e?.answerId, e?.vachan, e?.description, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is AnswerRecord;
}
