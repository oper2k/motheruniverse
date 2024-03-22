import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeekRecord extends FirestoreRecord {
  WeekRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "week_name" field.
  String? _weekName;
  String get weekName => _weekName ?? '';
  bool hasWeekName() => _weekName != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _weekName = snapshotData['week_name'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('week');

  static Stream<WeekRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WeekRecord.fromSnapshot(s));

  static Future<WeekRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WeekRecord.fromSnapshot(s));

  static WeekRecord fromSnapshot(DocumentSnapshot snapshot) => WeekRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WeekRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WeekRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WeekRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WeekRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWeekRecordData({
  String? weekName,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'week_name': weekName,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class WeekRecordDocumentEquality implements Equality<WeekRecord> {
  const WeekRecordDocumentEquality();

  @override
  bool equals(WeekRecord? e1, WeekRecord? e2) {
    return e1?.weekName == e2?.weekName && e1?.sort == e2?.sort;
  }

  @override
  int hash(WeekRecord? e) => const ListEquality().hash([e?.weekName, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is WeekRecord;
}
