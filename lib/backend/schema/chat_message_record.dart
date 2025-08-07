import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageRecord extends FirestoreRecord {
  ChatMessageRecord._(
      DocumentReference reference,
      Map<String, dynamic> data,
      ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "uidOfSender" field.
  DocumentReference? _uidOfSender;
  DocumentReference? get uidOfSender => _uidOfSender;
  bool hasUidOfSender() => _uidOfSender != null;

  // "nameofSender" field.
  String? _nameofSender;
  String get nameofSender => _nameofSender ?? '';
  bool hasNameofSender() => _nameofSender != null;

  // "filename" field.
  String? _filename;
  String get filename => _filename ?? '';
  bool hasFilename() => _filename != null;

  // "file_url" field.
  String? _fileUrl;
  String get fileUrl => _fileUrl ?? '';
  bool hasFileUrl() => _fileUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _uidOfSender = snapshotData['uidOfSender'] as DocumentReference?;
    _nameofSender = snapshotData['nameofSender'] as String?;
    _filename = snapshotData['filename'] as String?;
    _fileUrl = snapshotData['file_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chatMessage')
          : FirebaseFirestore.instance.collectionGroup('chatMessage');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chatMessage').doc(id);

  static Stream<ChatMessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatMessageRecord.fromSnapshot(s));

  static Future<ChatMessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatMessageRecord.fromSnapshot(s));

  static ChatMessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatMessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatMessageRecord getDocumentFromData(
      Map<String, dynamic> data,
      DocumentReference reference,
      ) =>
      ChatMessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatMessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatMessageRecord &&
          reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatMessageRecordData({
  String? message,
  DateTime? timeStamp,
  DocumentReference? uidOfSender,
  String? nameofSender,
  String? filename,
  String? fileUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'timeStamp': timeStamp,
      'uidOfSender': uidOfSender,
      'nameofSender': nameofSender,
      'filename': filename,
      'file_url': fileUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatMessageRecordDocumentEquality implements Equality<ChatMessageRecord> {
  const ChatMessageRecordDocumentEquality();

  @override
  bool equals(ChatMessageRecord? e1, ChatMessageRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.uidOfSender == e2?.uidOfSender &&
        e1?.nameofSender == e2?.nameofSender &&
        e1?.filename == e2?.filename &&
        e1?.fileUrl == e2?.fileUrl;
  }

  @override
  int hash(ChatMessageRecord? e) => const ListEquality().hash([
    e?.message,
    e?.timeStamp,
    e?.uidOfSender,
    e?.nameofSender,
    e?.filename,
    e?.fileUrl
  ]);

  @override
  bool isValidKey(Object? o) => o is ChatMessageRecord;
}
