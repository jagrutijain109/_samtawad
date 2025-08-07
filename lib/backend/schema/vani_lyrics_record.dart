import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VaniLyricsRecord extends FirestoreRecord {
  VaniLyricsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _images = snapshotData['images'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('vani_lyrics')
          : FirebaseFirestore.instance.collectionGroup('vani_lyrics');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('vani_lyrics').doc(id);

  static Stream<VaniLyricsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VaniLyricsRecord.fromSnapshot(s));

  static Future<VaniLyricsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VaniLyricsRecord.fromSnapshot(s));

  static VaniLyricsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VaniLyricsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VaniLyricsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VaniLyricsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VaniLyricsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VaniLyricsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVaniLyricsRecordData({
  String? images,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'images': images,
    }.withoutNulls,
  );

  return firestoreData;
}

class VaniLyricsRecordDocumentEquality implements Equality<VaniLyricsRecord> {
  const VaniLyricsRecordDocumentEquality();

  @override
  bool equals(VaniLyricsRecord? e1, VaniLyricsRecord? e2) {
    return e1?.images == e2?.images;
  }

  @override
  int hash(VaniLyricsRecord? e) => const ListEquality().hash([e?.images]);

  @override
  bool isValidKey(Object? o) => o is VaniLyricsRecord;
}
