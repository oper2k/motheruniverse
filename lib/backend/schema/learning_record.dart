import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearningRecord extends FirestoreRecord {
  LearningRecord._(
    super.reference,
    super.data,
  ) {
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

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "sort" field.
  int? _sort;
  int get sort => _sort ?? 0;
  bool hasSort() => _sort != null;

  // "free_lesson" field.
  bool? _freeLesson;
  bool get freeLesson => _freeLesson ?? false;
  bool hasFreeLesson() => _freeLesson != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "files" field.
  List<LearningFileStruct>? _files;
  List<LearningFileStruct> get files => _files ?? const [];
  bool hasFiles() => _files != null;

  // "lesson_video_link" field.
  String? _lessonVideoLink;
  String get lessonVideoLink => _lessonVideoLink ?? '';
  bool hasLessonVideoLink() => _lessonVideoLink != null;

  // "date_of_publication" field.
  DateTime? _dateOfPublication;
  DateTime? get dateOfPublication => _dateOfPublication;
  bool hasDateOfPublication() => _dateOfPublication != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "price_before_discount" field.
  double? _priceBeforeDiscount;
  double get priceBeforeDiscount => _priceBeforeDiscount ?? 0.0;
  bool hasPriceBeforeDiscount() => _priceBeforeDiscount != null;

  // "revenueCatID" field.
  String? _revenueCatID;
  String get revenueCatID => _revenueCatID ?? '';
  bool hasRevenueCatID() => _revenueCatID != null;

  // "lesson_image" field.
  String? _lessonImage;
  String get lessonImage => _lessonImage ?? '';
  bool hasLessonImage() => _lessonImage != null;

  // "time_code" field.
  String? _timeCode;
  String get timeCode => _timeCode ?? '';
  bool hasTimeCode() => _timeCode != null;

  void _initializeFields() {
    _preview = snapshotData['preview'] as String?;
    _title = snapshotData['title'] as String?;
    _category = snapshotData['category'] as String?;
    _sort = castToType<int>(snapshotData['sort']);
    _freeLesson = snapshotData['free_lesson'] as bool?;
    _description = snapshotData['description'] as String?;
    _files = getStructList(
      snapshotData['files'],
      LearningFileStruct.fromMap,
    );
    _lessonVideoLink = snapshotData['lesson_video_link'] as String?;
    _dateOfPublication = snapshotData['date_of_publication'] as DateTime?;
    _price = castToType<double>(snapshotData['price']);
    _priceBeforeDiscount =
        castToType<double>(snapshotData['price_before_discount']);
    _revenueCatID = snapshotData['revenueCatID'] as String?;
    _lessonImage = snapshotData['lesson_image'] as String?;
    _timeCode = snapshotData['time_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('learning');

  static Stream<LearningRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LearningRecord.fromSnapshot(s));

  static Future<LearningRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LearningRecord.fromSnapshot(s));

  static LearningRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LearningRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LearningRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LearningRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LearningRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LearningRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLearningRecordData({
  String? preview,
  String? title,
  String? category,
  int? sort,
  bool? freeLesson,
  String? description,
  String? lessonVideoLink,
  DateTime? dateOfPublication,
  double? price,
  double? priceBeforeDiscount,
  String? revenueCatID,
  String? lessonImage,
  String? timeCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'preview': preview,
      'title': title,
      'category': category,
      'sort': sort,
      'free_lesson': freeLesson,
      'description': description,
      'lesson_video_link': lessonVideoLink,
      'date_of_publication': dateOfPublication,
      'price': price,
      'price_before_discount': priceBeforeDiscount,
      'revenueCatID': revenueCatID,
      'lesson_image': lessonImage,
      'time_code': timeCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class LearningRecordDocumentEquality implements Equality<LearningRecord> {
  const LearningRecordDocumentEquality();

  @override
  bool equals(LearningRecord? e1, LearningRecord? e2) {
    const listEquality = ListEquality();
    return e1?.preview == e2?.preview &&
        e1?.title == e2?.title &&
        e1?.category == e2?.category &&
        e1?.sort == e2?.sort &&
        e1?.freeLesson == e2?.freeLesson &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.files, e2?.files) &&
        e1?.lessonVideoLink == e2?.lessonVideoLink &&
        e1?.dateOfPublication == e2?.dateOfPublication &&
        e1?.price == e2?.price &&
        e1?.priceBeforeDiscount == e2?.priceBeforeDiscount &&
        e1?.revenueCatID == e2?.revenueCatID &&
        e1?.lessonImage == e2?.lessonImage &&
        e1?.timeCode == e2?.timeCode;
  }

  @override
  int hash(LearningRecord? e) => const ListEquality().hash([
        e?.preview,
        e?.title,
        e?.category,
        e?.sort,
        e?.freeLesson,
        e?.description,
        e?.files,
        e?.lessonVideoLink,
        e?.dateOfPublication,
        e?.price,
        e?.priceBeforeDiscount,
        e?.revenueCatID,
        e?.lessonImage,
        e?.timeCode
      ]);

  @override
  bool isValidKey(Object? o) => o is LearningRecord;
}
