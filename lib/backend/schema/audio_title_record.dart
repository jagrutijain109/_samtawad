import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioTitleRecord extends FirestoreRecord {
  AudioTitleRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audio_title');

  static Stream<AudioTitleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioTitleRecord.fromSnapshot(s));

  static Future<AudioTitleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AudioTitleRecord.fromSnapshot(s));

  static AudioTitleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioTitleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioTitleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioTitleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioTitleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioTitleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioTitleRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioTitleRecordDocumentEquality implements Equality<AudioTitleRecord> {
  const AudioTitleRecordDocumentEquality();

  @override
  bool equals(AudioTitleRecord? e1, AudioTitleRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(AudioTitleRecord? e) => const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is AudioTitleRecord;
}
