import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnlineSatsangBookmarkRecord extends FirestoreRecord {
  OnlineSatsangBookmarkRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "inperson_aashram_id" field.
  String? _inpersonAashramId;
  String get inpersonAashramId => _inpersonAashramId ?? '';
  bool hasInpersonAashramId() => _inpersonAashramId != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "from_date" field.
  DateTime? _fromDate;
  DateTime? get fromDate => _fromDate;
  bool hasFromDate() => _fromDate != null;

  // "to_date" field.
  DateTime? _toDate;
  DateTime? get toDate => _toDate;
  bool hasToDate() => _toDate != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as String?;
    _inpersonAashramId = snapshotData['inperson_aashram_id'] as String?;
    _address = snapshotData['address'] as String?;
    _fromDate = snapshotData['from_date'] as DateTime?;
    _toDate = snapshotData['to_date'] as DateTime?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('online_satsang_bookmark');

  static Stream<OnlineSatsangBookmarkRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => OnlineSatsangBookmarkRecord.fromSnapshot(s));

  static Future<OnlineSatsangBookmarkRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OnlineSatsangBookmarkRecord.fromSnapshot(s));

  static OnlineSatsangBookmarkRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnlineSatsangBookmarkRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnlineSatsangBookmarkRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnlineSatsangBookmarkRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnlineSatsangBookmarkRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnlineSatsangBookmarkRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnlineSatsangBookmarkRecordData({
  String? userId,
  String? inpersonAashramId,
  String? address,
  DateTime? fromDate,
  DateTime? toDate,
  String? contactInfo,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'inperson_aashram_id': inpersonAashramId,
      'address': address,
      'from_date': fromDate,
      'to_date': toDate,
      'contact_info': contactInfo,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnlineSatsangBookmarkRecordDocumentEquality
    implements Equality<OnlineSatsangBookmarkRecord> {
  const OnlineSatsangBookmarkRecordDocumentEquality();

  @override
  bool equals(
      OnlineSatsangBookmarkRecord? e1, OnlineSatsangBookmarkRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.inpersonAashramId == e2?.inpersonAashramId &&
        e1?.address == e2?.address &&
        e1?.fromDate == e2?.fromDate &&
        e1?.toDate == e2?.toDate &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(OnlineSatsangBookmarkRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.inpersonAashramId,
        e?.address,
        e?.fromDate,
        e?.toDate,
        e?.contactInfo,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is OnlineSatsangBookmarkRecord;
}
