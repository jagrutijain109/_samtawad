import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SatsangTitleRecord extends FirestoreRecord {
  SatsangTitleRecord._(
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
      FirebaseFirestore.instance.collection('satsang_title');

  static Stream<SatsangTitleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SatsangTitleRecord.fromSnapshot(s));

  static Future<SatsangTitleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SatsangTitleRecord.fromSnapshot(s));

  static SatsangTitleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SatsangTitleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SatsangTitleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SatsangTitleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SatsangTitleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SatsangTitleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSatsangTitleRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class SatsangTitleRecordDocumentEquality
    implements Equality<SatsangTitleRecord> {
  const SatsangTitleRecordDocumentEquality();

  @override
  bool equals(SatsangTitleRecord? e1, SatsangTitleRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(SatsangTitleRecord? e) => const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is SatsangTitleRecord;
}
