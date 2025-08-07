import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SatsangcategoryRecord extends FirestoreRecord {
  SatsangcategoryRecord._(
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
      FirebaseFirestore.instance.collection('satsangcategory');

  static Stream<SatsangcategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SatsangcategoryRecord.fromSnapshot(s));

  static Future<SatsangcategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SatsangcategoryRecord.fromSnapshot(s));

  static SatsangcategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SatsangcategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SatsangcategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SatsangcategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SatsangcategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SatsangcategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSatsangcategoryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class SatsangcategoryRecordDocumentEquality
    implements Equality<SatsangcategoryRecord> {
  const SatsangcategoryRecordDocumentEquality();

  @override
  bool equals(SatsangcategoryRecord? e1, SatsangcategoryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(SatsangcategoryRecord? e) =>
      const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is SatsangcategoryRecord;
}
