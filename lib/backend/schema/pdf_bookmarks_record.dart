import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PdfBookmarksRecord extends FirestoreRecord {
  PdfBookmarksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "pdfUrl" field.
  String? _pdfUrl;
  String get pdfUrl => _pdfUrl ?? '';
  bool hasPdfUrl() => _pdfUrl != null;

  // "page" field.
  String? _page;
  String get page => _page ?? '';
  bool hasPage() => _page != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _pdfUrl = snapshotData['pdfUrl'] as String?;
    _page = snapshotData['page'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pdfBookmarks');

  static Stream<PdfBookmarksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PdfBookmarksRecord.fromSnapshot(s));

  static Future<PdfBookmarksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PdfBookmarksRecord.fromSnapshot(s));

  static PdfBookmarksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PdfBookmarksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PdfBookmarksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PdfBookmarksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PdfBookmarksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PdfBookmarksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPdfBookmarksRecordData({
  String? userId,
  String? pdfUrl,
  String? page,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'pdfUrl': pdfUrl,
      'page': page,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class PdfBookmarksRecordDocumentEquality
    implements Equality<PdfBookmarksRecord> {
  const PdfBookmarksRecordDocumentEquality();

  @override
  bool equals(PdfBookmarksRecord? e1, PdfBookmarksRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.pdfUrl == e2?.pdfUrl &&
        e1?.page == e2?.page &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(PdfBookmarksRecord? e) =>
      const ListEquality().hash([e?.userId, e?.pdfUrl, e?.page, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is PdfBookmarksRecord;
}
