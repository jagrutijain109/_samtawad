import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WishlistRecord extends FirestoreRecord {
  WishlistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "audio_id" field.
  String? _audioId;
  String get audioId => _audioId ?? '';
  bool hasAudioId() => _audioId != null;

  // "audio_title" field.
  String? _audioTitle;
  String get audioTitle => _audioTitle ?? '';
  bool hasAudioTitle() => _audioTitle != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "tags" field.
  String? _tags;
  String get tags => _tags ?? '';
  bool hasTags() => _tags != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  bool hasAudio() => _audio != null;

  // "information" field.
  String? _information;
  String get information => _information ?? '';
  bool hasInformation() => _information != null;

  // "audio_time" field.
  String? _audioTime;
  String get audioTime => _audioTime ?? '';
  bool hasAudioTime() => _audioTime != null;

  // "wishlist_id" field.
  String? _wishlistId;
  String get wishlistId => _wishlistId ?? '';
  bool hasWishlistId() => _wishlistId != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "item_id" field.
  String? _itemId;
  String get itemId => _itemId ?? '';
  bool hasItemId() => _itemId != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _audioId = snapshotData['audio_id'] as String?;
    _audioTitle = snapshotData['audio_title'] as String?;
    _category = snapshotData['category'] as String?;
    _image = snapshotData['image'] as String?;
    _tags = snapshotData['tags'] as String?;
    _audio = snapshotData['audio'] as String?;
    _information = snapshotData['information'] as String?;
    _audioTime = snapshotData['audio_time'] as String?;
    _wishlistId = snapshotData['wishlist_id'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _itemId = snapshotData['item_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wishlist');

  static Stream<WishlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WishlistRecord.fromSnapshot(s));

  static Future<WishlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WishlistRecord.fromSnapshot(s));

  static WishlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WishlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WishlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WishlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WishlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WishlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWishlistRecordData({
  String? userId,
  String? audioId,
  String? audioTitle,
  String? category,
  String? image,
  String? tags,
  String? audio,
  String? information,
  String? audioTime,
  String? wishlistId,
  DateTime? createdTime,
  String? itemId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'audio_id': audioId,
      'audio_title': audioTitle,
      'category': category,
      'image': image,
      'tags': tags,
      'audio': audio,
      'information': information,
      'audio_time': audioTime,
      'wishlist_id': wishlistId,
      'created_time': createdTime,
      'item_id': itemId,
    }.withoutNulls,
  );

  return firestoreData;
}

class WishlistRecordDocumentEquality implements Equality<WishlistRecord> {
  const WishlistRecordDocumentEquality();

  @override
  bool equals(WishlistRecord? e1, WishlistRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.audioId == e2?.audioId &&
        e1?.audioTitle == e2?.audioTitle &&
        e1?.category == e2?.category &&
        e1?.image == e2?.image &&
        e1?.tags == e2?.tags &&
        e1?.audio == e2?.audio &&
        e1?.information == e2?.information &&
        e1?.audioTime == e2?.audioTime &&
        e1?.wishlistId == e2?.wishlistId &&
        e1?.createdTime == e2?.createdTime &&
        e1?.itemId == e2?.itemId;
  }

  @override
  int hash(WishlistRecord? e) => const ListEquality().hash([
        e?.userId,
        e?.audioId,
        e?.audioTitle,
        e?.category,
        e?.image,
        e?.tags,
        e?.audio,
        e?.information,
        e?.audioTime,
        e?.wishlistId,
        e?.createdTime,
        e?.itemId
      ]);

  @override
  bool isValidKey(Object? o) => o is WishlistRecord;
}
