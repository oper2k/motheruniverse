import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PodcastsRecord extends FirestoreRecord {
  PodcastsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _duration = snapshotData['duration'] as String?;
    _image = snapshotData['image'] as String?;
    _link = snapshotData['link'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('podcasts');

  static Stream<PodcastsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PodcastsRecord.fromSnapshot(s));

  static Future<PodcastsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PodcastsRecord.fromSnapshot(s));

  static PodcastsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PodcastsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PodcastsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PodcastsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PodcastsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PodcastsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPodcastsRecordData({
  String? title,
  String? duration,
  String? image,
  String? link,
  int? sort,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'duration': duration,
      'image': image,
      'link': link,
      'sort': sort,
    }.withoutNulls,
  );

  return firestoreData;
}

class PodcastsRecordDocumentEquality implements Equality<PodcastsRecord> {
  const PodcastsRecordDocumentEquality();

  @override
  bool equals(PodcastsRecord? e1, PodcastsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.duration == e2?.duration &&
        e1?.image == e2?.image &&
        e1?.link == e2?.link &&
        e1?.sort == e2?.sort;
  }

  @override
  int hash(PodcastsRecord? e) => const ListEquality()
      .hash([e?.title, e?.duration, e?.image, e?.link, e?.sort]);

  @override
  bool isValidKey(Object? o) => o is PodcastsRecord;
}
