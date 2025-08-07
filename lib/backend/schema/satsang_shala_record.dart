import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SatsangShalaRecord extends FirestoreRecord {
  SatsangShalaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "satsang_Shala_name" field.
  String? _satsangShalaName;
  String get satsangShalaName => _satsangShalaName ?? '';
  bool hasSatsangShalaName() => _satsangShalaName != null;

  // "satsang_shala_address" field.
  String? _satsangShalaAddress;
  String get satsangShalaAddress => _satsangShalaAddress ?? '';
  bool hasSatsangShalaAddress() => _satsangShalaAddress != null;

  // "satsang_shala_image" field.
  String? _satsangShalaImage;
  String get satsangShalaImage => _satsangShalaImage ?? '';
  bool hasSatsangShalaImage() => _satsangShalaImage != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "contact_info" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "strt_date" field.
  DateTime? _strtDate;
  DateTime? get strtDate => _strtDate;
  bool hasStrtDate() => _strtDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

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
    _satsangShalaName = snapshotData['satsang_Shala_name'] as String?;
    _satsangShalaAddress = snapshotData['satsang_shala_address'] as String?;
    _satsangShalaImage = snapshotData['satsang_shala_image'] as String?;
    _time = snapshotData['time'] as String?;
    _contactInfo = snapshotData['contact_info'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _strtDate = snapshotData['strt_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _country = snapshotData['country'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('satsang_shala');

  static Stream<SatsangShalaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SatsangShalaRecord.fromSnapshot(s));

  static Future<SatsangShalaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SatsangShalaRecord.fromSnapshot(s));

  static SatsangShalaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SatsangShalaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SatsangShalaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SatsangShalaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SatsangShalaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SatsangShalaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSatsangShalaRecordData({
  String? satsangShalaName,
  String? satsangShalaAddress,
  String? satsangShalaImage,
  String? time,
  String? contactInfo,
  DateTime? createdTime,
  DateTime? strtDate,
  DateTime? endDate,
  LatLng? location,
  String? city,
  String? state,
  String? country,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'satsang_Shala_name': satsangShalaName,
      'satsang_shala_address': satsangShalaAddress,
      'satsang_shala_image': satsangShalaImage,
      'time': time,
      'contact_info': contactInfo,
      'created_time': createdTime,
      'strt_date': strtDate,
      'end_date': endDate,
      'location': location,
      'city': city,
      'state': state,
      'country': country,
    }.withoutNulls,
  );

  return firestoreData;
}

class SatsangShalaRecordDocumentEquality
    implements Equality<SatsangShalaRecord> {
  const SatsangShalaRecordDocumentEquality();

  @override
  bool equals(SatsangShalaRecord? e1, SatsangShalaRecord? e2) {
    return e1?.satsangShalaName == e2?.satsangShalaName &&
        e1?.satsangShalaAddress == e2?.satsangShalaAddress &&
        e1?.satsangShalaImage == e2?.satsangShalaImage &&
        e1?.time == e2?.time &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.createdTime == e2?.createdTime &&
        e1?.strtDate == e2?.strtDate &&
        e1?.endDate == e2?.endDate &&
        e1?.location == e2?.location &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.country == e2?.country;
  }

  @override
  int hash(SatsangShalaRecord? e) => const ListEquality().hash([
        e?.satsangShalaName,
        e?.satsangShalaAddress,
        e?.satsangShalaImage,
        e?.time,
        e?.contactInfo,
        e?.createdTime,
        e?.strtDate,
        e?.endDate,
        e?.location,
        e?.city,
        e?.state,
        e?.country
      ]);

  @override
  bool isValidKey(Object? o) => o is SatsangShalaRecord;
}
