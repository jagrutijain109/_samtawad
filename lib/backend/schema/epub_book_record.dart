import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EpubBookRecord extends FirestoreRecord {
  EpubBookRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "epubBookurl" field.
  String? _epubBookurl;
  String get epubBookurl => _epubBookurl ?? '';
  bool hasEpubBookurl() => _epubBookurl != null;

  // "epubBookName" field.
  String? _epubBookName;
  String get epubBookName => _epubBookName ?? '';
  bool hasEpubBookName() => _epubBookName != null;

  // "create_time" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "epubBook_Image" field.
  String? _epubBookImage;
  String get epubBookImage => _epubBookImage ?? '';
  bool hasEpubBookImage() => _epubBookImage != null;

  // "auther_name" field.
  String? _autherName;
  String get autherName => _autherName ?? '';
  bool hasAutherName() => _autherName != null;

  void _initializeFields() {
    _epubBookurl = snapshotData['epubBookurl'] as String?;
    _epubBookName = snapshotData['epubBookName'] as String?;
    _createTime = snapshotData['create_time'] as DateTime?;
    _epubBookImage = snapshotData['epubBook_Image'] as String?;
    _autherName = snapshotData['auther_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('EpubBook');

  static Stream<EpubBookRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EpubBookRecord.fromSnapshot(s));

  static Future<EpubBookRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EpubBookRecord.fromSnapshot(s));

  static EpubBookRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EpubBookRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EpubBookRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EpubBookRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EpubBookRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EpubBookRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEpubBookRecordData({
  String? epubBookurl,
  String? epubBookName,
  DateTime? createTime,
  String? epubBookImage,
  String? autherName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'epubBookurl': epubBookurl,
      'epubBookName': epubBookName,
      'create_time': createTime,
      'epubBook_Image': epubBookImage,
      'auther_name': autherName,
    }.withoutNulls,
  );

  return firestoreData;
}

class EpubBookRecordDocumentEquality implements Equality<EpubBookRecord> {
  const EpubBookRecordDocumentEquality();

  @override
  bool equals(EpubBookRecord? e1, EpubBookRecord? e2) {
    return e1?.epubBookurl == e2?.epubBookurl &&
        e1?.epubBookName == e2?.epubBookName &&
        e1?.createTime == e2?.createTime &&
        e1?.epubBookImage == e2?.epubBookImage &&
        e1?.autherName == e2?.autherName;
  }

  @override
  int hash(EpubBookRecord? e) => const ListEquality().hash([
        e?.epubBookurl,
        e?.epubBookName,
        e?.createTime,
        e?.epubBookImage,
        e?.autherName
      ]);

  @override
  bool isValidKey(Object? o) => o is EpubBookRecord;
}
