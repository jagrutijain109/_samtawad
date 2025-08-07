import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurukalinSatsangTitleRecord extends FirestoreRecord {
  GurukalinSatsangTitleRecord._(
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
      FirebaseFirestore.instance.collection('gurukalin_satsang_title');

  static Stream<GurukalinSatsangTitleRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GurukalinSatsangTitleRecord.fromSnapshot(s));

  static Future<GurukalinSatsangTitleRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GurukalinSatsangTitleRecord.fromSnapshot(s));

  static GurukalinSatsangTitleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GurukalinSatsangTitleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurukalinSatsangTitleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurukalinSatsangTitleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurukalinSatsangTitleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurukalinSatsangTitleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurukalinSatsangTitleRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurukalinSatsangTitleRecordDocumentEquality
    implements Equality<GurukalinSatsangTitleRecord> {
  const GurukalinSatsangTitleRecordDocumentEquality();

  @override
  bool equals(
      GurukalinSatsangTitleRecord? e1, GurukalinSatsangTitleRecord? e2) {
    return e1?.title == e2?.title;
  }

  @override
  int hash(GurukalinSatsangTitleRecord? e) =>
      const ListEquality().hash([e?.title]);

  @override
  bool isValidKey(Object? o) => o is GurukalinSatsangTitleRecord;
}
