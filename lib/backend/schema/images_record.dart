import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "images" field.
  String? _images;
  String get images => _images ?? '';
  bool hasImages() => _images != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Paragraph" field.
  String? _paragraph;
  String get paragraph => _paragraph ?? '';
  bool hasParagraph() => _paragraph != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "SubTitle" field.
  String? _subTitle;
  String get subTitle => _subTitle ?? '';
  bool hasSubTitle() => _subTitle != null;

  // "Id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _images = snapshotData['images'] as String?;
    _image = snapshotData['image'] as String?;
    _paragraph = snapshotData['Paragraph'] as String?;
    _title = snapshotData['Title'] as String?;
    _subTitle = snapshotData['SubTitle'] as String?;
    _id = castToType<int>(snapshotData['Id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('images');

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  String? images,
  String? image,
  String? paragraph,
  String? title,
  String? subTitle,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'images': images,
      'image': image,
      'Paragraph': paragraph,
      'Title': title,
      'SubTitle': subTitle,
      'Id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    return e1?.images == e2?.images &&
        e1?.image == e2?.image &&
        e1?.paragraph == e2?.paragraph &&
        e1?.title == e2?.title &&
        e1?.subTitle == e2?.subTitle &&
        e1?.id == e2?.id;
  }

  @override
  int hash(ImagesRecord? e) => const ListEquality()
      .hash([e?.images, e?.image, e?.paragraph, e?.title, e?.subTitle, e?.id]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
