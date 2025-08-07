import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlarmCollectionRecord extends FirestoreRecord {
  AlarmCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userid" field.
  String? _userid;
  String get userid => _userid ?? '';
  bool hasUserid() => _userid != null;

  // "alarm_time" field.
  DateTime? _alarmTime;
  DateTime? get alarmTime => _alarmTime;
  bool hasAlarmTime() => _alarmTime != null;

  // "song_name" field.
  String? _songName;
  String get songName => _songName ?? '';
  bool hasSongName() => _songName != null;

  // "song_url" field.
  String? _songUrl;
  String get songUrl => _songUrl ?? '';
  bool hasSongUrl() => _songUrl != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  void _initializeFields() {
    _userid = snapshotData['userid'] as String?;
    _alarmTime = snapshotData['alarm_time'] as DateTime?;
    _songName = snapshotData['song_name'] as String?;
    _songUrl = snapshotData['song_url'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _title = snapshotData['title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alarm_collection');

  static Stream<AlarmCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlarmCollectionRecord.fromSnapshot(s));

  static Future<AlarmCollectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlarmCollectionRecord.fromSnapshot(s));

  static AlarmCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlarmCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlarmCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlarmCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlarmCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlarmCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlarmCollectionRecordData({
  String? userid,
  DateTime? alarmTime,
  String? songName,
  String? songUrl,
  bool? isActive,
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userid': userid,
      'alarm_time': alarmTime,
      'song_name': songName,
      'song_url': songUrl,
      'is_active': isActive,
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlarmCollectionRecordDocumentEquality
    implements Equality<AlarmCollectionRecord> {
  const AlarmCollectionRecordDocumentEquality();

  @override
  bool equals(AlarmCollectionRecord? e1, AlarmCollectionRecord? e2) {
    return e1?.userid == e2?.userid &&
        e1?.alarmTime == e2?.alarmTime &&
        e1?.songName == e2?.songName &&
        e1?.songUrl == e2?.songUrl &&
        e1?.isActive == e2?.isActive &&
        e1?.title == e2?.title;
  }

  @override
  int hash(AlarmCollectionRecord? e) => const ListEquality().hash([
        e?.userid,
        e?.alarmTime,
        e?.songName,
        e?.songUrl,
        e?.isActive,
        e?.title
      ]);

  @override
  bool isValidKey(Object? o) => o is AlarmCollectionRecord;
}
