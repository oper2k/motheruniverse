import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreatedVaccineRecord extends FirestoreRecord {
  CreatedVaccineRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vaccine_name" field.
  String? _vaccineName;
  String get vaccineName => _vaccineName ?? '';
  bool hasVaccineName() => _vaccineName != null;

  // "period_vaccinating" field.
  String? _periodVaccinating;
  String get periodVaccinating => _periodVaccinating ?? '';
  bool hasPeriodVaccinating() => _periodVaccinating != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "child" field.
  DocumentReference? _child;
  DocumentReference? get child => _child;
  bool hasChild() => _child != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _vaccineName = snapshotData['vaccine_name'] as String?;
    _periodVaccinating = snapshotData['period_vaccinating'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _child = snapshotData['child'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('created_vaccine')
          : FirebaseFirestore.instance.collectionGroup('created_vaccine');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('created_vaccine').doc();

  static Stream<CreatedVaccineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreatedVaccineRecord.fromSnapshot(s));

  static Future<CreatedVaccineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreatedVaccineRecord.fromSnapshot(s));

  static CreatedVaccineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreatedVaccineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreatedVaccineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreatedVaccineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreatedVaccineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreatedVaccineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreatedVaccineRecordData({
  String? vaccineName,
  String? periodVaccinating,
  DateTime? date,
  DocumentReference? child,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vaccine_name': vaccineName,
      'period_vaccinating': periodVaccinating,
      'date': date,
      'child': child,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreatedVaccineRecordDocumentEquality
    implements Equality<CreatedVaccineRecord> {
  const CreatedVaccineRecordDocumentEquality();

  @override
  bool equals(CreatedVaccineRecord? e1, CreatedVaccineRecord? e2) {
    return e1?.vaccineName == e2?.vaccineName &&
        e1?.periodVaccinating == e2?.periodVaccinating &&
        e1?.date == e2?.date &&
        e1?.child == e2?.child;
  }

  @override
  int hash(CreatedVaccineRecord? e) => const ListEquality()
      .hash([e?.vaccineName, e?.periodVaccinating, e?.date, e?.child]);

  @override
  bool isValidKey(Object? o) => o is CreatedVaccineRecord;
}
