import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GurijiJiImageRecord extends FirestoreRecord {
  GurijiJiImageRecord._(
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

  // "bookmark" field.
  bool? _bookmark;
  bool get bookmark => _bookmark ?? false;
  bool hasBookmark() => _bookmark != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "guruji_image_id" field.
  String? _gurujiImageId;
  String get gurujiImageId => _gurujiImageId ?? '';
  bool hasGurujiImageId() => _gurujiImageId != null;

  // "favorite_by" field.
  List<DocumentReference>? _favoriteBy;
  List<DocumentReference> get favoriteBy => _favoriteBy ?? const [];
  bool hasFavoriteBy() => _favoriteBy != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  void _initializeFields() {
    _images = snapshotData['images'] as String?;
    _information = snapshotData['information'] as String?;
    _tags = snapshotData['tags'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _bookmark = snapshotData['bookmark'] as bool?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _gurujiImageId = snapshotData['guruji_image_id'] as String?;
    _favoriteBy = getDataList(snapshotData['favorite_by']);
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('guriji_ji_image');

  static Stream<GurijiJiImageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GurijiJiImageRecord.fromSnapshot(s));

  static Future<GurijiJiImageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GurijiJiImageRecord.fromSnapshot(s));

  static GurijiJiImageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GurijiJiImageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GurijiJiImageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GurijiJiImageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GurijiJiImageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GurijiJiImageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGurijiJiImageRecordData({
  String? images,
  String? information,
  String? tags,
  DateTime? createdTime,
  bool? bookmark,
  String? imageUrl,
  String? gurujiImageId,
  int? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'images': images,
      'information': information,
      'tags': tags,
      'created_time': createdTime,
      'bookmark': bookmark,
      'imageUrl': imageUrl,
      'guruji_image_id': gurujiImageId,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class GurijiJiImageRecordDocumentEquality
    implements Equality<GurijiJiImageRecord> {
  const GurijiJiImageRecordDocumentEquality();

  @override
  bool equals(GurijiJiImageRecord? e1, GurijiJiImageRecord? e2) {
    const listEquality = ListEquality();
    return e1?.images == e2?.images &&
        e1?.information == e2?.information &&
        e1?.tags == e2?.tags &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bookmark == e2?.bookmark &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.gurujiImageId == e2?.gurujiImageId &&
        listEquality.equals(e1?.favoriteBy, e2?.favoriteBy) &&
        e1?.id == e2?.id;
  }

  @override
  int hash(GurijiJiImageRecord? e) => const ListEquality().hash([
        e?.images,
        e?.information,
        e?.tags,
        e?.createdTime,
        e?.bookmark,
        e?.imageUrl,
        e?.gurujiImageId,
        e?.favoriteBy,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is GurijiJiImageRecord;
}
