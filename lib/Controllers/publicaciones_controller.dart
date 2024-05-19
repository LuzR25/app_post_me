import 'dart:convert';
import 'package:app_post_me/Controllers/controllers.dart';
import 'package:http/http.dart' as http;

import '../Links/links.dart';
import '../Models/models.dart';

class PublicacionesController {
  ///Se conecta con la API de publicaciones del servidor local y crea una publicación.
  Future<dynamic> crearPublicacion(
      {required String foto,
      required int idUsuario,
      required String descripcion}) async {
    
    final Map<String, dynamic> requestBody = {
      "foto": foto,
      "idUsuario": idUsuario,
      "descripcion": descripcion
    };

    String body = jsonEncode(requestBody);
    final url = Uri.parse(apiPublicaciones);
    int? statusCode;

    try {
      final response = await http
          .post(url, body: body, headers: {'Content-Type': 'application/json'});

      statusCode = response.statusCode;
      final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Publicacion publicacion = Publicacion.fromJson(jsonData);
        
        PublicacionesDatabaseController.insertarPublicacion(publicacion);

        //Guardo datos de inicio de sesión
        /* await DatabaseUsuarioController.insertarUsuario(usuario);
        await ViajesController.obtenerViajes();
        Preferences.estaSesionIniciada = true; */
        return true;
      } else {
        print("No hubo, pero sí accedió. Status code: $statusCode");
        print(jsonData['error']);
        return false;
      }
    } catch (e) {
      print("StatusCode: $statusCode; Error: ${e.toString()}");
    }
  }

  Future<List<Publicacion>> obtenerPublicacionesTodas() async {
    final url = Uri.parse(apiPublicaciones);
    //int? statusCode;

    try {
      final response = await http.get(url, headers: {'Content-Type': 'application/json'});

      //statusCode = response.statusCode;
      //final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return _crearListaPublicaciones(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
      print('Error en $e');
    }
  }

  ///Se conecta con la API de usuarios y regresa todas las publicaciones creadas
  ///hasta entonces del usuario cuyo id se pase en los parámetros suponiendo
  ///que el query se realice con éxito; en el caso contrario regresará false.
  Future<dynamic> obtenerPublicacionesUsuario(int idUsuario) async {
    final url = Uri.parse("$apiUsuarios/$idUsuario");
    //int? statusCode;

    try {
      final response = await http.get(url, headers: {'Content-Type': 'application/json'});

      //statusCode = response.statusCode;
      //final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return _crearListaPublicaciones(response.body);
      } else {
        return false;
      }
    } catch (e) {
      return false;
      print('Error en $e');
    }
  }

  ///Crea un List de tipo Publicacion a partir de un objeto json.
  List<Publicacion> _crearListaPublicaciones(String jsonPublicaciones) =>
      List<Publicacion>.from(jsonDecode(jsonPublicaciones).map((pubActual) =>
        Publicacion.fromJson(pubActual)
      ));

}