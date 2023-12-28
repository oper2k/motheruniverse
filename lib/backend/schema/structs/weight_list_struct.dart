// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeightListStruct extends FFFirebaseStruct {
  WeightListStruct({
    double? weight,
    DateTime? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weight = weight,
        _date = date,
        super(firestoreUtilData);

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;
  void incrementWeight(double amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static WeightListStruct fromMap(Map<String, dynamic> data) =>
      WeightListStruct(
        weight: castToType<double>(data['weight']),
        date: data['date'] as DateTime?,
      );

  static WeightListStruct? maybeFromMap(dynamic data) => data is Map
      ? WeightListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'weight': _weight,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static WeightListStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeightListStruct(
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'WeightListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeightListStruct &&
        weight == other.weight &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([weight, date]);
}

WeightListStruct createWeightListStruct({
  double? weight,
  DateTime? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeightListStruct(
      weight: weight,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeightListStruct? updateWeightListStruct(
  WeightListStruct? weightList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weightList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeightListStructData(
  Map<String, dynamic> firestoreData,
  WeightListStruct? weightList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weightList == null) {
    return;
  }
  if (weightList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weightList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weightListData = getWeightListFirestoreData(weightList, forFieldValue);
  final nestedData = weightListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weightList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeightListFirestoreData(
  WeightListStruct? weightList, [
  bool forFieldValue = false,
]) {
  if (weightList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weightList.toMap());

  // Add any Firestore field values
  weightList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeightListListFirestoreData(
  List<WeightListStruct>? weightLists,
) =>
    weightLists?.map((e) => getWeightListFirestoreData(e, true)).toList() ?? [];
