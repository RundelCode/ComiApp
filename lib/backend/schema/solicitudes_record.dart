import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SolicitudesRecord extends FirestoreRecord {
  SolicitudesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombreDeLaTienda" field.
  String? _nombreDeLaTienda;
  String get nombreDeLaTienda => _nombreDeLaTienda ?? '';
  bool hasNombreDeLaTienda() => _nombreDeLaTienda != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "imagenDeValidacion" field.
  String? _imagenDeValidacion;
  String get imagenDeValidacion => _imagenDeValidacion ?? '';
  bool hasImagenDeValidacion() => _imagenDeValidacion != null;

  // "cedula" field.
  String? _cedula;
  String get cedula => _cedula ?? '';
  bool hasCedula() => _cedula != null;

  // "idDelUsuario" field.
  String? _idDelUsuario;
  String get idDelUsuario => _idDelUsuario ?? '';
  bool hasIdDelUsuario() => _idDelUsuario != null;

  // "nombreDelUsuario" field.
  String? _nombreDelUsuario;
  String get nombreDelUsuario => _nombreDelUsuario ?? '';
  bool hasNombreDelUsuario() => _nombreDelUsuario != null;

  void _initializeFields() {
    _nombreDeLaTienda = snapshotData['nombreDeLaTienda'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _codigo = snapshotData['codigo'] as String?;
    _imagenDeValidacion = snapshotData['imagenDeValidacion'] as String?;
    _cedula = snapshotData['cedula'] as String?;
    _idDelUsuario = snapshotData['idDelUsuario'] as String?;
    _nombreDelUsuario = snapshotData['nombreDelUsuario'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Solicitudes');

  static Stream<SolicitudesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SolicitudesRecord.fromSnapshot(s));

  static Future<SolicitudesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SolicitudesRecord.fromSnapshot(s));

  static SolicitudesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SolicitudesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SolicitudesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SolicitudesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SolicitudesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SolicitudesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSolicitudesRecordData({
  String? nombreDeLaTienda,
  DateTime? fecha,
  String? codigo,
  String? imagenDeValidacion,
  String? cedula,
  String? idDelUsuario,
  String? nombreDelUsuario,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombreDeLaTienda': nombreDeLaTienda,
      'fecha': fecha,
      'codigo': codigo,
      'imagenDeValidacion': imagenDeValidacion,
      'cedula': cedula,
      'idDelUsuario': idDelUsuario,
      'nombreDelUsuario': nombreDelUsuario,
    }.withoutNulls,
  );

  return firestoreData;
}

class SolicitudesRecordDocumentEquality implements Equality<SolicitudesRecord> {
  const SolicitudesRecordDocumentEquality();

  @override
  bool equals(SolicitudesRecord? e1, SolicitudesRecord? e2) {
    return e1?.nombreDeLaTienda == e2?.nombreDeLaTienda &&
        e1?.fecha == e2?.fecha &&
        e1?.codigo == e2?.codigo &&
        e1?.imagenDeValidacion == e2?.imagenDeValidacion &&
        e1?.cedula == e2?.cedula &&
        e1?.idDelUsuario == e2?.idDelUsuario &&
        e1?.nombreDelUsuario == e2?.nombreDelUsuario;
  }

  @override
  int hash(SolicitudesRecord? e) => const ListEquality().hash([
        e?.nombreDeLaTienda,
        e?.fecha,
        e?.codigo,
        e?.imagenDeValidacion,
        e?.cedula,
        e?.idDelUsuario,
        e?.nombreDelUsuario
      ]);

  @override
  bool isValidKey(Object? o) => o is SolicitudesRecord;
}
