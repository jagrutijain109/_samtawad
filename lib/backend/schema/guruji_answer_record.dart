import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurujiAnswerRecord extends FirestoreRecord {
  GurujiAnswerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "answerId" field.
  String? _answerId;
  String get answerId => _answerId ?? '';
  bool hasAnswerId() => _answerId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _vachan = snapshotData['vachan'] as String?;
    _description = snapshotData['description'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _answerId = snapshotData['answerId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('guruji_answer')
          : FirebaseFirestore.instance.collectionGroup('guruji_answer');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('guruji_answer').doc(id);

  static Stream<GurujiAnswerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GurujiAnswerRecord.fromSnapshot(s));

  static Future<GurujiAnswerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GurujiAnswerRecord.fromSnapshot(s));

  static GurujiAnswerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GurujiAnswerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurujiAnswerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurujiAnswerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurujiAnswerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurujiAnswerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurujiAnswerRecordData({
  String? vachan,
  String? description,
  DateTime? createdTime,
  String? answerId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vachan': vachan,
      'description': description,
      'created_time': createdTime,
      'answerId': answerId,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurujiAnswerRecordDocumentEquality
    implements Equality<GurujiAnswerRecord> {
  const GurujiAnswerRecordDocumentEquality();

  @override
  bool equals(GurujiAnswerRecord? e1, GurujiAnswerRecord? e2) {
    return e1?.vachan == e2?.vachan &&
        e1?.description == e2?.description &&
        e1?.createdTime == e2?.createdTime &&
        e1?.answerId == e2?.answerId;
  }

  @override
  int hash(GurujiAnswerRecord? e) => const ListEquality()
      .hash([e?.vachan, e?.description, e?.createdTime, e?.answerId]);

  @override
  bool isValidKey(Object? o) => o is GurujiAnswerRecord;
}
