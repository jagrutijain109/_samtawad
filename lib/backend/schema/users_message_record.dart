import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersMessageRecord extends FirestoreRecord {
  UsersMessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender_id" field.
  String? _senderId;
  String get senderId => _senderId ?? '';
  bool hasSenderId() => _senderId != null;

  // "receiver_id" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _senderId = snapshotData['sender_id'] as String?;
    _receiverId = snapshotData['receiver_id'] as String?;
    _message = snapshotData['message'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_message');

  static Stream<UsersMessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersMessageRecord.fromSnapshot(s));

  static Future<UsersMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersMessageRecord.fromSnapshot(s));

  static UsersMessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersMessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersMessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersMessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersMessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersMessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersMessageRecordData({
  String? senderId,
  String? receiverId,
  String? message,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender_id': senderId,
      'receiver_id': receiverId,
      'message': message,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersMessageRecordDocumentEquality
    implements Equality<UsersMessageRecord> {
  const UsersMessageRecordDocumentEquality();

  @override
  bool equals(UsersMessageRecord? e1, UsersMessageRecord? e2) {
    return e1?.senderId == e2?.senderId &&
        e1?.receiverId == e2?.receiverId &&
        e1?.message == e2?.message &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(UsersMessageRecord? e) => const ListEquality()
      .hash([e?.senderId, e?.receiverId, e?.message, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is UsersMessageRecord;
}
