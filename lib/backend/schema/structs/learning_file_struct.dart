// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearningFileStruct extends FFFirebaseStruct {
  LearningFileStruct({
    String? fileName,
    String? type,
    String? size,
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fileName = fileName,
        _type = type,
        _size = size,
        _link = link,
        super(firestoreUtilData);

  // "file_name" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  set fileName(String? val) => _fileName = val;
  bool hasFileName() => _fileName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "size" field.
  String? _size;
  String get size => _size ?? '';
  set size(String? val) => _size = val;
  bool hasSize() => _size != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static LearningFileStruct fromMap(Map<String, dynamic> data) =>
      LearningFileStruct(
        fileName: data['file_name'] as String?,
        type: data['type'] as String?,
        size: data['size'] as String?,
        link: data['link'] as String?,
      );

  static LearningFileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LearningFileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'file_name': _fileName,
        'type': _type,
        'size': _size,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'file_name': serializeParam(
          _fileName,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static LearningFileStruct fromSerializableMap(Map<String, dynamic> data) =>
      LearningFileStruct(
        fileName: deserializeParam(
          data['file_name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LearningFileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LearningFileStruct &&
        fileName == other.fileName &&
        type == other.type &&
        size == other.size &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality().hash([fileName, type, size, link]);
}

LearningFileStruct createLearningFileStruct({
  String? fileName,
  String? type,
  String? size,
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LearningFileStruct(
      fileName: fileName,
      type: type,
      size: size,
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LearningFileStruct? updateLearningFileStruct(
  LearningFileStruct? learningFile, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    learningFile
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLearningFileStructData(
  Map<String, dynamic> firestoreData,
  LearningFileStruct? learningFile,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (learningFile == null) {
    return;
  }
  if (learningFile.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && learningFile.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final learningFileData =
      getLearningFileFirestoreData(learningFile, forFieldValue);
  final nestedData =
      learningFileData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = learningFile.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLearningFileFirestoreData(
  LearningFileStruct? learningFile, [
  bool forFieldValue = false,
]) {
  if (learningFile == null) {
    return {};
  }
  final firestoreData = mapToFirestore(learningFile.toMap());

  // Add any Firestore field values
  learningFile.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLearningFileListFirestoreData(
  List<LearningFileStruct>? learningFiles,
) =>
    learningFiles?.map((e) => getLearningFileFirestoreData(e, true)).toList() ??
    [];
