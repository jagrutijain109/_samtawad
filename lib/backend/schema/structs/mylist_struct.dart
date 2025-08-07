// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MylistStruct extends FFFirebaseStruct {
  MylistStruct({
    String? slogan1,
    String? slogan2,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _slogan1 = slogan1,
        _slogan2 = slogan2,
        super(firestoreUtilData);

  // "slogan1" field.
  String? _slogan1;
  String get slogan1 =>
      _slogan1 ??
      'कहाँ से आया कहाँ नर जाए, कौन तेरो मुक़ाम । \'मंगत\' सार विचारना, मानुष जनम का काम ।।';
  set slogan1(String? val) => _slogan1 = val;

  bool hasSlogan1() => _slogan1 != null;

  // "slogan2" field.
  String? _slogan2;
  String get slogan2 =>
      _slogan2 ??
      'ये संसार सराये, जीव मुसाफिर नीत । \'मंगत\' खोज सत शान्ती, औध जात है बीत ।।';
  set slogan2(String? val) => _slogan2 = val;

  bool hasSlogan2() => _slogan2 != null;

  static MylistStruct fromMap(Map<String, dynamic> data) => MylistStruct(
        slogan1: data['slogan1'] as String?,
        slogan2: data['slogan2'] as String?,
      );

  static MylistStruct? maybeFromMap(dynamic data) =>
      data is Map ? MylistStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'slogan1': _slogan1,
        'slogan2': _slogan2,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'slogan1': serializeParam(
          _slogan1,
          ParamType.String,
        ),
        'slogan2': serializeParam(
          _slogan2,
          ParamType.String,
        ),
      }.withoutNulls;

  static MylistStruct fromSerializableMap(Map<String, dynamic> data) =>
      MylistStruct(
        slogan1: deserializeParam(
          data['slogan1'],
          ParamType.String,
          false,
        ),
        slogan2: deserializeParam(
          data['slogan2'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MylistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MylistStruct &&
        slogan1 == other.slogan1 &&
        slogan2 == other.slogan2;
  }

  @override
  int get hashCode => const ListEquality().hash([slogan1, slogan2]);
}

MylistStruct createMylistStruct({
  String? slogan1,
  String? slogan2,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MylistStruct(
      slogan1: slogan1,
      slogan2: slogan2,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MylistStruct? updateMylistStruct(
  MylistStruct? mylist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    mylist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMylistStructData(
  Map<String, dynamic> firestoreData,
  MylistStruct? mylist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (mylist == null) {
    return;
  }
  if (mylist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && mylist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mylistData = getMylistFirestoreData(mylist, forFieldValue);
  final nestedData = mylistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = mylist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMylistFirestoreData(
  MylistStruct? mylist, [
  bool forFieldValue = false,
]) {
  if (mylist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(mylist.toMap());

  // Add any Firestore field values
  mylist.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMylistListFirestoreData(
  List<MylistStruct>? mylists,
) =>
    mylists?.map((e) => getMylistFirestoreData(e, true)).toList() ?? [];
