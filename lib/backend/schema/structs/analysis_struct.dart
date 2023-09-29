// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AnalysisStruct extends FFFirebaseStruct {
  AnalysisStruct({
    String? analysisName,
    String? analysisDescriptioin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _analysisName = analysisName,
        _analysisDescriptioin = analysisDescriptioin,
        super(firestoreUtilData);

  // "analysis_name" field.
  String? _analysisName;
  String get analysisName => _analysisName ?? '';
  set analysisName(String? val) => _analysisName = val;
  bool hasAnalysisName() => _analysisName != null;

  // "analysis_descriptioin" field.
  String? _analysisDescriptioin;
  String get analysisDescriptioin => _analysisDescriptioin ?? '';
  set analysisDescriptioin(String? val) => _analysisDescriptioin = val;
  bool hasAnalysisDescriptioin() => _analysisDescriptioin != null;

  static AnalysisStruct fromMap(Map<String, dynamic> data) => AnalysisStruct(
        analysisName: data['analysis_name'] as String?,
        analysisDescriptioin: data['analysis_descriptioin'] as String?,
      );

  static AnalysisStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AnalysisStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'analysis_name': _analysisName,
        'analysis_descriptioin': _analysisDescriptioin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'analysis_name': serializeParam(
          _analysisName,
          ParamType.String,
        ),
        'analysis_descriptioin': serializeParam(
          _analysisDescriptioin,
          ParamType.String,
        ),
      }.withoutNulls;

  static AnalysisStruct fromSerializableMap(Map<String, dynamic> data) =>
      AnalysisStruct(
        analysisName: deserializeParam(
          data['analysis_name'],
          ParamType.String,
          false,
        ),
        analysisDescriptioin: deserializeParam(
          data['analysis_descriptioin'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AnalysisStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AnalysisStruct &&
        analysisName == other.analysisName &&
        analysisDescriptioin == other.analysisDescriptioin;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([analysisName, analysisDescriptioin]);
}

AnalysisStruct createAnalysisStruct({
  String? analysisName,
  String? analysisDescriptioin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AnalysisStruct(
      analysisName: analysisName,
      analysisDescriptioin: analysisDescriptioin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AnalysisStruct? updateAnalysisStruct(
  AnalysisStruct? analysis, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    analysis
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAnalysisStructData(
  Map<String, dynamic> firestoreData,
  AnalysisStruct? analysis,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (analysis == null) {
    return;
  }
  if (analysis.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && analysis.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final analysisData = getAnalysisFirestoreData(analysis, forFieldValue);
  final nestedData = analysisData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = analysis.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAnalysisFirestoreData(
  AnalysisStruct? analysis, [
  bool forFieldValue = false,
]) {
  if (analysis == null) {
    return {};
  }
  final firestoreData = mapToFirestore(analysis.toMap());

  // Add any Firestore field values
  analysis.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAnalysisListFirestoreData(
  List<AnalysisStruct>? analysiss,
) =>
    analysiss?.map((e) => getAnalysisFirestoreData(e, true)).toList() ?? [];
