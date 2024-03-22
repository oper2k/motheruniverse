import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrackersRecord extends FirestoreRecord {
  TrackersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tracker_title" field.
  String? _trackerTitle;
  String get trackerTitle => _trackerTitle ?? '';
  bool hasTrackerTitle() => _trackerTitle != null;

  // "child_ref" field.
  DocumentReference? _childRef;
  DocumentReference? get childRef => _childRef;
  bool hasChildRef() => _childRef != null;

  // "breast_end_time" field.
  DateTime? _breastEndTime;
  DateTime? get breastEndTime => _breastEndTime;
  bool hasBreastEndTime() => _breastEndTime != null;

  // "sleep_end_time" field.
  DateTime? _sleepEndTime;
  DateTime? get sleepEndTime => _sleepEndTime;
  bool hasSleepEndTime() => _sleepEndTime != null;

  // "feeding_amount" field.
  String? _feedingAmount;
  String get feedingAmount => _feedingAmount ?? '';
  bool hasFeedingAmount() => _feedingAmount != null;

  // "breast_left_duration" field.
  int? _breastLeftDuration;
  int get breastLeftDuration => _breastLeftDuration ?? 0;
  bool hasBreastLeftDuration() => _breastLeftDuration != null;

  // "breast_right_duration" field.
  int? _breastRightDuration;
  int get breastRightDuration => _breastRightDuration ?? 0;
  bool hasBreastRightDuration() => _breastRightDuration != null;

  // "breast_total_duration" field.
  int? _breastTotalDuration;
  int get breastTotalDuration => _breastTotalDuration ?? 0;
  bool hasBreastTotalDuration() => _breastTotalDuration != null;

  // "sleep_total_duration" field.
  String? _sleepTotalDuration;
  String get sleepTotalDuration => _sleepTotalDuration ?? '';
  bool hasSleepTotalDuration() => _sleepTotalDuration != null;

  // "feeding_name" field.
  String? _feedingName;
  String get feedingName => _feedingName ?? '';
  bool hasFeedingName() => _feedingName != null;

  // "tracker_start_time" field.
  DateTime? _trackerStartTime;
  DateTime? get trackerStartTime => _trackerStartTime;
  bool hasTrackerStartTime() => _trackerStartTime != null;

  // "feeding_end_time" field.
  DateTime? _feedingEndTime;
  DateTime? get feedingEndTime => _feedingEndTime;
  bool hasFeedingEndTime() => _feedingEndTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _trackerTitle = snapshotData['tracker_title'] as String?;
    _childRef = snapshotData['child_ref'] as DocumentReference?;
    _breastEndTime = snapshotData['breast_end_time'] as DateTime?;
    _sleepEndTime = snapshotData['sleep_end_time'] as DateTime?;
    _feedingAmount = snapshotData['feeding_amount'] as String?;
    _breastLeftDuration = castToType<int>(snapshotData['breast_left_duration']);
    _breastRightDuration =
        castToType<int>(snapshotData['breast_right_duration']);
    _breastTotalDuration =
        castToType<int>(snapshotData['breast_total_duration']);
    _sleepTotalDuration = snapshotData['sleep_total_duration'] as String?;
    _feedingName = snapshotData['feeding_name'] as String?;
    _trackerStartTime = snapshotData['tracker_start_time'] as DateTime?;
    _feedingEndTime = snapshotData['feeding_end_time'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('trackers')
          : FirebaseFirestore.instance.collectionGroup('trackers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('trackers').doc(id);

  static Stream<TrackersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrackersRecord.fromSnapshot(s));

  static Future<TrackersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrackersRecord.fromSnapshot(s));

  static TrackersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TrackersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrackersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrackersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrackersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrackersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrackersRecordData({
  String? trackerTitle,
  DocumentReference? childRef,
  DateTime? breastEndTime,
  DateTime? sleepEndTime,
  String? feedingAmount,
  int? breastLeftDuration,
  int? breastRightDuration,
  int? breastTotalDuration,
  String? sleepTotalDuration,
  String? feedingName,
  DateTime? trackerStartTime,
  DateTime? feedingEndTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tracker_title': trackerTitle,
      'child_ref': childRef,
      'breast_end_time': breastEndTime,
      'sleep_end_time': sleepEndTime,
      'feeding_amount': feedingAmount,
      'breast_left_duration': breastLeftDuration,
      'breast_right_duration': breastRightDuration,
      'breast_total_duration': breastTotalDuration,
      'sleep_total_duration': sleepTotalDuration,
      'feeding_name': feedingName,
      'tracker_start_time': trackerStartTime,
      'feeding_end_time': feedingEndTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrackersRecordDocumentEquality implements Equality<TrackersRecord> {
  const TrackersRecordDocumentEquality();

  @override
  bool equals(TrackersRecord? e1, TrackersRecord? e2) {
    return e1?.trackerTitle == e2?.trackerTitle &&
        e1?.childRef == e2?.childRef &&
        e1?.breastEndTime == e2?.breastEndTime &&
        e1?.sleepEndTime == e2?.sleepEndTime &&
        e1?.feedingAmount == e2?.feedingAmount &&
        e1?.breastLeftDuration == e2?.breastLeftDuration &&
        e1?.breastRightDuration == e2?.breastRightDuration &&
        e1?.breastTotalDuration == e2?.breastTotalDuration &&
        e1?.sleepTotalDuration == e2?.sleepTotalDuration &&
        e1?.feedingName == e2?.feedingName &&
        e1?.trackerStartTime == e2?.trackerStartTime &&
        e1?.feedingEndTime == e2?.feedingEndTime;
  }

  @override
  int hash(TrackersRecord? e) => const ListEquality().hash([
        e?.trackerTitle,
        e?.childRef,
        e?.breastEndTime,
        e?.sleepEndTime,
        e?.feedingAmount,
        e?.breastLeftDuration,
        e?.breastRightDuration,
        e?.breastTotalDuration,
        e?.sleepTotalDuration,
        e?.feedingName,
        e?.trackerStartTime,
        e?.feedingEndTime
      ]);

  @override
  bool isValidKey(Object? o) => o is TrackersRecord;
}
