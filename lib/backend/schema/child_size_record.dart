import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildSizeRecord extends FirestoreRecord {
  ChildSizeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "object" field.
  String? _object;
  String get object => _object ?? '';
  bool hasObject() => _object != null;

  // "weekNumber" field.
  int? _weekNumber;
  int get weekNumber => _weekNumber ?? 0;
  bool hasWeekNumber() => _weekNumber != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _object = snapshotData['object'] as String?;
    _weekNumber = castToType<int>(snapshotData['weekNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('childSize');

  static Stream<ChildSizeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChildSizeRecord.fromSnapshot(s));

  static Future<ChildSizeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChildSizeRecord.fromSnapshot(s));

  static ChildSizeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChildSizeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChildSizeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChildSizeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChildSizeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChildSizeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChildSizeRecordData({
  String? image,
  String? object,
  int? weekNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'object': object,
      'weekNumber': weekNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChildSizeRecordDocumentEquality implements Equality<ChildSizeRecord> {
  const ChildSizeRecordDocumentEquality();

  @override
  bool equals(ChildSizeRecord? e1, ChildSizeRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.object == e2?.object &&
        e1?.weekNumber == e2?.weekNumber;
  }

  @override
  int hash(ChildSizeRecord? e) =>
      const ListEquality().hash([e?.image, e?.object, e?.weekNumber]);

  @override
  bool isValidKey(Object? o) => o is ChildSizeRecord;
}
