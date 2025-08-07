import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrurkalinSatsangCategoryRecord extends FirestoreRecord {
  GrurkalinSatsangCategoryRecord._(
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
      FirebaseFirestore.instance.collection('grurkalin_satsang_category');

  static Stream<GrurkalinSatsangCategoryRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => GrurkalinSatsangCategoryRecord.fromSnapshot(s));

  static Future<GrurkalinSatsangCategoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GrurkalinSatsangCategoryRecord.fromSnapshot(s));

  static GrurkalinSatsangCategoryRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      GrurkalinSatsangCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GrurkalinSatsangCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GrurkalinSatsangCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GrurkalinSatsangCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GrurkalinSatsangCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGrurkalinSatsangCategoryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class GrurkalinSatsangCategoryRecordDocumentEquality
    implements Equality<GrurkalinSatsangCategoryRecord> {
  const GrurkalinSatsangCategoryRecordDocumentEquality();

  @override
  bool equals(
      GrurkalinSatsangCategoryRecord? e1, GrurkalinSatsangCategoryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(GrurkalinSatsangCategoryRecord? e) =>
      const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is GrurkalinSatsangCategoryRecord;
}
