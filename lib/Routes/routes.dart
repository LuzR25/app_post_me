import 'package:flutter/material.dart';

import '../Models/models.dart';
import '../Preferences/preferences.dart';
import '../Views/views.dart';

class AppRoutes {
  static String initialRoute = Preferences.estaSesionIniciada ?  'navegacion_app' : 'login';

  static final rutasApp = <RouteModel>[
    RouteModel(route: 'login', name: 'Login', screen: const LoginView()),
    RouteModel(route: 'acerca_de', name: 'Acerca_de', screen: const AcercaDeView()),
    RouteModel(route: 'modificar_datos', name: 'Modificar_datos', screen: const ModificarDatosView()),
    RouteModel(route: 'navegacion_app', name: 'Navegacion_app', screen: const NavegacionAppView()),
    //RouteModel(route: 'perfil', name: 'Perfil', screen: PerfilView()),
    RouteModel(route: 'registro', name: 'Registro', screen: const RegistroView())
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in rutasApp) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
