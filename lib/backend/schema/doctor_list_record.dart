import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoctorListRecord extends FirestoreRecord {
  DoctorListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctor_list');

  static Stream<DoctorListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorListRecord.fromSnapshot(s));

  static Future<DoctorListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorListRecord.fromSnapshot(s));

  static DoctorListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorListRecordData({
  String? name,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorListRecordDocumentEquality implements Equality<DoctorListRecord> {
  const DoctorListRecordDocumentEquality();

  @override
  bool equals(DoctorListRecord? e1, DoctorListRecord? e2) {
    return e1?.name == e2?.name && e1?.sort == e2?.sort;
  }

  @override
  int hash(DoctorListRecord? e) =>
      const ListEquality().hash([e?.name, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is DoctorListRecord;
}
