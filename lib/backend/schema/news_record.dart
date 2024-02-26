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

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "creation_date" field.
  DateTime? _creationDate;
  DateTime? get creationDate => _creationDate;
  bool hasCreationDate() => _creationDate != null;

  // "button_text" field.
  String? _buttonText;
  String get buttonText => _buttonText ?? '';
  bool hasButtonText() => _buttonText != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _theNew = snapshotData['the_new'] as String?;
    _link = snapshotData['link'] as String?;
    _creationDate = snapshotData['creation_date'] as DateTime?;
    _buttonText = snapshotData['button_text'] as String?;
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
  String? link,
  DateTime? creationDate,
  String? buttonText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image': image,
      'the_new': theNew,
      'link': link,
      'creation_date': creationDate,
      'button_text': buttonText,
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
        e1?.link == e2?.link &&
        e1?.creationDate == e2?.creationDate &&
        e1?.buttonText == e2?.buttonText;
  }

  @override
  int hash(NewsRecord? e) => const ListEquality().hash(
      [e?.title, e?.image, e?.theNew, e?.link, e?.creationDate, e?.buttonText]);

  @override
  bool isValidKey(Object? o) => o is NewsRecord;
}
