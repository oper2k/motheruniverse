import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsRecord extends FirestoreRecord {
  NewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "the_new" field.
  String? _theNew;
  String get theNew => _theNew ?? '';
  bool hasTheNew() => _theNew != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _theNew = snapshotData['the_new'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news');

  static Stream<NewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsRecord.fromSnapshot(s));

  static Future<NewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsRecord.fromSnapshot(s));

  static NewsRecord fromSnapshot(DocumentSnapshot snapshot) => NewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsRecordData({
  String? title,
  String? image,
  String? theNew,
  int? sort,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image': image,
      'the_new': theNew,
      'sort': sort,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsRecordDocumentEquality implements Equality<NewsRecord> {
  const NewsRecordDocumentEquality();

  @override
  bool equals(NewsRecord? e1, NewsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.theNew == e2?.theNew &&
        e1?.sort == e2?.sort &&
        e1?.link == e2?.link;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality()
      .hash([e?.title, e?.image, e?.theNew, e?.sort, e?.link]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
