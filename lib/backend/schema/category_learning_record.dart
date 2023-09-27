import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryLearningRecord extends FirestoreRecord {
  CategoryLearningRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category_learning');

  static Stream<CategoryLearningRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryLearningRecord.fromSnapshot(s));

  static Future<CategoryLearningRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CategoryLearningRecord.fromSnapshot(s));

  static CategoryLearningRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryLearningRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryLearningRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryLearningRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryLearningRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryLearningRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryLearningRecordData({
  String? categoryName,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryLearningRecordDocumentEquality
    implements Equality<CategoryLearningRecord> {
  const CategoryLearningRecordDocumentEquality();

  @override
  bool equals(CategoryLearningRecord? e1, CategoryLearningRecord? e2) {
    return e1?.categoryName == e2?.categoryName && e1?.sort == e2?.sort;
  }

  @override
  int hash(CategoryLearningRecord? e) =>
      const ListEquality().hash([e?.categoryName, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is CategoryLearningRecord;
}
