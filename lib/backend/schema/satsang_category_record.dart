import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SatsangCategoryRecord extends FirestoreRecord {
  SatsangCategoryRecord._(
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
      FirebaseFirestore.instance.collection('satsang_category');

  static Stream<SatsangCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SatsangCategoryRecord.fromSnapshot(s));

  static Future<SatsangCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SatsangCategoryRecord.fromSnapshot(s));

  static SatsangCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SatsangCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SatsangCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SatsangCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SatsangCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SatsangCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSatsangCategoryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class SatsangCategoryRecordDocumentEquality
    implements Equality<SatsangCategoryRecord> {
  const SatsangCategoryRecordDocumentEquality();

  @override
  bool equals(SatsangCategoryRecord? e1, SatsangCategoryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(SatsangCategoryRecord? e) =>
      const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is SatsangCategoryRecord;
}
