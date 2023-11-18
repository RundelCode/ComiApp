import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CiudadesRecord extends FirestoreRecord {
  CiudadesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  void _initializeFields() {
    _ciudad = snapshotData['ciudad'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ciudades');

  static Stream<CiudadesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CiudadesRecord.fromSnapshot(s));

  static Future<CiudadesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CiudadesRecord.fromSnapshot(s));

  static CiudadesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CiudadesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CiudadesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CiudadesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CiudadesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CiudadesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCiudadesRecordData({
  String? ciudad,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ciudad': ciudad,
    }.withoutNulls,
  );

  return firestoreData;
}

class CiudadesRecordDocumentEquality implements Equality<CiudadesRecord> {
  const CiudadesRecordDocumentEquality();

  @override
  bool equals(CiudadesRecord? e1, CiudadesRecord? e2) {
    return e1?.ciudad == e2?.ciudad;
  }

  @override
  int hash(CiudadesRecord? e) => const ListEquality().hash([e?.ciudad]);

  @override
  bool isValidKey(Object? o) => o is CiudadesRecord;
}
