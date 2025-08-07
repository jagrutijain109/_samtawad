import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnlineSatsangDataRecord extends FirestoreRecord {
  OnlineSatsangDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "from_date" field.
  DateTime? _fromDate;
  DateTime? get fromDate => _fromDate;
  bool hasFromDate() => _fromDate != null;

  // "to_date" field.
  DateTime? _toDate;
  DateTime? get toDate => _toDate;
  bool hasToDate() => _toDate != null;

  // "satsang_name" field.
  String? _satsangName;
  String get satsangName => _satsangName ?? '';
  bool hasSatsangName() => _satsangName != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "online_satsang_id" field.
  String? _onlineSatsangId;
  String get onlineSatsangId => _onlineSatsangId ?? '';
  bool hasOnlineSatsangId() => _onlineSatsangId != null;

  // "bookmark" field.
  bool? _bookmark;
  bool get bookmark => _bookmark ?? false;
  bool hasBookmark() => _bookmark != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "reminder" field.
  bool? _reminder;
  bool get reminder => _reminder ?? false;
  bool hasReminder() => _reminder != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "audio_link" field.
  String? _audioLink;
  String get audioLink => _audioLink ?? '';
  bool hasAudioLink() => _audioLink != null;

  // "bookmark_by" field.
  List<DocumentReference>? _bookmarkBy;
  List<DocumentReference> get bookmarkBy => _bookmarkBy ?? const [];
  bool hasBookmarkBy() => _bookmarkBy != null;

  // "remainder_by" field.
  List<DocumentReference>? _remainderBy;
  List<DocumentReference> get remainderBy => _remainderBy ?? const [];
  bool hasRemainderBy() => _remainderBy != null;

  void _initializeFields() {
    _link = snapshotData['link'] as String?;
    _fromDate = snapshotData['from_date'] as DateTime?;
    _toDate = snapshotData['to_date'] as DateTime?;
    _satsangName = snapshotData['satsang_name'] as String?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _time = snapshotData['time'] as String?;
    _onlineSatsangId = snapshotData['online_satsang_id'] as String?;
    _bookmark = snapshotData['bookmark'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _reminder = snapshotData['reminder'] as bool?;
    _id = snapshotData['id'] as String?;
    _audioLink = snapshotData['audio_link'] as String?;
    _bookmarkBy = getDataList(snapshotData['bookmark_by']);
    _remainderBy = getDataList(snapshotData['remainder_by']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('online_satsang_data');

  static Stream<OnlineSatsangDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnlineSatsangDataRecord.fromSnapshot(s));

  static Future<OnlineSatsangDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OnlineSatsangDataRecord.fromSnapshot(s));

  static OnlineSatsangDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnlineSatsangDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnlineSatsangDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnlineSatsangDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnlineSatsangDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnlineSatsangDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnlineSatsangDataRecordData({
  String? link,
  DateTime? fromDate,
  DateTime? toDate,
  String? satsangName,
  String? contactInfo,
  String? time,
  String? onlineSatsangId,
  bool? bookmark,
  DateTime? createdTime,
  bool? reminder,
  String? id,
  String? audioLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'link': link,
      'from_date': fromDate,
      'to_date': toDate,
      'satsang_name': satsangName,
      'contact_info': contactInfo,
      'time': time,
      'online_satsang_id': onlineSatsangId,
      'bookmark': bookmark,
      'created_time': createdTime,
      'reminder': reminder,
      'id': id,
      'audio_link': audioLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnlineSatsangDataRecordDocumentEquality
    implements Equality<OnlineSatsangDataRecord> {
  const OnlineSatsangDataRecordDocumentEquality();

  @override
  bool equals(OnlineSatsangDataRecord? e1, OnlineSatsangDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.link == e2?.link &&
        e1?.fromDate == e2?.fromDate &&
        e1?.toDate == e2?.toDate &&
        e1?.satsangName == e2?.satsangName &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.time == e2?.time &&
        e1?.onlineSatsangId == e2?.onlineSatsangId &&
        e1?.bookmark == e2?.bookmark &&
        e1?.createdTime == e2?.createdTime &&
        e1?.reminder == e2?.reminder &&
        e1?.id == e2?.id &&
        e1?.audioLink == e2?.audioLink &&
        listEquality.equals(e1?.bookmarkBy, e2?.bookmarkBy) &&
        listEquality.equals(e1?.remainderBy, e2?.remainderBy);
  }

  @override
  int hash(OnlineSatsangDataRecord? e) => const ListEquality().hash([
        e?.link,
        e?.fromDate,
        e?.toDate,
        e?.satsangName,
        e?.contactInfo,
        e?.time,
        e?.onlineSatsangId,
        e?.bookmark,
        e?.createdTime,
        e?.reminder,
        e?.id,
        e?.audioLink,
        e?.bookmarkBy,
        e?.remainderBy
      ]);

  @override
  bool isValidKey(Object? o) => o is OnlineSatsangDataRecord;
}
