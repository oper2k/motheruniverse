import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class RecommendedAnalizesRecord extends FirestoreRecord {
  RecommendedAnalizesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "week" field.
  String? _week;
  String get week => _week ?? '';
  bool hasWeek() => _week != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _week = snapshotData['week'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recommendedAnalizes');

  static Stream<RecommendedAnalizesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecommendedAnalizesRecord.fromSnapshot(s));

  static Future<RecommendedAnalizesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => RecommendedAnalizesRecord.fromSnapshot(s));

  static RecommendedAnalizesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecommendedAnalizesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecommendedAnalizesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecommendedAnalizesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecommendedAnalizesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecommendedAnalizesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecommendedAnalizesRecordData({
  String? week,
  String? name,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'week': week,
      'name': name,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecommendedAnalizesRecordDocumentEquality
    implements Equality<RecommendedAnalizesRecord> {
  const RecommendedAnalizesRecordDocumentEquality();

  @override
  bool equals(RecommendedAnalizesRecord? e1, RecommendedAnalizesRecord? e2) {
    return e1?.week == e2?.week &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description;
  }

  @override
  int hash(RecommendedAnalizesRecord? e) =>
      const ListEquality().hash([e?.week, e?.name, e?.description]);

  @override
  bool isValidKey(Object? o) => o is RecommendedAnalizesRecord;
}
