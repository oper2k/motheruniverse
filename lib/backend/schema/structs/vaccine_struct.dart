// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VaccineStruct extends FFFirebaseStruct {
  VaccineStruct({
    String? id,
    DateTime? passDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _passDate = passDate,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "pass_date" field.
  DateTime? _passDate;
  DateTime? get passDate => _passDate;
  set passDate(DateTime? val) => _passDate = val;
  bool hasPassDate() => _passDate != null;

  static VaccineStruct fromMap(Map<String, dynamic> data) => VaccineStruct(
        id: data['id'] as String?,
        passDate: data['pass_date'] as DateTime?,
      );

  static VaccineStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? VaccineStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'pass_date': _passDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'pass_date': serializeParam(
          _passDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static VaccineStruct fromSerializableMap(Map<String, dynamic> data) =>
      VaccineStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        passDate: deserializeParam(
          data['pass_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'VaccineStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VaccineStruct &&
        id == other.id &&
        passDate == other.passDate;
  }

  @override
  int get hashCode => const ListEquality().hash([id, passDate]);
}

VaccineStruct createVaccineStruct({
  String? id,
  DateTime? passDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VaccineStruct(
      id: id,
      passDate: passDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VaccineStruct? updateVaccineStruct(
  VaccineStruct? vaccine, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vaccine
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVaccineStructData(
  Map<String, dynamic> firestoreData,
  VaccineStruct? vaccine,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vaccine == null) {
    return;
  }
  if (vaccine.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vaccine.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vaccineData = getVaccineFirestoreData(vaccine, forFieldValue);
  final nestedData = vaccineData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vaccine.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVaccineFirestoreData(
  VaccineStruct? vaccine, [
  bool forFieldValue = false,
]) {
  if (vaccine == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vaccine.toMap());

  // Add any Firestore field values
  vaccine.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVaccineListFirestoreData(
  List<VaccineStruct>? vaccines,
) =>
    vaccines?.map((e) => getVaccineFirestoreData(e, true)).toList() ?? [];
