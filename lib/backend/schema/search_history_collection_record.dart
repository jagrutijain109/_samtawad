import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchHistoryCollectionRecord extends FirestoreRecord {
  SearchHistoryCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Search_history_collection_id" field.
  String? _searchHistoryCollectionId;
  String get searchHistoryCollectionId => _searchHistoryCollectionId ?? '';
  bool hasSearchHistoryCollectionId() => _searchHistoryCollectionId != null;

  // "searchText" field.
  String? _searchText;
  String get searchText => _searchText ?? '';
  bool hasSearchText() => _searchText != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _searchHistoryCollectionId =
        snapshotData['Search_history_collection_id'] as String?;
    _searchText = snapshotData['searchText'] as String?;
    _category = snapshotData['category'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
    _userId = snapshotData['user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Search_history_collection');

  static Stream<SearchHistoryCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SearchHistoryCollectionRecord.fromSnapshot(s));

  static Future<SearchHistoryCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SearchHistoryCollectionRecord.fromSnapshot(s));

  static SearchHistoryCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      SearchHistoryCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchHistoryCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchHistoryCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SearchHistoryCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchHistoryCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSearchHistoryCollectionRecordData({
  String? searchHistoryCollectionId,
  String? searchText,
  String? category,
  DateTime? timeStamp,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Search_history_collection_id': searchHistoryCollectionId,
      'searchText': searchText,
      'category': category,
      'timeStamp': timeStamp,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SearchHistoryCollectionRecordDocumentEquality
    implements Equality<SearchHistoryCollectionRecord> {
  const SearchHistoryCollectionRecordDocumentEquality();

  @override
  bool equals(
      SearchHistoryCollectionRecord? e1, SearchHistoryCollectionRecord? e2) {
    return e1?.searchHistoryCollectionId == e2?.searchHistoryCollectionId &&
        e1?.searchText == e2?.searchText &&
        e1?.category == e2?.category &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(SearchHistoryCollectionRecord? e) => const ListEquality().hash([
        e?.searchHistoryCollectionId,
        e?.searchText,
        e?.category,
        e?.timeStamp,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is SearchHistoryCollectionRecord;
}
