import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckListGroupItemsRecord extends FirestoreRecord {
  CheckListGroupItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "attention_title" field.
  String? _attentionTitle;
  String get attentionTitle => _attentionTitle ?? '';
  bool hasAttentionTitle() => _attentionTitle != null;

  // "attention_description" field.
  String? _attentionDescription;
  String get attentionDescription => _attentionDescription ?? '';
  bool hasAttentionDescription() => _attentionDescription != null;

  // "group" field.
  String? _group;
  String get group => _group ?? '';
  bool hasGroup() => _group != null;

  // "check_name" field.
  String? _checkName;
  String get checkName => _checkName ?? '';
  bool hasCheckName() => _checkName != null;

  // "check_description" field.
  String? _checkDescription;
  String get checkDescription => _checkDescription ?? '';
  bool hasCheckDescription() => _checkDescription != null;

  // "warning_black" field.
  String? _warningBlack;
  String get warningBlack => _warningBlack ?? '';
  bool hasWarningBlack() => _warningBlack != null;

  // "warning_red" field.
  String? _warningRed;
  String get warningRed => _warningRed ?? '';
  bool hasWarningRed() => _warningRed != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _attentionTitle = snapshotData['attention_title'] as String?;
    _attentionDescription = snapshotData['attention_description'] as String?;
    _group = snapshotData['group'] as String?;
    _checkName = snapshotData['check_name'] as String?;
    _checkDescription = snapshotData['check_description'] as String?;
    _warningBlack = snapshotData['warning_black'] as String?;
    _warningRed = snapshotData['warning_red'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('check_list_group_items')
          : FirebaseFirestore.instance
              .collectionGroup('check_list_group_items');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('check_list_group_items').doc();

  static Stream<CheckListGroupItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckListGroupItemsRecord.fromSnapshot(s));

  static Future<CheckListGroupItemsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CheckListGroupItemsRecord.fromSnapshot(s));

  static CheckListGroupItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckListGroupItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckListGroupItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckListGroupItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckListGroupItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckListGroupItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckListGroupItemsRecordData({
  String? attentionTitle,
  String? attentionDescription,
  String? group,
  String? checkName,
  String? checkDescription,
  String? warningBlack,
  String? warningRed,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'attention_title': attentionTitle,
      'attention_description': attentionDescription,
      'group': group,
      'check_name': checkName,
      'check_description': checkDescription,
      'warning_black': warningBlack,
      'warning_red': warningRed,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckListGroupItemsRecordDocumentEquality
    implements Equality<CheckListGroupItemsRecord> {
  const CheckListGroupItemsRecordDocumentEquality();

  @override
  bool equals(CheckListGroupItemsRecord? e1, CheckListGroupItemsRecord? e2) {
    return e1?.attentionTitle == e2?.attentionTitle &&
        e1?.attentionDescription == e2?.attentionDescription &&
        e1?.group == e2?.group &&
        e1?.checkName == e2?.checkName &&
        e1?.checkDescription == e2?.checkDescription &&
        e1?.warningBlack == e2?.warningBlack &&
        e1?.warningRed == e2?.warningRed &&
        e1?.sort == e2?.sort;
  }

  @override
  int hash(CheckListGroupItemsRecord? e) => const ListEquality().hash([
        e?.attentionTitle,
        e?.attentionDescription,
        e?.group,
        e?.checkName,
        e?.checkDescription,
        e?.warningBlack,
        e?.warningRed,
        e?.sort
      ]);

  @override
  bool isValidKey(Object? o) => o is CheckListGroupItemsRecord;
}
