import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioCategoryRecord extends FirestoreRecord {
  AudioCategoryRecord._(
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
      FirebaseFirestore.instance.collection('audio_category');

  static Stream<AudioCategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioCategoryRecord.fromSnapshot(s));

  static Future<AudioCategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioCategoryRecord.fromSnapshot(s));

  static AudioCategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioCategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioCategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioCategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioCategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioCategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioCategoryRecordData({
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioCategoryRecordDocumentEquality
    implements Equality<AudioCategoryRecord> {
  const AudioCategoryRecordDocumentEquality();

  @override
  bool equals(AudioCategoryRecord? e1, AudioCategoryRecord? e2) {
    return e1?.category == e2?.category;
  }

  @override
  int hash(AudioCategoryRecord? e) => const ListEquality().hash([e?.category]);

  @override
  bool isValidKey(Object? o) => o is AudioCategoryRecord;
}
