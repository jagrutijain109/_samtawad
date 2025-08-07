import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AshramGalleryRecord extends FirestoreRecord {
  AshramGalleryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "bookmark" field.
  bool? _bookmark;
  bool get bookmark => _bookmark ?? false;
  bool hasBookmark() => _bookmark != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "aashra_gallary_id" field.
  String? _aashraGallaryId;
  String get aashraGallaryId => _aashraGallaryId ?? '';
  bool hasAashraGallaryId() => _aashraGallaryId != null;

  // "favorite_by" field.
  List<DocumentReference>? _favoriteBy;
  List<DocumentReference> get favoriteBy => _favoriteBy ?? const [];
  bool hasFavoriteBy() => _favoriteBy != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "create_time" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _information = snapshotData['information'] as String?;
    _tags = snapshotData['tags'] as String?;
    _bookmark = snapshotData['bookmark'] as bool?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _aashraGallaryId = snapshotData['aashra_gallary_id'] as String?;
    _favoriteBy = getDataList(snapshotData['favorite_by']);
    _category = snapshotData['category'] as String?;
    _createTime = snapshotData['create_time'] as DateTime?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ashram_gallery');

  static Stream<AshramGalleryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AshramGalleryRecord.fromSnapshot(s));

  static Future<AshramGalleryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AshramGalleryRecord.fromSnapshot(s));

  static AshramGalleryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AshramGalleryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AshramGalleryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AshramGalleryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AshramGalleryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AshramGalleryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAshramGalleryRecordData({
  String? image,
  String? information,
  String? tags,
  bool? bookmark,
  String? imageUrl,
  String? aashraGallaryId,
  String? category,
  DateTime? createTime,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'information': information,
      'tags': tags,
      'bookmark': bookmark,
      'imageUrl': imageUrl,
      'aashra_gallary_id': aashraGallaryId,
      'category': category,
      'create_time': createTime,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class AshramGalleryRecordDocumentEquality
    implements Equality<AshramGalleryRecord> {
  const AshramGalleryRecordDocumentEquality();

  @override
  bool equals(AshramGalleryRecord? e1, AshramGalleryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.image == e2?.image &&
        e1?.information == e2?.information &&
        e1?.tags == e2?.tags &&
        e1?.bookmark == e2?.bookmark &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.aashraGallaryId == e2?.aashraGallaryId &&
        listEquality.equals(e1?.favoriteBy, e2?.favoriteBy) &&
        e1?.category == e2?.category &&
        e1?.createTime == e2?.createTime &&
        e1?.id == e2?.id;
  }

  @override
  int hash(AshramGalleryRecord? e) => const ListEquality().hash([
        e?.image,
        e?.information,
        e?.tags,
        e?.bookmark,
        e?.imageUrl,
        e?.aashraGallaryId,
        e?.favoriteBy,
        e?.category,
        e?.createTime,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is AshramGalleryRecord;
}
