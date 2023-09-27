import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventEntryRecord extends FirestoreRecord {
  EventEntryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "event_name" field.
  String? _eventName;
  String get eventName => _eventName ?? '';
  bool hasEventName() => _eventName != null;

  // "event_date" field.
  String? _eventDate;
  String get eventDate => _eventDate ?? '';
  bool hasEventDate() => _eventDate != null;

  // "event_time" field.
  String? _eventTime;
  String get eventTime => _eventTime ?? '';
  bool hasEventTime() => _eventTime != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  bool hasUserEmail() => _userEmail != null;

  // "user_phone_number" field.
  String? _userPhoneNumber;
  String get userPhoneNumber => _userPhoneNumber ?? '';
  bool hasUserPhoneNumber() => _userPhoneNumber != null;

  // "child_age" field.
  String? _childAge;
  String get childAge => _childAge ?? '';
  bool hasChildAge() => _childAge != null;

  // "user_case" field.
  String? _userCase;
  String get userCase => _userCase ?? '';
  bool hasUserCase() => _userCase != null;

  void _initializeFields() {
    _eventName = snapshotData['event_name'] as String?;
    _eventDate = snapshotData['event_date'] as String?;
    _eventTime = snapshotData['event_time'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _userEmail = snapshotData['user_email'] as String?;
    _userPhoneNumber = snapshotData['user_phone_number'] as String?;
    _childAge = snapshotData['child_age'] as String?;
    _userCase = snapshotData['user_case'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('event_entry');

  static Stream<EventEntryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventEntryRecord.fromSnapshot(s));

  static Future<EventEntryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventEntryRecord.fromSnapshot(s));

  static EventEntryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventEntryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventEntryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventEntryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventEntryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventEntryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventEntryRecordData({
  String? eventName,
  String? eventDate,
  String? eventTime,
  String? userName,
  String? userEmail,
  String? userPhoneNumber,
  String? childAge,
  String? userCase,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'event_name': eventName,
      'event_date': eventDate,
      'event_time': eventTime,
      'user_name': userName,
      'user_email': userEmail,
      'user_phone_number': userPhoneNumber,
      'child_age': childAge,
      'user_case': userCase,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventEntryRecordDocumentEquality implements Equality<EventEntryRecord> {
  const EventEntryRecordDocumentEquality();

  @override
  bool equals(EventEntryRecord? e1, EventEntryRecord? e2) {
    return e1?.eventName == e2?.eventName &&
        e1?.eventDate == e2?.eventDate &&
        e1?.eventTime == e2?.eventTime &&
        e1?.userName == e2?.userName &&
        e1?.userEmail == e2?.userEmail &&
        e1?.userPhoneNumber == e2?.userPhoneNumber &&
        e1?.childAge == e2?.childAge &&
        e1?.userCase == e2?.userCase;
  }

  @override
  int hash(EventEntryRecord? e) => const ListEquality().hash([
        e?.eventName,
        e?.eventDate,
        e?.eventTime,
        e?.userName,
        e?.userEmail,
        e?.userPhoneNumber,
        e?.childAge,
        e?.userCase
      ]);

  @override
  bool isValidKey(Object? o) => o is EventEntryRecord;
}
