import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? generateChatId(
  String? idMia,
  String? idDelOtro,
) {
  // Inicializa una lista vacía de strings
  List<String> arrayOfIds = [];

  // Añade los IDs a la lista solo si no son nulos
  if (idMia != null) arrayOfIds.add(idMia);
  if (idDelOtro != null) arrayOfIds.add(idDelOtro);

  // Ordena la lista
  arrayOfIds.sort();

  // Retorna la concatenación de los IDs con un guion entre ellos
  // Si alguno de los dos es nulo, este código no ejecutará la concatenación
  if (arrayOfIds.length == 2) {
    return arrayOfIds[0] + "-" + arrayOfIds[1];
  } else {
    // Maneja el caso donde uno o ambos IDs son nulos
    return "ID inválido";
  }
}
