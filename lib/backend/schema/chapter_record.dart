import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChapterRecord extends FirestoreRecord {
  ChapterRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chapter_number" field.
  int? _chapterNumber;
  int get chapterNumber => _chapterNumber ?? 0;
  bool hasChapterNumber() => _chapterNumber != null;

  // "chapter_name" field.
  String? _chapterName;
  String get chapterName => _chapterName ?? '';
  bool hasChapterName() => _chapterName != null;

  // "edditional_information" field.
  String? _edditionalInformation;
  String get edditionalInformation => _edditionalInformation ?? '';
  bool hasEdditionalInformation() => _edditionalInformation != null;

  // "create_time" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "end_page_no" field.
  int? _endPageNo;
  int get endPageNo => _endPageNo ?? 0;
  bool hasEndPageNo() => _endPageNo != null;

  // "start_page_no" field.
  int? _startPageNo;
  int get startPageNo => _startPageNo ?? 0;
  bool hasStartPageNo() => _startPageNo != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _chapterNumber = castToType<int>(snapshotData['chapter_number']);
    _chapterName = snapshotData['chapter_name'] as String?;
    _edditionalInformation = snapshotData['edditional_information'] as String?;
    _createTime = snapshotData['create_time'] as DateTime?;
    _endPageNo = castToType<int>(snapshotData['end_page_no']);
    _startPageNo = castToType<int>(snapshotData['start_page_no']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('chapter')
          : FirebaseFirestore.instance.collectionGroup('chapter');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('chapter').doc(id);

  static Stream<ChapterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChapterRecord.fromSnapshot(s));

  static Future<ChapterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChapterRecord.fromSnapshot(s));

  static ChapterRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChapterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChapterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChapterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChapterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChapterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChapterRecordData({
  int? chapterNumber,
  String? chapterName,
  String? edditionalInformation,
  DateTime? createTime,
  int? endPageNo,
  int? startPageNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chapter_number': chapterNumber,
      'chapter_name': chapterName,
      'edditional_information': edditionalInformation,
      'create_time': createTime,
      'end_page_no': endPageNo,
      'start_page_no': startPageNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChapterRecordDocumentEquality implements Equality<ChapterRecord> {
  const ChapterRecordDocumentEquality();

  @override
  bool equals(ChapterRecord? e1, ChapterRecord? e2) {
    return e1?.chapterNumber == e2?.chapterNumber &&
        e1?.chapterName == e2?.chapterName &&
        e1?.edditionalInformation == e2?.edditionalInformation &&
        e1?.createTime == e2?.createTime &&
        e1?.endPageNo == e2?.endPageNo &&
        e1?.startPageNo == e2?.startPageNo;
  }

  @override
  int hash(ChapterRecord? e) => const ListEquality().hash([
        e?.chapterNumber,
        e?.chapterName,
        e?.edditionalInformation,
        e?.createTime,
        e?.endPageNo,
        e?.startPageNo
      ]);

  @override
  bool isValidKey(Object? o) => o is ChapterRecord;
}
