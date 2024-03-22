import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BuyAllContentRecord extends FirestoreRecord {
  BuyAllContentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "preview" field.
  String? _preview;
  String get preview => _preview ?? '';
  bool hasPreview() => _preview != null;

  void _initializeFields() {
    _price = castToType<double>(snapshotData['price']);
    _preview = snapshotData['preview'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('buy_all_content');

  static Stream<BuyAllContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BuyAllContentRecord.fromSnapshot(s));

  static Future<BuyAllContentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BuyAllContentRecord.fromSnapshot(s));

  static BuyAllContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BuyAllContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BuyAllContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BuyAllContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BuyAllContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BuyAllContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBuyAllContentRecordData({
  double? price,
  String? preview,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'price': price,
      'preview': preview,
    }.withoutNulls,
  );

  return firestoreData;
}

class BuyAllContentRecordDocumentEquality
    implements Equality<BuyAllContentRecord> {
  const BuyAllContentRecordDocumentEquality();

  @override
  bool equals(BuyAllContentRecord? e1, BuyAllContentRecord? e2) {
    return e1?.price == e2?.price && e1?.preview == e2?.preview;
  }

  @override
  int hash(BuyAllContentRecord? e) =>
      const ListEquality().hash([e?.price, e?.preview]);

  @override
  bool isValidKey(Object? o) => o is BuyAllContentRecord;
}
