import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AashramImageGallaryRecord extends FirestoreRecord {
  AashramImageGallaryRecord._(
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
      FirebaseFirestore.instance.collection('aashram_image_gallary');

  static Stream<AashramImageGallaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AashramImageGallaryRecord.fromSnapshot(s));

  static Future<AashramImageGallaryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AashramImageGallaryRecord.fromSnapshot(s));

  static AashramImageGallaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AashramImageGallaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AashramImageGallaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AashramImageGallaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AashramImageGallaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AashramImageGallaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAashramImageGallaryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class AashramImageGallaryRecordDocumentEquality
    implements Equality<AashramImageGallaryRecord> {
  const AashramImageGallaryRecordDocumentEquality();

  @override
  bool equals(AashramImageGallaryRecord? e1, AashramImageGallaryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(AashramImageGallaryRecord? e) =>
      const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is AashramImageGallaryRecord;
}
