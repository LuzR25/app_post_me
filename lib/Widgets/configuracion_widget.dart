import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConfiguracionWidget extends StatelessWidget {
  const ConfiguracionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ButtonStyle estilo = ButtonStyle(
        padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w)),
        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)))),
        backgroundColor:
            const MaterialStatePropertyAll(AppThemes.botonBackground));

    return Padding(
      padding: EdgeInsets.all(AppThemes.paddingAppGeneral),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Configuración',
            style: TextStyle(
                fontSize: AppThemes.tituloSize, fontWeight: FontWeight.bold),
          ),
          botonModificarCuenta(estilo),
          botonGitHub(estilo),
          botonAcercaDe(estilo),
          botonCerrarSesion(estilo),
        ],
      ),
    );
  }

  TextButton botonCerrarSesion(ButtonStyle estilo) {
    return TextButton(
        onPressed: () {},
        style: estilo,
        child: Text(
          'Cerrar sesión',
          style: TextStyle(
              fontSize: AppThemes.botonFontSize,
              //fontWeight: FontWeight.bold,
              color: Colors
                  .red[700] //!Necesito que los botones se expandan a lo ancho
              ),
        ));
  }

  TextButton botonAcercaDe(ButtonStyle estilo) {
    return TextButton(
        onPressed: () {},
        style: estilo,
        child: Text(
          'Acerca de',
          style: TextStyle(
              fontSize: AppThemes.botonFontSize,
              //fontWeight: FontWeight.bold,
              color: Colors.black),
        ));
  }

  TextButton botonGitHub(ButtonStyle estilo) {
    return TextButton(
        onPressed: () {},
        style: estilo,
        child: Text(
          'Ver más en GitHub',
          style: TextStyle(
              fontSize: AppThemes.botonFontSize,
              //fontWeight: FontWeight.bold,
              color: Colors.black),
        ));
  }

  TextButton botonModificarCuenta(ButtonStyle estilo) {
    return TextButton(
        onPressed: () {},
        style: estilo,
        child: Text(
          'Modificar datos de cuenta',
          style: TextStyle(
              fontSize: AppThemes.botonFontSize,
              //fontWeight: FontWeight.bold,
              color: Colors.black),
        ));
  }
}
