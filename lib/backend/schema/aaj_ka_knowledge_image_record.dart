import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AajKaKnowledgeImageRecord extends FirestoreRecord {
  AajKaKnowledgeImageRecord._(
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
      FirebaseFirestore.instance.collection('aaj_ka_knowledge_image');

  static Stream<AajKaKnowledgeImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AajKaKnowledgeImageRecord.fromSnapshot(s));

  static Future<AajKaKnowledgeImageRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AajKaKnowledgeImageRecord.fromSnapshot(s));

  static AajKaKnowledgeImageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AajKaKnowledgeImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AajKaKnowledgeImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AajKaKnowledgeImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AajKaKnowledgeImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AajKaKnowledgeImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAajKaKnowledgeImageRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class AajKaKnowledgeImageRecordDocumentEquality
    implements Equality<AajKaKnowledgeImageRecord> {
  const AajKaKnowledgeImageRecordDocumentEquality();

  @override
  bool equals(AajKaKnowledgeImageRecord? e1, AajKaKnowledgeImageRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(AajKaKnowledgeImageRecord? e) =>
      const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is AajKaKnowledgeImageRecord;
}
