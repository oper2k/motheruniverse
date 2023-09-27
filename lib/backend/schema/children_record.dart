import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildrenRecord extends FirestoreRecord {
  ChildrenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "growth" field.
  int? _growth;
  int get growth => _growth ?? 0;
  bool hasGrowth() => _growth != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "age" field.
  DateTime? _age;
  DateTime? get age => _age;
  bool hasAge() => _age != null;

  // "birth_date" field.
  DateTime? _birthDate;
  DateTime? get birthDate => _birthDate;
  bool hasBirthDate() => _birthDate != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "image_left" field.
  String? _imageLeft;
  String get imageLeft => _imageLeft ?? '';
  bool hasImageLeft() => _imageLeft != null;

  // "image_right" field.
  String? _imageRight;
  String get imageRight => _imageRight ?? '';
  bool hasImageRight() => _imageRight != null;

  // "childIsBorn" field.
  bool? _childIsBorn;
  bool get childIsBorn => _childIsBorn ?? false;
  bool hasChildIsBorn() => _childIsBorn != null;

  // "genderIsUnknown" field.
  bool? _genderIsUnknown;
  bool get genderIsUnknown => _genderIsUnknown ?? false;
  bool hasGenderIsUnknown() => _genderIsUnknown != null;

  // "conception_date" field.
  DateTime? _conceptionDate;
  DateTime? get conceptionDate => _conceptionDate;
  bool hasConceptionDate() => _conceptionDate != null;

  // "growth_list" field.
  List<GrowthListStruct>? _growthList;
  List<GrowthListStruct> get growthList => _growthList ?? const [];
  bool hasGrowthList() => _growthList != null;

  // "weight_list" field.
  List<WeightListStruct>? _weightList;
  List<WeightListStruct> get weightList => _weightList ?? const [];
  bool hasWeightList() => _weightList != null;

  // "temp_start_sleep_time" field.
  DateTime? _tempStartSleepTime;
  DateTime? get tempStartSleepTime => _tempStartSleepTime;
  bool hasTempStartSleepTime() => _tempStartSleepTime != null;

  // "unnormal_sleep_date" field.
  List<DateTime>? _unnormalSleepDate;
  List<DateTime> get unnormalSleepDate => _unnormalSleepDate ?? const [];
  bool hasUnnormalSleepDate() => _unnormalSleepDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _gender = snapshotData['gender'] as String?;
    _growth = castToType<int>(snapshotData['growth']);
    _weight = castToType<double>(snapshotData['weight']);
    _age = snapshotData['age'] as DateTime?;
    _birthDate = snapshotData['birth_date'] as DateTime?;
    _photo = snapshotData['photo'] as String?;
    _imageLeft = snapshotData['image_left'] as String?;
    _imageRight = snapshotData['image_right'] as String?;
    _childIsBorn = snapshotData['childIsBorn'] as bool?;
    _genderIsUnknown = snapshotData['genderIsUnknown'] as bool?;
    _conceptionDate = snapshotData['conception_date'] as DateTime?;
    _growthList = getStructList(
      snapshotData['growth_list'],
      GrowthListStruct.fromMap,
    );
    _weightList = getStructList(
      snapshotData['weight_list'],
      WeightListStruct.fromMap,
    );
    _tempStartSleepTime = snapshotData['temp_start_sleep_time'] as DateTime?;
    _unnormalSleepDate = getDataList(snapshotData['unnormal_sleep_date']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('children')
          : FirebaseFirestore.instance.collectionGroup('children');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('children').doc();

  static Stream<ChildrenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChildrenRecord.fromSnapshot(s));

  static Future<ChildrenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChildrenRecord.fromSnapshot(s));

  static ChildrenRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChildrenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChildrenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChildrenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChildrenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChildrenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChildrenRecordData({
  String? name,
  String? gender,
  int? growth,
  double? weight,
  DateTime? age,
  DateTime? birthDate,
  String? photo,
  String? imageLeft,
  String? imageRight,
  bool? childIsBorn,
  bool? genderIsUnknown,
  DateTime? conceptionDate,
  DateTime? tempStartSleepTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'gender': gender,
      'growth': growth,
      'weight': weight,
      'age': age,
      'birth_date': birthDate,
      'photo': photo,
      'image_left': imageLeft,
      'image_right': imageRight,
      'childIsBorn': childIsBorn,
      'genderIsUnknown': genderIsUnknown,
      'conception_date': conceptionDate,
      'temp_start_sleep_time': tempStartSleepTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChildrenRecordDocumentEquality implements Equality<ChildrenRecord> {
  const ChildrenRecordDocumentEquality();

  @override
  bool equals(ChildrenRecord? e1, ChildrenRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.gender == e2?.gender &&
        e1?.growth == e2?.growth &&
        e1?.weight == e2?.weight &&
        e1?.age == e2?.age &&
        e1?.birthDate == e2?.birthDate &&
        e1?.photo == e2?.photo &&
        e1?.imageLeft == e2?.imageLeft &&
        e1?.imageRight == e2?.imageRight &&
        e1?.childIsBorn == e2?.childIsBorn &&
        e1?.genderIsUnknown == e2?.genderIsUnknown &&
        e1?.conceptionDate == e2?.conceptionDate &&
        listEquality.equals(e1?.growthList, e2?.growthList) &&
        listEquality.equals(e1?.weightList, e2?.weightList) &&
        e1?.tempStartSleepTime == e2?.tempStartSleepTime &&
        listEquality.equals(e1?.unnormalSleepDate, e2?.unnormalSleepDate);
  }

  @override
  int hash(ChildrenRecord? e) => const ListEquality().hash([
        e?.name,
        e?.gender,
        e?.growth,
        e?.weight,
        e?.age,
        e?.birthDate,
        e?.photo,
        e?.imageLeft,
        e?.imageRight,
        e?.childIsBorn,
        e?.genderIsUnknown,
        e?.conceptionDate,
        e?.growthList,
        e?.weightList,
        e?.tempStartSleepTime,
        e?.unnormalSleepDate
      ]);

  @override
  bool isValidKey(Object? o) => o is ChildrenRecord;
}
