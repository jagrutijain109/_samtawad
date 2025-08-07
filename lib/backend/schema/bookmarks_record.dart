import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarksRecord extends FirestoreRecord {
  BookmarksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "bookId" field.
  String? _bookId;
  String get bookId => _bookId ?? '';
  bool hasBookId() => _bookId != null;

  // "page" field.
  int? _page;
  int get page => _page ?? 0;
  bool hasPage() => _page != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _title = snapshotData['title'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _bookId = snapshotData['bookId'] as String?;
    _page = castToType<int>(snapshotData['page']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookmarks');

  static Stream<BookmarksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarksRecord.fromSnapshot(s));

  static Future<BookmarksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarksRecord.fromSnapshot(s));

  static BookmarksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarksRecordData({
  String? userId,
  String? title,
  DateTime? timestamp,
  String? bookId,
  int? page,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'title': title,
      'timestamp': timestamp,
      'bookId': bookId,
      'page': page,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarksRecordDocumentEquality implements Equality<BookmarksRecord> {
  const BookmarksRecordDocumentEquality();

  @override
  bool equals(BookmarksRecord? e1, BookmarksRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.title == e2?.title &&
        e1?.timestamp == e2?.timestamp &&
        e1?.bookId == e2?.bookId &&
        e1?.page == e2?.page;
  }

  @override
  int hash(BookmarksRecord? e) => const ListEquality()
      .hash([e?.userId, e?.title, e?.timestamp, e?.bookId, e?.page]);

  @override
  bool isValidKey(Object? o) => o is BookmarksRecord;
}
