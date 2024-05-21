import 'package:app_post_me/Models/usuario_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../Models/models.dart';

class UsuarioDatabaseController {
  static Future<Database> _openDB() async {
    return openDatabase(path.join(await getDatabasesPath(), 'usuarioData.db'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE Usuario (idUsuario INTEGER PRIMARY KEY, nombreCuenta TEXT, "
          "nombreUsuario TEXT, contrasena TEXT, fotoPerfil TEXT)");
    }, version: 1);
  }

  static Future<void> insert(Usuario usuario) async {
    Database database = await _openDB();
    await database.insert("Usuario", usuario.toJson());
  }

  static Future<Usuario> obtainData() async {
    Database database = await _openDB();

    final List<Map<String, dynamic>> usuarioDatos =
        await database.query("Usuario");

    return Usuario(
      idUsuario: usuarioDatos[0]['idUsuario'], 
      nombreUsuario: usuarioDatos[0]['nombreCuenta'], 
      nombrePerfil: usuarioDatos[0]['nombreUsuario'], 
      fotoPerfil: usuarioDatos[0]['fotoPerfil'],
      password: usuarioDatos[0]['password']
    );
  }

  static Future<void> actualizarUsuario(Usuario usuario) async {
    Database database = await _openDB();
    await database.update('Usuario', usuario.toJson(),
        where: 'idUsuario = ?', whereArgs: [usuario.idUsuario]);
  }

  static Future<void> delete() async {
    Database database = await _openDB();
    database.delete('Usuario');
    //database.close();
  }
}
