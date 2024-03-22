import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CreatedDoctorVisitingRecord extends FirestoreRecord {
  CreatedDoctorVisitingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _age = snapshotData['age'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('created_doctor_visiting')
          : FirebaseFirestore.instance
              .collectionGroup('created_doctor_visiting');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('created_doctor_visiting').doc(id);

  static Stream<CreatedDoctorVisitingRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => CreatedDoctorVisitingRecord.fromSnapshot(s));

  static Future<CreatedDoctorVisitingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CreatedDoctorVisitingRecord.fromSnapshot(s));

  static CreatedDoctorVisitingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreatedDoctorVisitingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreatedDoctorVisitingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreatedDoctorVisitingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreatedDoctorVisitingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreatedDoctorVisitingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreatedDoctorVisitingRecordData({
  String? age,
  String? name,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'age': age,
      'name': name,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreatedDoctorVisitingRecordDocumentEquality
    implements Equality<CreatedDoctorVisitingRecord> {
  const CreatedDoctorVisitingRecordDocumentEquality();

  @override
  bool equals(
      CreatedDoctorVisitingRecord? e1, CreatedDoctorVisitingRecord? e2) {
    return e1?.age == e2?.age &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description;
  }

  @override
  int hash(CreatedDoctorVisitingRecord? e) =>
      const ListEquality().hash([e?.age, e?.name, e?.description]);

  @override
  bool isValidKey(Object? o) => o is CreatedDoctorVisitingRecord;
}
