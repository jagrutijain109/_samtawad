import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarkRecord extends FirestoreRecord {
  BookmarkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "form_date" field.
  DateTime? _formDate;
  DateTime? get formDate => _formDate;
  bool hasFormDate() => _formDate != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "satsang_name" field.
  String? _satsangName;
  String get satsangName => _satsangName ?? '';
  bool hasSatsangName() => _satsangName != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "created_time" field.
  String? _createdTime;
  String get createdTime => _createdTime ?? '';
  bool hasCreatedTime() => _createdTime != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "item_id" field.
  String? _itemId;
  String get itemId => _itemId ?? '';
  bool hasItemId() => _itemId != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _link = snapshotData['link'] as String?;
    _address = snapshotData['address'] as String?;
    _formDate = snapshotData['form_date'] as DateTime?;
    _category = snapshotData['category'] as String?;
    _satsangName = snapshotData['satsang_name'] as String?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _createdTime = snapshotData['created_time'] as String?;
    _status = snapshotData['status'] as bool?;
    _id = snapshotData['id'] as String?;
    _itemId = snapshotData['item_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookmark');

  static Stream<BookmarkRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarkRecord.fromSnapshot(s));

  static Future<BookmarkRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarkRecord.fromSnapshot(s));

  static BookmarkRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarkRecordData({
  String? userId,
  String? link,
  String? address,
  DateTime? formDate,
  String? category,
  String? satsangName,
  String? contactInfo,
  DateTime? endDate,
  String? createdTime,
  bool? status,
  String? id,
  String? itemId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'link': link,
      'address': address,
      'form_date': formDate,
      'category': category,
      'satsang_name': satsangName,
      'contact_info': contactInfo,
      'end_date': endDate,
      'created_time': createdTime,
      'status': status,
      'id': id,
      'item_id': itemId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarkRecordDocumentEquality implements Equality<BookmarkRecord> {
  const BookmarkRecordDocumentEquality();

  @override
  bool equals(BookmarkRecord? e1, BookmarkRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.link == e2?.link &&
        e1?.address == e2?.address &&
        e1?.formDate == e2?.formDate &&
        e1?.category == e2?.category &&
        e1?.satsangName == e2?.satsangName &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.endDate == e2?.endDate &&
        e1?.createdTime == e2?.createdTime &&
        e1?.status == e2?.status &&
        e1?.id == e2?.id &&
        e1?.itemId == e2?.itemId;
  }

  @override
  int hash(BookmarkRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.link,
        e?.address,
        e?.formDate,
        e?.category,
        e?.satsangName,
        e?.contactInfo,
        e?.endDate,
        e?.createdTime,
        e?.status,
        e?.id,
        e?.itemId
      ]);

  @override
  bool isValidKey(Object? o) => o is BookmarkRecord;
}
