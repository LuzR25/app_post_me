import 'package:app_post_me/Models/publicacion_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';

import '../Models/models.dart';

class PublicacionesDatabaseController {
    static Future<void> _openDB(sql.Database database) async {
      return database.execute("""CREATE TABLE Publicacion (
          numPublicacion INTEGER PRIMARY KEY,
          nombreCuenta TEXT,
          descripcion TEXT,
          foto TEXT,
          fotoPerfil TEXT,
          fecha TEXT,
          idUsuario INTEGER)""");
    }
  static Future<sql.Database> db() async {
    return sql.openDatabase('app_evidencia.db', version: 1,
        //"ONCREATE" es una función anónima que se ejecutará cuando se cree una nueva base de datos o cuando se actualice su versión
        onCreate: (sql.Database database, int version) async {
      await _openDB(database);
    });
  }
  static Future<void> insertarPublicacion(Publicacion publicacion) async {
    Database database = await PublicacionesDatabaseController.db();
    await database.insert("Publicacion", publicacion.toJson());
  }

  static Future<List<Publicacion>> obtenerPublicaciones() async {
    Database database = await PublicacionesDatabaseController.db();

    final List<Map<String, dynamic>> mapPublicaciones =
        await database.query("Publicaciones");

    List<Publicacion> listaPublicaciones = [];
    for (var element in mapPublicaciones) {
      listaPublicaciones.add(Publicacion.fromJson(element));
    }

    return listaPublicaciones;
  }

  static Future<void> eliminarPublicaciones() async {
    Database database = await PublicacionesDatabaseController.db();
    await database.delete('Evidencias');
  }
}
