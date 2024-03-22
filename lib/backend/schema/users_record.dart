import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "second_name" field.
  String? _secondName;
  String get secondName => _secondName ?? '';
  bool hasSecondName() => _secondName != null;

  // "loyalty_program_activated" field.
  bool? _loyaltyProgramActivated;
  bool get loyaltyProgramActivated => _loyaltyProgramActivated ?? false;
  bool hasLoyaltyProgramActivated() => _loyaltyProgramActivated != null;

  // "conception_date" field.
  DateTime? _conceptionDate;
  DateTime? get conceptionDate => _conceptionDate;
  bool hasConceptionDate() => _conceptionDate != null;

  // "telegram" field.
  String? _telegram;
  String get telegram => _telegram ?? '';
  bool hasTelegram() => _telegram != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "user_info" field.
  String? _userInfo;
  String get userInfo => _userInfo ?? '';
  bool hasUserInfo() => _userInfo != null;

  // "first_bonus_is_claimed" field.
  bool? _firstBonusIsClaimed;
  bool get firstBonusIsClaimed => _firstBonusIsClaimed ?? false;
  bool hasFirstBonusIsClaimed() => _firstBonusIsClaimed != null;

  // "have_purchases" field.
  bool? _havePurchases;
  bool get havePurchases => _havePurchases ?? false;
  bool hasHavePurchases() => _havePurchases != null;

  // "pass_tasks" field.
  List<String>? _passTasks;
  List<String> get passTasks => _passTasks ?? const [];
  bool hasPassTasks() => _passTasks != null;

  // "pass_analizes" field.
  List<AnalysisStruct>? _passAnalizes;
  List<AnalysisStruct> get passAnalizes => _passAnalizes ?? const [];
  bool hasPassAnalizes() => _passAnalizes != null;

  // "pass_analizes_string" field.
  List<String>? _passAnalizesString;
  List<String> get passAnalizesString => _passAnalizesString ?? const [];
  bool hasPassAnalizesString() => _passAnalizesString != null;

  // "profile_is_filled" field.
  bool? _profileIsFilled;
  bool get profileIsFilled => _profileIsFilled ?? false;
  bool hasProfileIsFilled() => _profileIsFilled != null;

  // "at_least_one_child_is_added" field.
  bool? _atLeastOneChildIsAdded;
  bool get atLeastOneChildIsAdded => _atLeastOneChildIsAdded ?? false;
  bool hasAtLeastOneChildIsAdded() => _atLeastOneChildIsAdded != null;

  // "passed_vaccines" field.
  List<VaccineStruct>? _passedVaccines;
  List<VaccineStruct> get passedVaccines => _passedVaccines ?? const [];
  bool hasPassedVaccines() => _passedVaccines != null;

  // "passed_doctors" field.
  List<String>? _passedDoctors;
  List<String> get passedDoctors => _passedDoctors ?? const [];
  bool hasPassedDoctors() => _passedDoctors != null;

  // "passed_check_list" field.
  List<String>? _passedCheckList;
  List<String> get passedCheckList => _passedCheckList ?? const [];
  bool hasPassedCheckList() => _passedCheckList != null;

  // "purchased_lessons" field.
  List<String>? _purchasedLessons;
  List<String> get purchasedLessons => _purchasedLessons ?? const [];
  bool hasPurchasedLessons() => _purchasedLessons != null;

  // "loyalty_bonuses" field.
  double? _loyaltyBonuses;
  double get loyaltyBonuses => _loyaltyBonuses ?? 0.0;
  bool hasLoyaltyBonuses() => _loyaltyBonuses != null;

  // "last_time_checked_location" field.
  DateTime? _lastTimeCheckedLocation;
  DateTime? get lastTimeCheckedLocation => _lastTimeCheckedLocation;
  bool hasLastTimeCheckedLocation() => _lastTimeCheckedLocation != null;

  // "last_location" field.
  LatLng? _lastLocation;
  LatLng? get lastLocation => _lastLocation;
  bool hasLastLocation() => _lastLocation != null;

  // "fill_profile_bonus_claimed" field.
  bool? _fillProfileBonusClaimed;
  bool get fillProfileBonusClaimed => _fillProfileBonusClaimed ?? false;
  bool hasFillProfileBonusClaimed() => _fillProfileBonusClaimed != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "birthday_bonus_claimed_years" field.
  List<String>? _birthdayBonusClaimedYears;
  List<String> get birthdayBonusClaimedYears =>
      _birthdayBonusClaimedYears ?? const [];
  bool hasBirthdayBonusClaimedYears() => _birthdayBonusClaimedYears != null;

  // "feedback_sent_bonus_claimed" field.
  bool? _feedbackSentBonusClaimed;
  bool get feedbackSentBonusClaimed => _feedbackSentBonusClaimed ?? false;
  bool hasFeedbackSentBonusClaimed() => _feedbackSentBonusClaimed != null;

  // "trackers_adding_dates" field.
  List<DateTime>? _trackersAddingDates;
  List<DateTime> get trackersAddingDates => _trackersAddingDates ?? const [];
  bool hasTrackersAddingDates() => _trackersAddingDates != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _secondName = snapshotData['second_name'] as String?;
    _loyaltyProgramActivated =
        snapshotData['loyalty_program_activated'] as bool?;
    _conceptionDate = snapshotData['conception_date'] as DateTime?;
    _telegram = snapshotData['telegram'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _userInfo = snapshotData['user_info'] as String?;
    _firstBonusIsClaimed = snapshotData['first_bonus_is_claimed'] as bool?;
    _havePurchases = snapshotData['have_purchases'] as bool?;
    _passTasks = getDataList(snapshotData['pass_tasks']);
    _passAnalizes = getStructList(
      snapshotData['pass_analizes'],
      AnalysisStruct.fromMap,
    );
    _passAnalizesString = getDataList(snapshotData['pass_analizes_string']);
    _profileIsFilled = snapshotData['profile_is_filled'] as bool?;
    _atLeastOneChildIsAdded =
        snapshotData['at_least_one_child_is_added'] as bool?;
    _passedVaccines = getStructList(
      snapshotData['passed_vaccines'],
      VaccineStruct.fromMap,
    );
    _passedDoctors = getDataList(snapshotData['passed_doctors']);
    _passedCheckList = getDataList(snapshotData['passed_check_list']);
    _purchasedLessons = getDataList(snapshotData['purchased_lessons']);
    _loyaltyBonuses = castToType<double>(snapshotData['loyalty_bonuses']);
    _lastTimeCheckedLocation =
        snapshotData['last_time_checked_location'] as DateTime?;
    _lastLocation = snapshotData['last_location'] as LatLng?;
    _fillProfileBonusClaimed =
        snapshotData['fill_profile_bonus_claimed'] as bool?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _birthdayBonusClaimedYears =
        getDataList(snapshotData['birthday_bonus_claimed_years']);
    _feedbackSentBonusClaimed =
        snapshotData['feedback_sent_bonus_claimed'] as bool?;
    _trackersAddingDates = getDataList(snapshotData['trackers_adding_dates']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? secondName,
  bool? loyaltyProgramActivated,
  DateTime? conceptionDate,
  String? telegram,
  String? instagram,
  String? userInfo,
  bool? firstBonusIsClaimed,
  bool? havePurchases,
  bool? profileIsFilled,
  bool? atLeastOneChildIsAdded,
  double? loyaltyBonuses,
  DateTime? lastTimeCheckedLocation,
  LatLng? lastLocation,
  bool? fillProfileBonusClaimed,
  DateTime? birthday,
  bool? feedbackSentBonusClaimed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'second_name': secondName,
      'loyalty_program_activated': loyaltyProgramActivated,
      'conception_date': conceptionDate,
      'telegram': telegram,
      'instagram': instagram,
      'user_info': userInfo,
      'first_bonus_is_claimed': firstBonusIsClaimed,
      'have_purchases': havePurchases,
      'profile_is_filled': profileIsFilled,
      'at_least_one_child_is_added': atLeastOneChildIsAdded,
      'loyalty_bonuses': loyaltyBonuses,
      'last_time_checked_location': lastTimeCheckedLocation,
      'last_location': lastLocation,
      'fill_profile_bonus_claimed': fillProfileBonusClaimed,
      'birthday': birthday,
      'feedback_sent_bonus_claimed': feedbackSentBonusClaimed,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.firstName == e2?.firstName &&
        e1?.secondName == e2?.secondName &&
        e1?.loyaltyProgramActivated == e2?.loyaltyProgramActivated &&
        e1?.conceptionDate == e2?.conceptionDate &&
        e1?.telegram == e2?.telegram &&
        e1?.instagram == e2?.instagram &&
        e1?.userInfo == e2?.userInfo &&
        e1?.firstBonusIsClaimed == e2?.firstBonusIsClaimed &&
        e1?.havePurchases == e2?.havePurchases &&
        listEquality.equals(e1?.passTasks, e2?.passTasks) &&
        listEquality.equals(e1?.passAnalizes, e2?.passAnalizes) &&
        listEquality.equals(e1?.passAnalizesString, e2?.passAnalizesString) &&
        e1?.profileIsFilled == e2?.profileIsFilled &&
        e1?.atLeastOneChildIsAdded == e2?.atLeastOneChildIsAdded &&
        listEquality.equals(e1?.passedVaccines, e2?.passedVaccines) &&
        listEquality.equals(e1?.passedDoctors, e2?.passedDoctors) &&
        listEquality.equals(e1?.passedCheckList, e2?.passedCheckList) &&
        listEquality.equals(e1?.purchasedLessons, e2?.purchasedLessons) &&
        e1?.loyaltyBonuses == e2?.loyaltyBonuses &&
        e1?.lastTimeCheckedLocation == e2?.lastTimeCheckedLocation &&
        e1?.lastLocation == e2?.lastLocation &&
        e1?.fillProfileBonusClaimed == e2?.fillProfileBonusClaimed &&
        e1?.birthday == e2?.birthday &&
        listEquality.equals(
            e1?.birthdayBonusClaimedYears, e2?.birthdayBonusClaimedYears) &&
        e1?.feedbackSentBonusClaimed == e2?.feedbackSentBonusClaimed &&
        listEquality.equals(e1?.trackersAddingDates, e2?.trackersAddingDates);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.firstName,
        e?.secondName,
        e?.loyaltyProgramActivated,
        e?.conceptionDate,
        e?.telegram,
        e?.instagram,
        e?.userInfo,
        e?.firstBonusIsClaimed,
        e?.havePurchases,
        e?.passTasks,
        e?.passAnalizes,
        e?.passAnalizesString,
        e?.profileIsFilled,
        e?.atLeastOneChildIsAdded,
        e?.passedVaccines,
        e?.passedDoctors,
        e?.passedCheckList,
        e?.purchasedLessons,
        e?.loyaltyBonuses,
        e?.lastTimeCheckedLocation,
        e?.lastLocation,
        e?.fillProfileBonusClaimed,
        e?.birthday,
        e?.birthdayBonusClaimedYears,
        e?.feedbackSentBonusClaimed,
        e?.trackersAddingDates
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
