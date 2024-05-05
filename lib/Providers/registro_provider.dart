import 'dart:typed_data';

import 'package:flutter/material.dart' show ChangeNotifier, Colors, Color;
//import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class RegistroProvider extends ChangeNotifier {
  //Para mostrar los registros en historial_asistencias_widget
  String? fotoBase64;
  Uint8List? bytesFoto;
  String nombreUsuario = "";

  bool? cargoMedidas;
  bool cargandoRegistros = true;

  //Para asignar entrada o salida como tipo de registro a cada registro que se 
  //añada a registros en este provider
  late String fechaRegistroActual; 
  late bool esEntrada;

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

  ///Compara si las fechas pasadas como parámetro son iguales en día, mes y año,
  ///ignorando la hora.
  bool esMismaFecha(String fecha1, String fecha2) {
    List<String> f1 = fecha1.split(' ');
    List<String> f2 = fecha2.split(' ');

    if (f1[0] == f2[0]) {
      return true;
    } else {
      return false;
    }
  }

  ///Regresa la fecha pasada como parámetro en este formato: yyyy-MM-dd HH:mm:ss
  String darFormatoFecha(DateTime fecha) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(fecha);
  }

  /* Future<bool> checkStatus() async {
    bool isOnline;
    final _connectivity = Connectivity();
    ConnectivityResult resultConnect = await _connectivity.checkConnectivity();

    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = resultConnect != ConnectivityResult.none && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }

    return isOnline;
  } */
}