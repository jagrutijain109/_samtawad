import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListnedRecord extends FirestoreRecord {
  ListnedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "audio_id" field.
  int? _audioId;
  int get audioId => _audioId ?? 0;
  bool hasAudioId() => _audioId != null;

  // "audio_name" field.
  String? _audioName;
  String get audioName => _audioName ?? '';
  bool hasAudioName() => _audioName != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _audioId = castToType<int>(snapshotData['audio_id']);
    _audioName = snapshotData['audio_name'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('listned')
          : FirebaseFirestore.instance.collectionGroup('listned');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('listned').doc(id);

  static Stream<ListnedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ListnedRecord.fromSnapshot(s));

  static Future<ListnedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ListnedRecord.fromSnapshot(s));

  static ListnedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ListnedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ListnedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ListnedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ListnedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ListnedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createListnedRecordData({
  int? audioId,
  String? audioName,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'audio_id': audioId,
      'audio_name': audioName,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ListnedRecordDocumentEquality implements Equality<ListnedRecord> {
  const ListnedRecordDocumentEquality();

  @override
  bool equals(ListnedRecord? e1, ListnedRecord? e2) {
    return e1?.audioId == e2?.audioId &&
        e1?.audioName == e2?.audioName &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(ListnedRecord? e) =>
      const ListEquality().hash([e?.audioId, e?.audioName, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is ListnedRecord;
}
