import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InpersonAshramDataRecord extends FirestoreRecord {
  InpersonAshramDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "aashram_name" field.
  String? _aashramName;
  String get aashramName => _aashramName ?? '';
  bool hasAashramName() => _aashramName != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "timing" field.
  String? _timing;
  String get timing => _timing ?? '';
  bool hasTiming() => _timing != null;

  // "imagelink" field.
  String? _imagelink;
  String get imagelink => _imagelink ?? '';
  bool hasImagelink() => _imagelink != null;

  // "aashram_id" field.
  DocumentReference? _aashramId;
  DocumentReference? get aashramId => _aashramId;
  bool hasAashramId() => _aashramId != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

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

  void _initializeFields() {
    _address = snapshotData['address'] as String?;
    _fromDate = snapshotData['from_date'] as DateTime?;
    _toDate = snapshotData['to_date'] as DateTime?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _aashramName = snapshotData['aashram_name'] as String?;
    _information = snapshotData['information'] as String?;
    _timing = snapshotData['timing'] as String?;
    _imagelink = snapshotData['imagelink'] as String?;
    _aashramId = snapshotData['aashram_id'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inperson_ashram_data');

  static Stream<InpersonAshramDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InpersonAshramDataRecord.fromSnapshot(s));

  static Future<InpersonAshramDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InpersonAshramDataRecord.fromSnapshot(s));

  static InpersonAshramDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InpersonAshramDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InpersonAshramDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InpersonAshramDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InpersonAshramDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InpersonAshramDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInpersonAshramDataRecordData({
  String? address,
  DateTime? fromDate,
  DateTime? toDate,
  DateTime? createdTime,
  String? contactInfo,
  String? aashramName,
  String? information,
  String? timing,
  String? imagelink,
  DocumentReference? aashramId,
  LatLng? location,
  String? city,
  String? state,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'address': address,
      'from_date': fromDate,
      'to_date': toDate,
      'created_time': createdTime,
      'contact_info': contactInfo,
      'aashram_name': aashramName,
      'information': information,
      'timing': timing,
      'imagelink': imagelink,
      'aashram_id': aashramId,
      'location': location,
      'city': city,
      'state': state,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class InpersonAshramDataRecordDocumentEquality
    implements Equality<InpersonAshramDataRecord> {
  const InpersonAshramDataRecordDocumentEquality();

  @override
  bool equals(InpersonAshramDataRecord? e1, InpersonAshramDataRecord? e2) {
    return e1?.address == e2?.address &&
        e1?.fromDate == e2?.fromDate &&
        e1?.toDate == e2?.toDate &&
        e1?.createdTime == e2?.createdTime &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.aashramName == e2?.aashramName &&
        e1?.information == e2?.information &&
        e1?.timing == e2?.timing &&
        e1?.imagelink == e2?.imagelink &&
        e1?.aashramId == e2?.aashramId &&
        e1?.location == e2?.location &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.country == e2?.country;
  }

  @override
  int hash(InpersonAshramDataRecord? e) => const ListEquality().hash([
        e?.address,
        e?.fromDate,
        e?.toDate,
        e?.createdTime,
        e?.contactInfo,
        e?.aashramName,
        e?.information,
        e?.timing,
        e?.imagelink,
        e?.aashramId,
        e?.location,
        e?.city,
        e?.state,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is InpersonAshramDataRecord;
}
