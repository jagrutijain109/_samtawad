import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotesRecord extends FirestoreRecord {
  NotesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "noteText" field.
  String? _noteText;
  String get noteText => _noteText ?? '';
  bool hasNoteText() => _noteText != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "bookId" field.
  String? _bookId;
  String get bookId => _bookId ?? '';
  bool hasBookId() => _bookId != null;

  // "pageNumber" field.
  int? _pageNumber;
  int get pageNumber => _pageNumber ?? 0;
  bool hasPageNumber() => _pageNumber != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _noteText = snapshotData['noteText'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _bookId = snapshotData['bookId'] as String?;
    _pageNumber = castToType<int>(snapshotData['pageNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotesRecord.fromSnapshot(s));

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotesRecord.fromSnapshot(s));

  static NotesRecord fromSnapshot(DocumentSnapshot snapshot) => NotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotesRecordData({
  String? userId,
  String? noteText,
  DateTime? timestamp,
  String? bookId,
  int? pageNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'noteText': noteText,
      'timestamp': timestamp,
      'bookId': bookId,
      'pageNumber': pageNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotesRecordDocumentEquality implements Equality<NotesRecord> {
  const NotesRecordDocumentEquality();

  @override
  bool equals(NotesRecord? e1, NotesRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.noteText == e2?.noteText &&
        e1?.timestamp == e2?.timestamp &&
        e1?.bookId == e2?.bookId &&
        e1?.pageNumber == e2?.pageNumber;
  }

  @override
  int hash(NotesRecord? e) => const ListEquality()
      .hash([e?.userId, e?.noteText, e?.timestamp, e?.bookId, e?.pageNumber]);

  @override
  bool isValidKey(Object? o) => o is NotesRecord;
}
