import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurukalincategoryRecord extends FirestoreRecord {
  GurukalincategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gurukalincategory');

  static Stream<GurukalincategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GurukalincategoryRecord.fromSnapshot(s));

  static Future<GurukalincategoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GurukalincategoryRecord.fromSnapshot(s));

  static GurukalincategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GurukalincategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurukalincategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurukalincategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurukalincategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurukalincategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurukalincategoryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurukalincategoryRecordDocumentEquality
    implements Equality<GurukalincategoryRecord> {
  const GurukalincategoryRecordDocumentEquality();

  @override
  bool equals(GurukalincategoryRecord? e1, GurukalincategoryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(GurukalincategoryRecord? e) =>
      const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is GurukalincategoryRecord;
}
