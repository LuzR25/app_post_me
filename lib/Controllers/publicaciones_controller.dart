
import 'dart:convert';
import 'dart:io';
import 'package:app_post_me/Links/links.dart';
import 'package:http/http.dart' as http;

import '../Models/models.dart';

class PublicacionesController {
  Future<dynamic> crearPublicacion({required Publicacion publicacion})  async {
    final Map<String, dynamic> requestBody = publicacion.toJson();

    //String body = jsonEncode(requestBody);
    final url = Uri.parse(apiPublicaciones);
    int? statusCode;

    final httpClient = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);

    try {
      final request = await httpClient.postUrl(url).timeout(const Duration(seconds: 3));
      request.headers.set('Content-Type', 'application/json; charset=UTF-8');
      
      final requestBodyJson = jsonEncode(requestBody);
      request.write(requestBodyJson);
      
      final response = await request.close();
      final responseBody = await response.transform(utf8.decoder).join();
      
      httpClient.close();

      final jsonData = jsonDecode(responseBody);
      statusCode = response.statusCode;

      if (response.statusCode == 200) {
        Publicacion publicacion = Publicacion.fromJson(jsonData);

        print("Publicacion: ${publicacion.toString()}");

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
}