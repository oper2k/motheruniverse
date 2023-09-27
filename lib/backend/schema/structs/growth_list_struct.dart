// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GrowthListStruct extends FFFirebaseStruct {
  GrowthListStruct({
    int? growth,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _growth = growth,
        _date = date,
        super(firestoreUtilData);

  // "growth" field.
  int? _growth;
  int get growth => _growth ?? 0;
  set growth(int? val) => _growth = val;
  void incrementGrowth(int amount) => _growth = growth + amount;
  bool hasGrowth() => _growth != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static GrowthListStruct fromMap(Map<String, dynamic> data) =>
      GrowthListStruct(
        growth: castToType<int>(data['growth']),
        date: data['date'] as DateTime?,
      );

  static GrowthListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GrowthListStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'growth': _growth,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'growth': serializeParam(
          _growth,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static GrowthListStruct fromSerializableMap(Map<String, dynamic> data) =>
      GrowthListStruct(
        growth: deserializeParam(
          data['growth'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'GrowthListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GrowthListStruct &&
        growth == other.growth &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([growth, date]);
}

GrowthListStruct createGrowthListStruct({
  int? growth,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GrowthListStruct(
      growth: growth,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GrowthListStruct? updateGrowthListStruct(
  GrowthListStruct? growthList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    growthList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGrowthListStructData(
  Map<String, dynamic> firestoreData,
  GrowthListStruct? growthList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (growthList == null) {
    return;
  }
  if (growthList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && growthList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final growthListData = getGrowthListFirestoreData(growthList, forFieldValue);
  final nestedData = growthListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = growthList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGrowthListFirestoreData(
  GrowthListStruct? growthList, [
  bool forFieldValue = false,
]) {
  if (growthList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(growthList.toMap());

  // Add any Firestore field values
  growthList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGrowthListListFirestoreData(
  List<GrowthListStruct>? growthLists,
) =>
    growthLists?.map((e) => getGrowthListFirestoreData(e, true)).toList() ?? [];
