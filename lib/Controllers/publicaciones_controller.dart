import 'dart:convert';
import 'package:app_post_me/Controllers/controllers.dart';
import 'package:http/http.dart' as http;

import '../Links/links.dart';
import '../Models/models.dart';
import '../Providers/providers.dart';

class PublicacionesController {
  ///Se conecta con la API de publicaciones del servidor local y crea una publicación.
  Future<dynamic> crearPublicacion(
      {required String foto,
      required String descripcion,
      required int idUsuario,
      required String nombreUsuario,
      required String fotoPerfil,
      required PublicacionProvider publicacionProvider}) async {
    final Map<String, dynamic> requestBody = {
      "foto": foto,
      "idUsuario": idUsuario,
      "descripcion": descripcion,
      "nombreCuenta": nombreUsuario,
      "fotoPerfil": fotoPerfil
    };

    String body = jsonEncode(requestBody);
    final url = Uri.parse(apiPublicacionesCrear);
    int? statusCode;

    try {
      print("Aquí 2");
      final response = await http.post(url, body: body, headers: {
        "Accept": "application/json",
        "Content-Type": 'application/json'
      });
      print("Aquí 3");
      statusCode = response.statusCode;
      print("Aquí 4");
      final jsonData = jsonDecode(response.body);

      print("Aquí 1");
      print("statusCode: $statusCode");

      if (response.statusCode == 200) {
        Publicacion publicacion = Publicacion.fromJson(jsonData);
        PublicacionesDatabaseController.insertarPublicacion(publicacion);
        publicacionProvider.listaPublicacionesInicio =
            await obtenerPublicacionesTodas();
        publicacionProvider.listaPublicacionesUsuario =
            await PublicacionesDatabaseController.obtenerPublicaciones();

        return true;
      } else {
        print("jsonData: ${jsonData['error']}");
        return false;
      }
    } catch (e) {
      print("StatusCode: $statusCode; Error: ${e.toString()}");
    }
  }

  Future<List<Publicacion>> obtenerPublicacionesTodas() async {
    final url = Uri.parse(apiPublicacionesObtener);
    //int? statusCode;

    try {
      final response =
          await http.get(url, headers: {'Content-Type': 'application/json'});

      //statusCode = response.statusCode;
      //final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return _crearListaPublicaciones(response.body);
      } else {
        return [];
      }
    } catch (e) {
      print('Error en $e');
      return [];
    }
  }

  ///Se conecta con la API de usuarios y regresa todas las publicaciones creadas
  ///hasta entonces del usuario cuyo id se pase en los parámetros suponiendo
  ///que el query se realice con éxito; en el caso contrario regresará false.
  Future<dynamic> obtenerPublicacionesUsuario(int idUsuario) async {
    final Map<String, dynamic> requestBody = {"idUsuario": idUsuario};

    String body = jsonEncode(requestBody);
    final url = Uri.parse(apiPublicacionesUsuario);
    //int? statusCode;

    try {
      final response = await http
          .post(url, body: body, headers: {'Content-Type': 'application/json'});

      //statusCode = response.statusCode;
      //final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return _crearListaPublicaciones(response.body);
      } else {
        return false;
      }
    } catch (e) {
      print('Error en $e');
      return false;
    }
  }

  ///Crea un List de tipo Publicacion a partir de un objeto json.
  List<Publicacion> _crearListaPublicaciones(String jsonPublicaciones) =>
      List<Publicacion>.from(jsonDecode(jsonPublicaciones)
          .map((pubActual) => Publicacion.fromJson(pubActual)));
}
