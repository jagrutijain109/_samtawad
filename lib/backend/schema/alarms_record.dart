import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlarmsRecord extends FirestoreRecord {
  AlarmsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "song_name" field.
  String? _songName;
  String get songName => _songName ?? '';
  bool hasSongName() => _songName != null;

  // "song_url" field.
  String? _songUrl;
  String get songUrl => _songUrl ?? '';
  bool hasSongUrl() => _songUrl != null;

  // "audio_url" field.
  String? _audioUrl;
  String get audioUrl => _audioUrl ?? '';
  bool hasAudioUrl() => _audioUrl != null;

  void _initializeFields() {
    _songName = snapshotData['song_name'] as String?;
    _songUrl = snapshotData['song_url'] as String?;
    _audioUrl = snapshotData['audio_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alarms');

  static Stream<AlarmsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlarmsRecord.fromSnapshot(s));

  static Future<AlarmsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlarmsRecord.fromSnapshot(s));

  static AlarmsRecord fromSnapshot(DocumentSnapshot snapshot) => AlarmsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlarmsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlarmsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlarmsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlarmsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlarmsRecordData({
  String? songName,
  String? songUrl,
  String? audioUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'song_name': songName,
      'song_url': songUrl,
      'audio_url': audioUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlarmsRecordDocumentEquality implements Equality<AlarmsRecord> {
  const AlarmsRecordDocumentEquality();

  @override
  bool equals(AlarmsRecord? e1, AlarmsRecord? e2) {
    return e1?.songName == e2?.songName &&
        e1?.songUrl == e2?.songUrl &&
        e1?.audioUrl == e2?.audioUrl;
  }

  @override
  int hash(AlarmsRecord? e) =>
      const ListEquality().hash([e?.songName, e?.songUrl, e?.audioUrl]);

  @override
  bool isValidKey(Object? o) => o is AlarmsRecord;
}
