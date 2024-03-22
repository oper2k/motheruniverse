import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VaccinesListRecord extends FirestoreRecord {
  VaccinesListRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "vaccine_name" field.
  String? _vaccineName;
  String get vaccineName => _vaccineName ?? '';
  bool hasVaccineName() => _vaccineName != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _vaccineName = snapshotData['vaccine_name'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vaccines_list');

  static Stream<VaccinesListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VaccinesListRecord.fromSnapshot(s));

  static Future<VaccinesListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VaccinesListRecord.fromSnapshot(s));

  static VaccinesListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VaccinesListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VaccinesListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VaccinesListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VaccinesListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VaccinesListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVaccinesListRecordData({
  String? vaccineName,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vaccine_name': vaccineName,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class VaccinesListRecordDocumentEquality
    implements Equality<VaccinesListRecord> {
  const VaccinesListRecordDocumentEquality();

  @override
  bool equals(VaccinesListRecord? e1, VaccinesListRecord? e2) {
    return e1?.vaccineName == e2?.vaccineName && e1?.sort == e2?.sort;
  }

  @override
  int hash(VaccinesListRecord? e) =>
      const ListEquality().hash([e?.vaccineName, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is VaccinesListRecord;
}
