import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? _prefs;
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences? get instance => _prefs;

  static bool get estaSesionIniciada =>
      _prefs?.getBool('estaSesionIniciada') ?? false;

  static set estaSesionIniciada(bool sesionIniciada) {
    _prefs?.setBool('estaSesionIniciada', sesionIniciada);
  }

  static Future<void> limpiarPreferencias() async {
    await _prefs?.clear();
  }
}
