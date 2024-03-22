import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgeRecord extends FirestoreRecord {
  AgeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _age = snapshotData['age'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('age');

  static Stream<AgeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgeRecord.fromSnapshot(s));

  static Future<AgeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgeRecord.fromSnapshot(s));

  static AgeRecord fromSnapshot(DocumentSnapshot snapshot) => AgeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgeRecordData({
  String? age,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'age': age,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgeRecordDocumentEquality implements Equality<AgeRecord> {
  const AgeRecordDocumentEquality();

  @override
  bool equals(AgeRecord? e1, AgeRecord? e2) {
    return e1?.age == e2?.age && e1?.sort == e2?.sort;
  }

  @override
  int hash(AgeRecord? e) => const ListEquality().hash([e?.age, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is AgeRecord;
}
