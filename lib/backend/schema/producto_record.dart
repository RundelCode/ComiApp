import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ProductoRecord extends FirestoreRecord {
  ProductoRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "imagen" field.
  String? _imagen;
  String get imagen => _imagen ?? '';
  bool hasImagen() => _imagen != null;

  // "negocio" field.
  DocumentReference? _negocio;
  DocumentReference? get negocio => _negocio;
  bool hasNegocio() => _negocio != null;

  // "info" field.
  String? _info;
  String get info => _info ?? '';
  bool hasInfo() => _info != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _imagen = snapshotData['imagen'] as String?;
    _negocio = snapshotData['negocio'] as DocumentReference?;
    _info = snapshotData['info'] as String?;
    _precio = castToType<double>(snapshotData['precio']);
    _nombre = snapshotData['nombre'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('producto')
          : FirebaseFirestore.instance.collectionGroup('producto');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('producto').doc();

  static Stream<ProductoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductoRecord.fromSnapshot(s));

  static Future<ProductoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductoRecord.fromSnapshot(s));

  static ProductoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductoRecordData({
  String? imagen,
  DocumentReference? negocio,
  String? info,
  double? precio,
  String? nombre,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imagen': imagen,
      'negocio': negocio,
      'info': info,
      'precio': precio,
      'nombre': nombre,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductoRecordDocumentEquality implements Equality<ProductoRecord> {
  const ProductoRecordDocumentEquality();

  @override
  bool equals(ProductoRecord? e1, ProductoRecord? e2) {
    return e1?.imagen == e2?.imagen &&
        e1?.negocio == e2?.negocio &&
        e1?.info == e2?.info &&
        e1?.precio == e2?.precio &&
        e1?.nombre == e2?.nombre;
  }

  @override
  int hash(ProductoRecord? e) => const ListEquality()
      .hash([e?.imagen, e?.negocio, e?.info, e?.precio, e?.nombre]);

  @override
  bool isValidKey(Object? o) => o is ProductoRecord;
}
