import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoRecord extends FirestoreRecord {
  VideoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "preview" field.
  String? _preview;
  String get preview => _preview ?? '';
  bool hasPreview() => _preview != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "current_date" field.
  DateTime? _currentDate;
  DateTime? get currentDate => _currentDate;
  bool hasCurrentDate() => _currentDate != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _preview = snapshotData['preview'] as String?;
    _title = snapshotData['title'] as String?;
    _currentDate = snapshotData['current_date'] as DateTime?;
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('video');

  static Stream<VideoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoRecord.fromSnapshot(s));

  static Future<VideoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoRecord.fromSnapshot(s));

  static VideoRecord fromSnapshot(DocumentSnapshot snapshot) => VideoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoRecordData({
  String? preview,
  String? title,
  DateTime? currentDate,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preview': preview,
      'title': title,
      'current_date': currentDate,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoRecordDocumentEquality implements Equality<VideoRecord> {
  const VideoRecordDocumentEquality();

  @override
  bool equals(VideoRecord? e1, VideoRecord? e2) {
    return e1?.preview == e2?.preview &&
        e1?.title == e2?.title &&
        e1?.currentDate == e2?.currentDate &&
        e1?.link == e2?.link;
  }

  @override
  int hash(VideoRecord? e) => const ListEquality()
      .hash([e?.preview, e?.title, e?.currentDate, e?.link]);

  @override
  bool isValidKey(Object? o) => o is VideoRecord;
}
