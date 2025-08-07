import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AajKaKnowledgeRecord extends FirestoreRecord {
  AajKaKnowledgeRecord._(
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

  // "aaj_ka_knowledge_id" field.
  String? _aajKaKnowledgeId;
  String get aajKaKnowledgeId => _aajKaKnowledgeId ?? '';
  bool hasAajKaKnowledgeId() => _aajKaKnowledgeId != null;

  // "favorite_by" field.
  List<DocumentReference>? _favoriteBy;
  List<DocumentReference> get favoriteBy => _favoriteBy ?? const [];
  bool hasFavoriteBy() => _favoriteBy != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

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
    _aajKaKnowledgeId = snapshotData['aaj_ka_knowledge_id'] as String?;
    _favoriteBy = getDataList(snapshotData['favorite_by']);
    _category = snapshotData['category'] as String?;
    _id = castToType<int>(snapshotData['id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('aaj_ka_knowledge');

  static Stream<AajKaKnowledgeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AajKaKnowledgeRecord.fromSnapshot(s));

  static Future<AajKaKnowledgeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AajKaKnowledgeRecord.fromSnapshot(s));

  static AajKaKnowledgeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AajKaKnowledgeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AajKaKnowledgeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AajKaKnowledgeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AajKaKnowledgeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AajKaKnowledgeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAajKaKnowledgeRecordData({
  String? images,
  String? information,
  String? tags,
  DateTime? createdTime,
  bool? bookmark,
  String? imageUrl,
  String? aajKaKnowledgeId,
  String? category,
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
      'aaj_ka_knowledge_id': aajKaKnowledgeId,
      'category': category,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class AajKaKnowledgeRecordDocumentEquality
    implements Equality<AajKaKnowledgeRecord> {
  const AajKaKnowledgeRecordDocumentEquality();

  @override
  bool equals(AajKaKnowledgeRecord? e1, AajKaKnowledgeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.images == e2?.images &&
        e1?.information == e2?.information &&
        e1?.tags == e2?.tags &&
        e1?.createdTime == e2?.createdTime &&
        e1?.bookmark == e2?.bookmark &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.aajKaKnowledgeId == e2?.aajKaKnowledgeId &&
        listEquality.equals(e1?.favoriteBy, e2?.favoriteBy) &&
        e1?.category == e2?.category &&
        e1?.id == e2?.id;
  }

  @override
  int hash(AajKaKnowledgeRecord? e) => const ListEquality().hash([
        e?.images,
        e?.information,
        e?.tags,
        e?.createdTime,
        e?.bookmark,
        e?.imageUrl,
        e?.aajKaKnowledgeId,
        e?.favoriteBy,
        e?.category,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is AajKaKnowledgeRecord;
}
