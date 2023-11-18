import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class OfertasEspecialesRecord extends FirestoreRecord {
  OfertasEspecialesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "texto" field.
  String? _texto;
  String get texto => _texto ?? '';
  bool hasTexto() => _texto != null;

  // "validada" field.
  bool? _validada;
  bool get validada => _validada ?? false;
  bool hasValidada() => _validada != null;

  // "empresa" field.
  String? _empresa;
  String get empresa => _empresa ?? '';
  bool hasEmpresa() => _empresa != null;

  void _initializeFields() {
    _imagen = snapshotData['imagen'] as String?;
    _texto = snapshotData['texto'] as String?;
    _validada = snapshotData['validada'] as bool?;
    _empresa = snapshotData['empresa'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('OfertasEspeciales');

  static Stream<OfertasEspecialesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OfertasEspecialesRecord.fromSnapshot(s));

  static Future<OfertasEspecialesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => OfertasEspecialesRecord.fromSnapshot(s));

  static OfertasEspecialesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OfertasEspecialesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OfertasEspecialesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OfertasEspecialesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OfertasEspecialesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OfertasEspecialesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOfertasEspecialesRecordData({
  String? imagen,
  String? texto,
  bool? validada,
  String? empresa,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagen': imagen,
      'texto': texto,
      'validada': validada,
      'empresa': empresa,
    }.withoutNulls,
  );

  return firestoreData;
}

class OfertasEspecialesRecordDocumentEquality
    implements Equality<OfertasEspecialesRecord> {
  const OfertasEspecialesRecordDocumentEquality();

  @override
  bool equals(OfertasEspecialesRecord? e1, OfertasEspecialesRecord? e2) {
    return e1?.imagen == e2?.imagen &&
        e1?.texto == e2?.texto &&
        e1?.validada == e2?.validada &&
        e1?.empresa == e2?.empresa;
  }

  @override
  int hash(OfertasEspecialesRecord? e) =>
      const ListEquality().hash([e?.imagen, e?.texto, e?.validada, e?.empresa]);

  @override
  bool isValidKey(Object? o) => o is OfertasEspecialesRecord;
}
