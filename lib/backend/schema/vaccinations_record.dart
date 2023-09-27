import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VaccinationsRecord extends FirestoreRecord {
  VaccinationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vaccination_name" field.
  String? _vaccinationName;
  String get vaccinationName => _vaccinationName ?? '';
  bool hasVaccinationName() => _vaccinationName != null;

  // "age_of_child_in_days" field.
  int? _ageOfChildInDays;
  int get ageOfChildInDays => _ageOfChildInDays ?? 0;
  bool hasAgeOfChildInDays() => _ageOfChildInDays != null;

  // "period_vacinating" field.
  String? _periodVacinating;
  String get periodVacinating => _periodVacinating ?? '';
  bool hasPeriodVacinating() => _periodVacinating != null;

  void _initializeFields() {
    _vaccinationName = snapshotData['vaccination_name'] as String?;
    _ageOfChildInDays = castToType<int>(snapshotData['age_of_child_in_days']);
    _periodVacinating = snapshotData['period_vacinating'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vaccinations');

  static Stream<VaccinationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VaccinationsRecord.fromSnapshot(s));

  static Future<VaccinationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VaccinationsRecord.fromSnapshot(s));

  static VaccinationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VaccinationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VaccinationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VaccinationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VaccinationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VaccinationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVaccinationsRecordData({
  String? vaccinationName,
  int? ageOfChildInDays,
  String? periodVacinating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vaccination_name': vaccinationName,
      'age_of_child_in_days': ageOfChildInDays,
      'period_vacinating': periodVacinating,
    }.withoutNulls,
  );

  return firestoreData;
}

class VaccinationsRecordDocumentEquality
    implements Equality<VaccinationsRecord> {
  const VaccinationsRecordDocumentEquality();

  @override
  bool equals(VaccinationsRecord? e1, VaccinationsRecord? e2) {
    return e1?.vaccinationName == e2?.vaccinationName &&
        e1?.ageOfChildInDays == e2?.ageOfChildInDays &&
        e1?.periodVacinating == e2?.periodVacinating;
  }

  @override
  int hash(VaccinationsRecord? e) => const ListEquality()
      .hash([e?.vaccinationName, e?.ageOfChildInDays, e?.periodVacinating]);

  @override
  bool isValidKey(Object? o) => o is VaccinationsRecord;
}
