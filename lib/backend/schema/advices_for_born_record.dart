import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvicesForBornRecord extends FirestoreRecord {
  AdvicesForBornRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "advices" field.
  List<String>? _advices;
  List<String> get advices => _advices ?? const [];
  bool hasAdvices() => _advices != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _age = snapshotData['age'] as String?;
    _advices = getDataList(snapshotData['advices']);
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advices_for_born');

  static Stream<AdvicesForBornRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdvicesForBornRecord.fromSnapshot(s));

  static Future<AdvicesForBornRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdvicesForBornRecord.fromSnapshot(s));

  static AdvicesForBornRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdvicesForBornRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvicesForBornRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvicesForBornRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvicesForBornRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvicesForBornRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdvicesForBornRecordData({
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

class AdvicesForBornRecordDocumentEquality
    implements Equality<AdvicesForBornRecord> {
  const AdvicesForBornRecordDocumentEquality();

  @override
  bool equals(AdvicesForBornRecord? e1, AdvicesForBornRecord? e2) {
    const listEquality = ListEquality();
    return e1?.age == e2?.age &&
        listEquality.equals(e1?.advices, e2?.advices) &&
        e1?.sort == e2?.sort;
  }

  @override
  int hash(AdvicesForBornRecord? e) =>
      const ListEquality().hash([e?.age, e?.advices, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is AdvicesForBornRecord;
}
