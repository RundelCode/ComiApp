import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "senderId" field.
  String? _senderId;
  String get senderId => _senderId ?? '';
  bool hasSenderId() => _senderId != null;

  // "receiverId" field.
  String? _receiverId;
  String get receiverId => _receiverId ?? '';
  bool hasReceiverId() => _receiverId != null;

  // "arrayDeConversantes" field.
  List<String>? _arrayDeConversantes;
  List<String> get arrayDeConversantes => _arrayDeConversantes ?? const [];
  bool hasArrayDeConversantes() => _arrayDeConversantes != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "empresa" field.
  String? _empresa;
  String get empresa => _empresa ?? '';
  bool hasEmpresa() => _empresa != null;

  // "chatId" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  bool hasChatId() => _chatId != null;

  void _initializeFields() {
    _mensaje = snapshotData['mensaje'] as String?;
    _senderId = snapshotData['senderId'] as String?;
    _receiverId = snapshotData['receiverId'] as String?;
    _arrayDeConversantes = getDataList(snapshotData['arrayDeConversantes']);
    _time = snapshotData['time'] as DateTime?;
    _empresa = snapshotData['empresa'] as String?;
    _chatId = snapshotData['chatId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? mensaje,
  String? senderId,
  String? receiverId,
  DateTime? time,
  String? empresa,
  String? chatId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mensaje': mensaje,
      'senderId': senderId,
      'receiverId': receiverId,
      'time': time,
      'empresa': empresa,
      'chatId': chatId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.mensaje == e2?.mensaje &&
        e1?.senderId == e2?.senderId &&
        e1?.receiverId == e2?.receiverId &&
        listEquality.equals(e1?.arrayDeConversantes, e2?.arrayDeConversantes) &&
        e1?.time == e2?.time &&
        e1?.empresa == e2?.empresa &&
        e1?.chatId == e2?.chatId;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.mensaje,
        e?.senderId,
        e?.receiverId,
        e?.arrayDeConversantes,
        e?.time,
        e?.empresa,
        e?.chatId
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
