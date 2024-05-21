import 'dart:convert';

import 'package:app_post_me/Controllers/controllers.dart';
import 'package:app_post_me/Links/links.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Models/models.dart';
import '../Providers/providers.dart';

class UsuarioController {

  Future<dynamic> crearUsuario({
    required nombreUsuario,
    required nombrePerfil,
    required fotoPerfil,
    required contra}) async {
    final Map<String, dynamic> requestBody = {
      'nombreCuenta': nombreUsuario,
      'nombreUsuario': nombrePerfil,
      'fotoPerfil': fotoPerfil,
      'contrasena': contra
    };

    String body = jsonEncode(requestBody);
    String formBody = Uri.encodeQueryComponent(body);
    final url = Uri.parse(apiUsuarios);
    int? statusCode;

    try {
      final response = await http.post(url, body: body, headers: {"Accept": "application/json",
      "Content-Type": 'application/json' });

      statusCode = response.statusCode;
      final jsonData = jsonDecode(response.body);

      print(response.statusCode);

      if (response.statusCode == 200) {
        return true;
      } else {
        PublicacionProvider().mostrarToast(jsonData['error']);
        return false;
      }
    } catch (e) {
      print('Error en $e');
      PublicacionProvider().mostrarToast('¡Error! Intentar de nuevo');
      return false;
    }
  }

  ///Se conecta con la API de login y actualizar los datos del usuario.
  Future<dynamic> actualizarDatos(
      {required Usuario usuario, 
      required PublicacionProvider publicacionProvider}) async {
    final Map<String, dynamic> requestBody = usuario.toJson();

    String body = jsonEncode(requestBody);
    final url = Uri.parse("$apiUsuarios/${usuario.idUsuario}");
    int? statusCode;

    dynamic jsonDat;

    try {
      final response = await http.put(url, body: body, headers: {"Accept": "application/json",
      "Content-Type": 'application/json' });

      statusCode = response.statusCode;
      final jsonData = jsonDecode(response.body);
      jsonDat = jsonData;

      if (response.statusCode == 200) {
        print("$jsonData");
        Usuario usuario = Usuario.fromJson(jsonData);

        //Guardo datos de inicio de sesión
        UsuarioDatabaseController.actualizarUsuario(usuario);

        //Actualizo usuario en PublicacionProvider
        publicacionProvider.usuario = usuario;

        for (var publicacion in publicacionProvider.listaPublicacionesUsuario) {
          publicacion.fotoPerfil = usuario.fotoPerfil;
          publicacion.nombreUsuario = usuario.nombreUsuario;

          PublicacionesDatabaseController.actualizarPublicacion(publicacion);
        }
        

        return true;
      } else {
        PublicacionProvider().mostrarToast(jsonData['error']);
      }
    } catch (e) {
      print(jsonDat);
      if (kDebugMode) {
        print('Error en $e');
      }
      PublicacionProvider().mostrarToast('¡Error! Intentar de nuevo');
    }
  }

  Future<dynamic> obtenerDatosUsuario(int idUsuario) async {
    final url = Uri.parse("$apiUsuarios/$idUsuario");
    int? statusCode;

    try {
      final response = await http.get(url, headers:{"Accept": "application/json",
      "Content-Type": 'application/json' });

      statusCode = response.statusCode;
      final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Usuario.fromJson(jsonData);
      } else {
        PublicacionProvider().mostrarToast(jsonData['error']);
        return false;
      }
    } catch (e) {
      print('Error en $e');
      PublicacionProvider().mostrarToast('¡Error! Intentar de nuevo');
    }
  }
  
}