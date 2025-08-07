import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SamtawadImageCategoryRecord extends FirestoreRecord {
  SamtawadImageCategoryRecord._(
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
      FirebaseFirestore.instance.collection('samtawad_image_category');

  static Stream<SamtawadImageCategoryRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SamtawadImageCategoryRecord.fromSnapshot(s));

  static Future<SamtawadImageCategoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SamtawadImageCategoryRecord.fromSnapshot(s));

  static SamtawadImageCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SamtawadImageCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SamtawadImageCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SamtawadImageCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SamtawadImageCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SamtawadImageCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSamtawadImageCategoryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class SamtawadImageCategoryRecordDocumentEquality
    implements Equality<SamtawadImageCategoryRecord> {
  const SamtawadImageCategoryRecordDocumentEquality();

  @override
  bool equals(
      SamtawadImageCategoryRecord? e1, SamtawadImageCategoryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(SamtawadImageCategoryRecord? e) =>
      const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is SamtawadImageCategoryRecord;
}
