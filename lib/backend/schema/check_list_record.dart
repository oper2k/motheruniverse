import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckListRecord extends FirestoreRecord {
  CheckListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "recommended_title" field.
  String? _recommendedTitle;
  String get recommendedTitle => _recommendedTitle ?? '';
  bool hasRecommendedTitle() => _recommendedTitle != null;

  // "recommended_description" field.
  String? _recommendedDescription;
  String get recommendedDescription => _recommendedDescription ?? '';
  bool hasRecommendedDescription() => _recommendedDescription != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  bool hasFile() => _file != null;

  // "groups" field.
  List<CheckListGroupsStruct>? _groups;
  List<CheckListGroupsStruct> get groups => _groups ?? const [];
  bool hasGroups() => _groups != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _recommendedTitle = snapshotData['recommended_title'] as String?;
    _recommendedDescription =
        snapshotData['recommended_description'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
    _image = snapshotData['image'] as String?;
    _file = snapshotData['file'] as String?;
    _groups = getStructList(
      snapshotData['groups'],
      CheckListGroupsStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('check_list');

  static Stream<CheckListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckListRecord.fromSnapshot(s));

  static Future<CheckListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckListRecord.fromSnapshot(s));

  static CheckListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckListRecordData({
  String? title,
  String? description,
  String? recommendedTitle,
  String? recommendedDescription,
  int? sort,
  String? image,
  String? file,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'recommended_title': recommendedTitle,
      'recommended_description': recommendedDescription,
      'sort': sort,
      'image': image,
      'file': file,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckListRecordDocumentEquality implements Equality<CheckListRecord> {
  const CheckListRecordDocumentEquality();

  @override
  bool equals(CheckListRecord? e1, CheckListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.recommendedTitle == e2?.recommendedTitle &&
        e1?.recommendedDescription == e2?.recommendedDescription &&
        e1?.sort == e2?.sort &&
        e1?.image == e2?.image &&
        e1?.file == e2?.file &&
        listEquality.equals(e1?.groups, e2?.groups);
  }

  @override
  int hash(CheckListRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.recommendedTitle,
        e?.recommendedDescription,
        e?.sort,
        e?.image,
        e?.file,
        e?.groups
      ]);

  @override
  bool isValidKey(Object? o) => o is CheckListRecord;
}
