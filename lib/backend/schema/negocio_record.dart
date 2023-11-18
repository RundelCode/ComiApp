import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NegocioRecord extends FirestoreRecord {
  NegocioRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "idDelPropietario" field.
  String? _idDelPropietario;
  String get idDelPropietario => _idDelPropietario ?? '';
  bool hasIdDelPropietario() => _idDelPropietario != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "tipoDeNegocio" field.
  String? _tipoDeNegocio;
  String get tipoDeNegocio => _tipoDeNegocio ?? '';
  bool hasTipoDeNegocio() => _tipoDeNegocio != null;

  // "autenticado" field.
  bool? _autenticado;
  bool get autenticado => _autenticado ?? false;
  bool hasAutenticado() => _autenticado != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  bool hasFoto() => _foto != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "coordenadas" field.
  LatLng? _coordenadas;
  LatLng? get coordenadas => _coordenadas;
  bool hasCoordenadas() => _coordenadas != null;

  // "ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _idDelPropietario = snapshotData['idDelPropietario'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _descripcion = snapshotData['descripcion'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _tipoDeNegocio = snapshotData['tipoDeNegocio'] as String?;
    _autenticado = snapshotData['autenticado'] as bool?;
    _foto = snapshotData['foto'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _coordenadas = snapshotData['coordenadas'] as LatLng?;
    _ciudad = snapshotData['ciudad'] as String?;
    _telefono = snapshotData['telefono'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Negocio');

  static Stream<NegocioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NegocioRecord.fromSnapshot(s));

  static Future<NegocioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NegocioRecord.fromSnapshot(s));

  static NegocioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NegocioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NegocioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NegocioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NegocioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NegocioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNegocioRecordData({
  String? nombre,
  String? idDelPropietario,
  DocumentReference? user,
  String? descripcion,
  String? categoria,
  String? tipoDeNegocio,
  bool? autenticado,
  String? foto,
  String? direccion,
  LatLng? coordenadas,
  String? ciudad,
  String? telefono,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'idDelPropietario': idDelPropietario,
      'user': user,
      'descripcion': descripcion,
      'categoria': categoria,
      'tipoDeNegocio': tipoDeNegocio,
      'autenticado': autenticado,
      'foto': foto,
      'direccion': direccion,
      'coordenadas': coordenadas,
      'ciudad': ciudad,
      'telefono': telefono,
    }.withoutNulls,
  );

  return firestoreData;
}

class NegocioRecordDocumentEquality implements Equality<NegocioRecord> {
  const NegocioRecordDocumentEquality();

  @override
  bool equals(NegocioRecord? e1, NegocioRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.idDelPropietario == e2?.idDelPropietario &&
        e1?.user == e2?.user &&
        e1?.descripcion == e2?.descripcion &&
        e1?.categoria == e2?.categoria &&
        e1?.tipoDeNegocio == e2?.tipoDeNegocio &&
        e1?.autenticado == e2?.autenticado &&
        e1?.foto == e2?.foto &&
        e1?.direccion == e2?.direccion &&
        e1?.coordenadas == e2?.coordenadas &&
        e1?.ciudad == e2?.ciudad &&
        e1?.telefono == e2?.telefono;
  }

  @override
  int hash(NegocioRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.idDelPropietario,
        e?.user,
        e?.descripcion,
        e?.categoria,
        e?.tipoDeNegocio,
        e?.autenticado,
        e?.foto,
        e?.direccion,
        e?.coordenadas,
        e?.ciudad,
        e?.telefono
      ]);

  @override
  bool isValidKey(Object? o) => o is NegocioRecord;
}
