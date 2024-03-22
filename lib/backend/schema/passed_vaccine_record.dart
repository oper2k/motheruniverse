import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PassedVaccineRecord extends FirestoreRecord {
  PassedVaccineRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "vaccine_name" field.
  String? _vaccineName;
  String get vaccineName => _vaccineName ?? '';
  bool hasVaccineName() => _vaccineName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "passed_date" field.
  DateTime? _passedDate;
  DateTime? get passedDate => _passedDate;
  bool hasPassedDate() => _passedDate != null;

  // "child" field.
  DocumentReference? _child;
  DocumentReference? get child => _child;
  bool hasChild() => _child != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _vaccineName = snapshotData['vaccine_name'] as String?;
    _id = snapshotData['id'] as String?;
    _passedDate = snapshotData['passed_date'] as DateTime?;
    _child = snapshotData['child'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('passed_vaccine')
          : FirebaseFirestore.instance.collectionGroup('passed_vaccine');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('passed_vaccine').doc(id);

  static Stream<PassedVaccineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PassedVaccineRecord.fromSnapshot(s));

  static Future<PassedVaccineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PassedVaccineRecord.fromSnapshot(s));

  static PassedVaccineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PassedVaccineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PassedVaccineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PassedVaccineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PassedVaccineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PassedVaccineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPassedVaccineRecordData({
  String? vaccineName,
  String? id,
  DateTime? passedDate,
  DocumentReference? child,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vaccine_name': vaccineName,
      'id': id,
      'passed_date': passedDate,
      'child': child,
    }.withoutNulls,
  );

  return firestoreData;
}

class PassedVaccineRecordDocumentEquality
    implements Equality<PassedVaccineRecord> {
  const PassedVaccineRecordDocumentEquality();

  @override
  bool equals(PassedVaccineRecord? e1, PassedVaccineRecord? e2) {
    return e1?.vaccineName == e2?.vaccineName &&
        e1?.id == e2?.id &&
        e1?.passedDate == e2?.passedDate &&
        e1?.child == e2?.child;
  }

  @override
  int hash(PassedVaccineRecord? e) => const ListEquality()
      .hash([e?.vaccineName, e?.id, e?.passedDate, e?.child]);

  @override
  bool isValidKey(Object? o) => o is PassedVaccineRecord;
}
