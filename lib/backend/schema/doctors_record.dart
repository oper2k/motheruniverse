import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorsRecord extends FirestoreRecord {
  DoctorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  void _initializeFields() {
    _age = snapshotData['age'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsRecord.fromSnapshot(s));

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsRecord.fromSnapshot(s));

  static DoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorsRecordData({
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

class DoctorsRecordDocumentEquality implements Equality<DoctorsRecord> {
  const DoctorsRecordDocumentEquality();

  @override
  bool equals(DoctorsRecord? e1, DoctorsRecord? e2) {
    return e1?.age == e2?.age &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description;
  }

  @override
  int hash(DoctorsRecord? e) =>
      const ListEquality().hash([e?.age, e?.name, e?.description]);

  @override
  bool isValidKey(Object? o) => o is DoctorsRecord;
}
