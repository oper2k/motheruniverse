// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckListGroupsStruct extends FFFirebaseStruct {
  CheckListGroupsStruct({
    String? groupName,
    int? sort,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _groupName = groupName,
        _sort = sort,
        super(firestoreUtilData);

  // "group_name" field.
  String? _groupName;
  String get groupName => _groupName ?? '';
  set groupName(String? val) => _groupName = val;
  bool hasGroupName() => _groupName != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  set sort(int? val) => _sort = val;
  void incrementSort(int amount) => _sort = sort + amount;
  bool hasSort() => _sort != null;

  static CheckListGroupsStruct fromMap(Map<String, dynamic> data) =>
      CheckListGroupsStruct(
        groupName: data['group_name'] as String?,
        sort: castToType<int>(data['sort']),
      );

  static CheckListGroupsStruct? maybeFromMap(dynamic data) => data is Map
      ? CheckListGroupsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'group_name': _groupName,
        'sort': _sort,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'group_name': serializeParam(
          _groupName,
          ParamType.String,
        ),
        'sort': serializeParam(
          _sort,
          ParamType.int,
        ),
      }.withoutNulls;

  static CheckListGroupsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheckListGroupsStruct(
        groupName: deserializeParam(
          data['group_name'],
          ParamType.String,
          false,
        ),
        sort: deserializeParam(
          data['sort'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CheckListGroupsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheckListGroupsStruct &&
        groupName == other.groupName &&
        sort == other.sort;
  }

  @override
  int get hashCode => const ListEquality().hash([groupName, sort]);
}

CheckListGroupsStruct createCheckListGroupsStruct({
  String? groupName,
  int? sort,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CheckListGroupsStruct(
      groupName: groupName,
      sort: sort,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CheckListGroupsStruct? updateCheckListGroupsStruct(
  CheckListGroupsStruct? checkListGroups, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    checkListGroups
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCheckListGroupsStructData(
  Map<String, dynamic> firestoreData,
  CheckListGroupsStruct? checkListGroups,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (checkListGroups == null) {
    return;
  }
  if (checkListGroups.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && checkListGroups.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final checkListGroupsData =
      getCheckListGroupsFirestoreData(checkListGroups, forFieldValue);
  final nestedData =
      checkListGroupsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = checkListGroups.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCheckListGroupsFirestoreData(
  CheckListGroupsStruct? checkListGroups, [
  bool forFieldValue = false,
]) {
  if (checkListGroups == null) {
    return {};
  }
  final firestoreData = mapToFirestore(checkListGroups.toMap());

  // Add any Firestore field values
  checkListGroups.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCheckListGroupsListFirestoreData(
  List<CheckListGroupsStruct>? checkListGroupss,
) =>
    checkListGroupss
        ?.map((e) => getCheckListGroupsFirestoreData(e, true))
        .toList() ??
    [];
