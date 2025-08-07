import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestwishlistRecord extends FirestoreRecord {
  TestwishlistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('testwishlist');

  static Stream<TestwishlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TestwishlistRecord.fromSnapshot(s));

  static Future<TestwishlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TestwishlistRecord.fromSnapshot(s));

  static TestwishlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TestwishlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TestwishlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TestwishlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TestwishlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TestwishlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTestwishlistRecordData({
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class TestwishlistRecordDocumentEquality
    implements Equality<TestwishlistRecord> {
  const TestwishlistRecordDocumentEquality();

  @override
  bool equals(TestwishlistRecord? e1, TestwishlistRecord? e2) {
    return e1?.id == e2?.id;
  }

  @override
  int hash(TestwishlistRecord? e) => const ListEquality().hash([e?.id]);

  @override
  bool isValidKey(Object? o) => o is TestwishlistRecord;
}
