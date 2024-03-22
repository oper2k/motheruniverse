import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VaccinatePeriodRecord extends FirestoreRecord {
  VaccinatePeriodRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "period" field.
  String? _period;
  String get period => _period ?? '';
  bool hasPeriod() => _period != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _period = snapshotData['period'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vaccinate_period');

  static Stream<VaccinatePeriodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VaccinatePeriodRecord.fromSnapshot(s));

  static Future<VaccinatePeriodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VaccinatePeriodRecord.fromSnapshot(s));

  static VaccinatePeriodRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VaccinatePeriodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VaccinatePeriodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VaccinatePeriodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VaccinatePeriodRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VaccinatePeriodRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVaccinatePeriodRecordData({
  String? period,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'period': period,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class VaccinatePeriodRecordDocumentEquality
    implements Equality<VaccinatePeriodRecord> {
  const VaccinatePeriodRecordDocumentEquality();

  @override
  bool equals(VaccinatePeriodRecord? e1, VaccinatePeriodRecord? e2) {
    return e1?.period == e2?.period && e1?.sort == e2?.sort;
  }

  @override
  int hash(VaccinatePeriodRecord? e) =>
      const ListEquality().hash([e?.period, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is VaccinatePeriodRecord;
}
