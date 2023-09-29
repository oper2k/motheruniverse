// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildStruct extends FFFirebaseStruct {
  ChildStruct({
    String? name,
    String? gender,
    int? growth,
    double? weight,
    DateTime? age,
    DateTime? birthDate,
    DateTime? conceptionDate,
    String? photo,
    String? imageLeft,
    String? imageRight,
    bool? childIsBorn,
    bool? genderIsUnknown,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _gender = gender,
        _growth = growth,
        _weight = weight,
        _age = age,
        _birthDate = birthDate,
        _conceptionDate = conceptionDate,
        _photo = photo,
        _imageLeft = imageLeft,
        _imageRight = imageRight,
        _childIsBorn = childIsBorn,
        _genderIsUnknown = genderIsUnknown,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "growth" field.
  int? _growth;
  int get growth => _growth ?? 0;
  set growth(int? val) => _growth = val;
  void incrementGrowth(int amount) => _growth = growth + amount;
  bool hasGrowth() => _growth != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  set weight(double? val) => _weight = val;
  void incrementWeight(double amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "age" field.
  DateTime? _age;
  DateTime? get age => _age;
  set age(DateTime? val) => _age = val;
  bool hasAge() => _age != null;

  // "birthDate" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  set birthDate(DateTime? val) => _birthDate = val;
  bool hasBirthDate() => _birthDate != null;

  // "conception_date" field.
  DateTime? _conceptionDate;
  DateTime? get conceptionDate => _conceptionDate;
  set conceptionDate(DateTime? val) => _conceptionDate = val;
  bool hasConceptionDate() => _conceptionDate != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  set photo(String? val) => _photo = val;
  bool hasPhoto() => _photo != null;

  // "image_left" field.
  String? _imageLeft;
  String get imageLeft => _imageLeft ?? '';
  set imageLeft(String? val) => _imageLeft = val;
  bool hasImageLeft() => _imageLeft != null;

  // "image_right" field.
  String? _imageRight;
  String get imageRight => _imageRight ?? '';
  set imageRight(String? val) => _imageRight = val;
  bool hasImageRight() => _imageRight != null;

  // "childIsBorn" field.
  bool? _childIsBorn;
  bool get childIsBorn => _childIsBorn ?? false;
  set childIsBorn(bool? val) => _childIsBorn = val;
  bool hasChildIsBorn() => _childIsBorn != null;

  // "genderIsUnknown" field.
  bool? _genderIsUnknown;
  bool get genderIsUnknown => _genderIsUnknown ?? false;
  set genderIsUnknown(bool? val) => _genderIsUnknown = val;
  bool hasGenderIsUnknown() => _genderIsUnknown != null;

  static ChildStruct fromMap(Map<String, dynamic> data) => ChildStruct(
        name: data['name'] as String?,
        gender: data['gender'] as String?,
        growth: castToType<int>(data['growth']),
        weight: castToType<double>(data['weight']),
        age: data['age'] as DateTime?,
        birthDate: data['birthDate'] as DateTime?,
        conceptionDate: data['conception_date'] as DateTime?,
        photo: data['photo'] as String?,
        imageLeft: data['image_left'] as String?,
        imageRight: data['image_right'] as String?,
        childIsBorn: data['childIsBorn'] as bool?,
        genderIsUnknown: data['genderIsUnknown'] as bool?,
      );

  static ChildStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChildStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'gender': _gender,
        'growth': _growth,
        'weight': _weight,
        'age': _age,
        'birthDate': _birthDate,
        'conception_date': _conceptionDate,
        'photo': _photo,
        'image_left': _imageLeft,
        'image_right': _imageRight,
        'childIsBorn': _childIsBorn,
        'genderIsUnknown': _genderIsUnknown,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'growth': serializeParam(
          _growth,
          ParamType.int,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.double,
        ),
        'age': serializeParam(
          _age,
          ParamType.DateTime,
        ),
        'birthDate': serializeParam(
          _birthDate,
          ParamType.DateTime,
        ),
        'conception_date': serializeParam(
          _conceptionDate,
          ParamType.DateTime,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
        ),
        'image_left': serializeParam(
          _imageLeft,
          ParamType.String,
        ),
        'image_right': serializeParam(
          _imageRight,
          ParamType.String,
        ),
        'childIsBorn': serializeParam(
          _childIsBorn,
          ParamType.bool,
        ),
        'genderIsUnknown': serializeParam(
          _genderIsUnknown,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChildStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChildStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        growth: deserializeParam(
          data['growth'],
          ParamType.int,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.double,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.DateTime,
          false,
        ),
        birthDate: deserializeParam(
          data['birthDate'],
          ParamType.DateTime,
          false,
        ),
        conceptionDate: deserializeParam(
          data['conception_date'],
          ParamType.DateTime,
          false,
        ),
        photo: deserializeParam(
          data['photo'],
          ParamType.String,
          false,
        ),
        imageLeft: deserializeParam(
          data['image_left'],
          ParamType.String,
          false,
        ),
        imageRight: deserializeParam(
          data['image_right'],
          ParamType.String,
          false,
        ),
        childIsBorn: deserializeParam(
          data['childIsBorn'],
          ParamType.bool,
          false,
        ),
        genderIsUnknown: deserializeParam(
          data['genderIsUnknown'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChildStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChildStruct &&
        name == other.name &&
        gender == other.gender &&
        growth == other.growth &&
        weight == other.weight &&
        age == other.age &&
        birthDate == other.birthDate &&
        conceptionDate == other.conceptionDate &&
        photo == other.photo &&
        imageLeft == other.imageLeft &&
        imageRight == other.imageRight &&
        childIsBorn == other.childIsBorn &&
        genderIsUnknown == other.genderIsUnknown;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        gender,
        growth,
        weight,
        age,
        birthDate,
        conceptionDate,
        photo,
        imageLeft,
        imageRight,
        childIsBorn,
        genderIsUnknown
      ]);
}

ChildStruct createChildStruct({
  String? name,
  String? gender,
  int? growth,
  double? weight,
  DateTime? age,
  DateTime? birthDate,
  DateTime? conceptionDate,
  String? photo,
  String? imageLeft,
  String? imageRight,
  bool? childIsBorn,
  bool? genderIsUnknown,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChildStruct(
      name: name,
      gender: gender,
      growth: growth,
      weight: weight,
      age: age,
      birthDate: birthDate,
      conceptionDate: conceptionDate,
      photo: photo,
      imageLeft: imageLeft,
      imageRight: imageRight,
      childIsBorn: childIsBorn,
      genderIsUnknown: genderIsUnknown,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChildStruct? updateChildStruct(
  ChildStruct? child, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    child
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChildStructData(
  Map<String, dynamic> firestoreData,
  ChildStruct? child,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (child == null) {
    return;
  }
  if (child.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && child.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final childData = getChildFirestoreData(child, forFieldValue);
  final nestedData = childData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = child.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChildFirestoreData(
  ChildStruct? child, [
  bool forFieldValue = false,
]) {
  if (child == null) {
    return {};
  }
  final firestoreData = mapToFirestore(child.toMap());

  // Add any Firestore field values
  child.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChildListFirestoreData(
  List<ChildStruct>? childs,
) =>
    childs?.map((e) => getChildFirestoreData(e, true)).toList() ?? [];
