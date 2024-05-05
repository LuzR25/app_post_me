import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppThemes {
  static const Color bottomNavigationBar = Color.fromRGBO(60, 157, 163, 1);
  static const Color headerBackground = Color.fromRGBO(238, 181, 35, 1);
  static const Color botonSeleccionado = Color.fromRGBO(255, 255, 255, 1);
  static const Color botonNoSeleccionado = Color.fromRGBO(155, 211, 211, 1);
  static const Color botonBackground = Color.fromRGBO(209, 242, 242, 1);
  static const Color nombreDeUsuario = Color.fromRGBO(80, 186, 186, 1);
  static double botonFontSize = 16.sp;
  static double paddingInicio = 1.5.h;
  static double paddingAppGeneral = 3.h;
  static double tituloSize = 18.sp;
  static double textoSize = 14.sp;
  static double fechaTarjetaSize = 13.sp;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //Color primario
    primaryColor: headerBackground,

    //AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: headerBackground,
      elevation: 0,
    ), 

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
      selectedItemColor: botonSeleccionado,
      unselectedItemColor: botonNoSeleccionado,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    )
  );
}