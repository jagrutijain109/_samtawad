import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurjiiImageCopyRecord extends FirestoreRecord {
  GurjiiImageCopyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  bool hasHeight() => _height != null;

  // "width" field.
  double? _width;
  double get width => _width ?? 0.0;
  bool hasWidth() => _width != null;

  void _initializeFields() {
    _images = snapshotData['images'] as String?;
    _information = snapshotData['information'] as String?;
    _tags = snapshotData['tags'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _height = castToType<double>(snapshotData['height']);
    _width = castToType<double>(snapshotData['width']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gurjii_image_copy');

  static Stream<GurjiiImageCopyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GurjiiImageCopyRecord.fromSnapshot(s));

  static Future<GurjiiImageCopyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GurjiiImageCopyRecord.fromSnapshot(s));

  static GurjiiImageCopyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GurjiiImageCopyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurjiiImageCopyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurjiiImageCopyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurjiiImageCopyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurjiiImageCopyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurjiiImageCopyRecordData({
  String? images,
  String? information,
  String? tags,
  DateTime? createdTime,
  double? height,
  double? width,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'images': images,
      'information': information,
      'tags': tags,
      'created_time': createdTime,
      'height': height,
      'width': width,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurjiiImageCopyRecordDocumentEquality
    implements Equality<GurjiiImageCopyRecord> {
  const GurjiiImageCopyRecordDocumentEquality();

  @override
  bool equals(GurjiiImageCopyRecord? e1, GurjiiImageCopyRecord? e2) {
    return e1?.images == e2?.images &&
        e1?.information == e2?.information &&
        e1?.tags == e2?.tags &&
        e1?.createdTime == e2?.createdTime &&
        e1?.height == e2?.height &&
        e1?.width == e2?.width;
  }

  @override
  int hash(GurjiiImageCopyRecord? e) => const ListEquality().hash([
        e?.images,
        e?.information,
        e?.tags,
        e?.createdTime,
        e?.height,
        e?.width
      ]);

  @override
  bool isValidKey(Object? o) => o is GurjiiImageCopyRecord;
}
