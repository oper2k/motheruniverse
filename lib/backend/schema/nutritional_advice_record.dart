import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NutritionalAdviceRecord extends FirestoreRecord {
  NutritionalAdviceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "recommendation" field.
  String? _recommendation;
  String get recommendation => _recommendation ?? '';
  bool hasRecommendation() => _recommendation != null;

  // "weekNumber" field.
  int? _weekNumber;
  int get weekNumber => _weekNumber ?? 0;
  bool hasWeekNumber() => _weekNumber != null;

  void _initializeFields() {
    _recommendation = snapshotData['recommendation'] as String?;
    _weekNumber = castToType<int>(snapshotData['weekNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nutritionalAdvice');

  static Stream<NutritionalAdviceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NutritionalAdviceRecord.fromSnapshot(s));

  static Future<NutritionalAdviceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => NutritionalAdviceRecord.fromSnapshot(s));

  static NutritionalAdviceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NutritionalAdviceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NutritionalAdviceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NutritionalAdviceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NutritionalAdviceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NutritionalAdviceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNutritionalAdviceRecordData({
  String? recommendation,
  int? weekNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recommendation': recommendation,
      'weekNumber': weekNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class NutritionalAdviceRecordDocumentEquality
    implements Equality<NutritionalAdviceRecord> {
  const NutritionalAdviceRecordDocumentEquality();

  @override
  bool equals(NutritionalAdviceRecord? e1, NutritionalAdviceRecord? e2) {
    return e1?.recommendation == e2?.recommendation &&
        e1?.weekNumber == e2?.weekNumber;
  }

  @override
  int hash(NutritionalAdviceRecord? e) =>
      const ListEquality().hash([e?.recommendation, e?.weekNumber]);

  @override
  bool isValidKey(Object? o) => o is NutritionalAdviceRecord;
}
