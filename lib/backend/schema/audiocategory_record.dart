import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudiocategoryRecord extends FirestoreRecord {
  AudiocategoryRecord._(
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
      FirebaseFirestore.instance.collection('audiocategory');

  static Stream<AudiocategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudiocategoryRecord.fromSnapshot(s));

  static Future<AudiocategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudiocategoryRecord.fromSnapshot(s));

  static AudiocategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudiocategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudiocategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudiocategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudiocategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudiocategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudiocategoryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudiocategoryRecordDocumentEquality
    implements Equality<AudiocategoryRecord> {
  const AudiocategoryRecordDocumentEquality();

  @override
  bool equals(AudiocategoryRecord? e1, AudiocategoryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(AudiocategoryRecord? e) => const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is AudiocategoryRecord;
}
