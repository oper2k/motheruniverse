import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdvicesRecord extends FirestoreRecord {
  AdvicesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "weeks" field.
  String? _weeks;
  String get weeks => _weeks ?? '';
  bool hasWeeks() => _weeks != null;

  // "listOfAdvices" field.
  List<String>? _listOfAdvices;
  List<String> get listOfAdvices => _listOfAdvices ?? const [];
  bool hasListOfAdvices() => _listOfAdvices != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _weeks = snapshotData['weeks'] as String?;
    _listOfAdvices = getDataList(snapshotData['listOfAdvices']);
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('advices');

  static Stream<AdvicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdvicesRecord.fromSnapshot(s));

  static Future<AdvicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdvicesRecord.fromSnapshot(s));

  static AdvicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdvicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdvicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdvicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdvicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdvicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdvicesRecordData({
  String? weeks,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'weeks': weeks,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdvicesRecordDocumentEquality implements Equality<AdvicesRecord> {
  const AdvicesRecordDocumentEquality();

  @override
  bool equals(AdvicesRecord? e1, AdvicesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.weeks == e2?.weeks &&
        listEquality.equals(e1?.listOfAdvices, e2?.listOfAdvices) &&
        e1?.sort == e2?.sort;
  }

  @override
  int hash(AdvicesRecord? e) =>
      const ListEquality().hash([e?.weeks, e?.listOfAdvices, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is AdvicesRecord;
}
