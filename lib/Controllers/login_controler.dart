import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:app_post_me/Controllers/controllers.dart';
import 'package:http/http.dart' as http;

import '../Links/links.dart';
import '../Models/models.dart';
import '../Preferences/preferences.dart';
import '../Providers/providers.dart';

class LoginController {
  ///Se conecta con la API de login y manda los datos de inicio de sesión del
  ///usuario para saber si son correctos y darle acceso a la aplicación.
  Future<dynamic> iniciarSesion(
      {required String nombreCuenta, required String password}) async {
    final Map<String, dynamic> requestBody = {
      'nombreCuenta': nombreCuenta,
      'contrasena': password,
    };

    String body = jsonEncode(requestBody);
    final url = Uri.parse(apiLogin);
    int? statusCode;

    try {
      final response = await http.post(url, body: body, headers: {'Content-Type': 'application/json'});

      statusCode = response.statusCode;
      final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Usuario usuario = Usuario.fromJson(jsonData);

        //Guardo datos de inicio de sesión
        UsuarioDatabaseController.insert(usuario);
        Preferences.estaSesionIniciada = true;

        //Obtengo publicaciones del usuario y las guardo en la base de datos
        List<Publicacion> listaPublicaciones =  await PublicacionesController().obtenerPublicacionesUsuario(usuario.idUsuario);

        for (var publicacion in listaPublicaciones) {
          PublicacionesDatabaseController.insertarPublicacion(publicacion);
        }

        return true;
      } else {
        PublicacionProvider().mostrarToast(jsonData['error']);
      }
    }  on SocketException catch(se) {
      print('Error en $se');
      return false; 
    } catch (e) {
      print('Error en $e');
      PublicacionProvider().mostrarToast('¡Error! Intentar de nuevo');
    }
  }
}
