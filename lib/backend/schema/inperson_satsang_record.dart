import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InpersonSatsangRecord extends FirestoreRecord {
  InpersonSatsangRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "satsangtitle" field.
  String? _satsangtitle;
  String get satsangtitle => _satsangtitle ?? '';
  bool hasSatsangtitle() => _satsangtitle != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "contactinfo" field.
  String? _contactinfo;
  String get contactinfo => _contactinfo ?? '';
  bool hasContactinfo() => _contactinfo != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "inperson_satsang_id" field.
  String? _inpersonSatsangId;
  String get inpersonSatsangId => _inpersonSatsangId ?? '';
  bool hasInpersonSatsangId() => _inpersonSatsangId != null;

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

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "bookmark_by" field.
  List<DocumentReference>? _bookmarkBy;
  List<DocumentReference> get bookmarkBy => _bookmarkBy ?? const [];
  bool hasBookmarkBy() => _bookmarkBy != null;

  // "remainder_by" field.
  List<DocumentReference>? _remainderBy;
  List<DocumentReference> get remainderBy => _remainderBy ?? const [];
  bool hasRemainderBy() => _remainderBy != null;

  void _initializeFields() {
    _satsangtitle = snapshotData['satsangtitle'] as String?;
    _address = snapshotData['address'] as String?;
    _contactinfo = snapshotData['contactinfo'] as String?;
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _note = snapshotData['note'] as String?;
    _inpersonSatsangId = snapshotData['inperson_satsang_id'] as String?;
    _bookmark = snapshotData['bookmark'] as bool?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _reminder = snapshotData['reminder'] as bool?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _country = snapshotData['country'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _id = snapshotData['id'] as String?;
    _bookmarkBy = getDataList(snapshotData['bookmark_by']);
    _remainderBy = getDataList(snapshotData['remainder_by']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inperson_satsang');

  static Stream<InpersonSatsangRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InpersonSatsangRecord.fromSnapshot(s));

  static Future<InpersonSatsangRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InpersonSatsangRecord.fromSnapshot(s));

  static InpersonSatsangRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InpersonSatsangRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InpersonSatsangRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InpersonSatsangRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InpersonSatsangRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InpersonSatsangRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInpersonSatsangRecordData({
  String? satsangtitle,
  String? address,
  String? contactinfo,
  DateTime? startDate,
  DateTime? endDate,
  String? note,
  String? inpersonSatsangId,
  bool? bookmark,
  DateTime? createdTime,
  bool? reminder,
  String? city,
  String? state,
  String? country,
  LatLng? location,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'satsangtitle': satsangtitle,
      'address': address,
      'contactinfo': contactinfo,
      'start_date': startDate,
      'end_date': endDate,
      'note': note,
      'inperson_satsang_id': inpersonSatsangId,
      'bookmark': bookmark,
      'created_time': createdTime,
      'reminder': reminder,
      'city': city,
      'state': state,
      'country': country,
      'location': location,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class InpersonSatsangRecordDocumentEquality
    implements Equality<InpersonSatsangRecord> {
  const InpersonSatsangRecordDocumentEquality();

  @override
  bool equals(InpersonSatsangRecord? e1, InpersonSatsangRecord? e2) {
    const listEquality = ListEquality();
    return e1?.satsangtitle == e2?.satsangtitle &&
        e1?.address == e2?.address &&
        e1?.contactinfo == e2?.contactinfo &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.note == e2?.note &&
        e1?.inpersonSatsangId == e2?.inpersonSatsangId &&
        e1?.bookmark == e2?.bookmark &&
        e1?.createdTime == e2?.createdTime &&
        e1?.reminder == e2?.reminder &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.country == e2?.country &&
        e1?.location == e2?.location &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.bookmarkBy, e2?.bookmarkBy) &&
        listEquality.equals(e1?.remainderBy, e2?.remainderBy);
  }

  @override
  int hash(InpersonSatsangRecord? e) => const ListEquality().hash([
        e?.satsangtitle,
        e?.address,
        e?.contactinfo,
        e?.startDate,
        e?.endDate,
        e?.note,
        e?.inpersonSatsangId,
        e?.bookmark,
        e?.createdTime,
        e?.reminder,
        e?.city,
        e?.state,
        e?.country,
        e?.location,
        e?.id,
        e?.bookmarkBy,
        e?.remainderBy
      ]);

  @override
  bool isValidKey(Object? o) => o is InpersonSatsangRecord;
}
