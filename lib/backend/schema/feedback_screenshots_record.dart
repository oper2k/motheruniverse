import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FeedbackScreenshotsRecord extends FirestoreRecord {
  FeedbackScreenshotsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "screenshot" field.
  String? _screenshot;
  String get screenshot => _screenshot ?? '';
  bool hasScreenshot() => _screenshot != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _screenshot = snapshotData['screenshot'] as String?;
    _userId = snapshotData['user_id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feedback_screenshots');

  static Stream<FeedbackScreenshotsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackScreenshotsRecord.fromSnapshot(s));

  static Future<FeedbackScreenshotsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FeedbackScreenshotsRecord.fromSnapshot(s));

  static FeedbackScreenshotsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackScreenshotsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackScreenshotsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackScreenshotsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackScreenshotsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackScreenshotsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackScreenshotsRecordData({
  String? screenshot,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'screenshot': screenshot,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackScreenshotsRecordDocumentEquality
    implements Equality<FeedbackScreenshotsRecord> {
  const FeedbackScreenshotsRecordDocumentEquality();

  @override
  bool equals(FeedbackScreenshotsRecord? e1, FeedbackScreenshotsRecord? e2) {
    return e1?.screenshot == e2?.screenshot && e1?.userId == e2?.userId;
  }

  @override
  int hash(FeedbackScreenshotsRecord? e) =>
      const ListEquality().hash([e?.screenshot, e?.userId]);

  @override
  bool isValidKey(Object? o) => o is FeedbackScreenshotsRecord;
}
