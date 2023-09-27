import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaintsRecord extends FirestoreRecord {
  PaintsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paints');

  static Stream<PaintsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaintsRecord.fromSnapshot(s));

  static Future<PaintsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaintsRecord.fromSnapshot(s));

  static PaintsRecord fromSnapshot(DocumentSnapshot snapshot) => PaintsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaintsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaintsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaintsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaintsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaintsRecordData({
  String? title,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaintsRecordDocumentEquality implements Equality<PaintsRecord> {
  const PaintsRecordDocumentEquality();

  @override
  bool equals(PaintsRecord? e1, PaintsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(PaintsRecord? e) => const ListEquality().hash([e?.title, e?.images]);

  @override
  bool isValidKey(Object? o) => o is PaintsRecord;
}
