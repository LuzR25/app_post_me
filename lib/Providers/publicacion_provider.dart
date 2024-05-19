import 'dart:typed_data';

import 'package:flutter/material.dart' show ChangeNotifier, Colors, Color;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../Models/models.dart';

class PublicacionProvider extends ChangeNotifier {
  
  String? fotoBase64;
  Uint8List? bytesFoto;
  String nombreUsuario = "";

  List<Publicacion> listaPublicacionesInicio = [];


  ///Guarda la foto tomada por el usuario en base64.
  void insertTakenPhoto(String? fBase64, Uint8List? bFoto) {
    fotoBase64 = fBase64;
    bytesFoto = bFoto;
    notifyListeners();
  }

  refrescarVista() {
    notifyListeners();
  }

  void mostrarToast(String mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(207, 56, 54, 54),
        textColor: Colors.white,
        fontSize: 13.sp);
  }

  ///Regresa la fecha pasada como parámetro en este formato: yyyy-MM-dd HH:mm:ss
  String darFormatoFecha(DateTime fecha) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(fecha);
  }
}