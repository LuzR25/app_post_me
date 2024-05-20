import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Controllers/controllers.dart';
import '../Preferences/preferences.dart';
import '../Providers/providers.dart';
import '../Themes/app_themes.dart';

class ConfiguracionWidget extends StatelessWidget {
  const ConfiguracionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final PublicacionProvider publicacionProvider = Provider.of<PublicacionProvider>(context);

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
        children: [
          Text(
            'Configuración',
            style: TextStyle(
                fontSize: AppThemes.tituloSize, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2.h,),
          botonModificarCuenta(estilo, context),
          botonGitHub(estilo),
          botonAcercaDe(estilo),
          botonCerrarSesion(estilo, publicacionProvider, context),
        ],
      ),
    );
  }

  Flex botonCerrarSesion(ButtonStyle estilo, PublicacionProvider publicacionProvider, BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: TextButton(
            onPressed: () async {
              publicacionProvider.listaPublicacionesInicio = [];
              publicacionProvider.listaPublicacionesUsuario = [];
              publicacionProvider.usuario = null;
              await UsuarioDatabaseController.delete();
              await PublicacionesDatabaseController.eliminarPublicaciones();
              await Preferences.limpiarPreferencias();

              Navigator.pushReplacementNamed(context, 'login');
            },
            style: estilo,
            child: Text(
              'Cerrar sesión',
              style: TextStyle(
                  fontSize: AppThemes.botonFontSize,
                  //fontWeight: FontWeight.bold,
                  color: Colors.red[
                      700] //!Necesito que los botones se expandan a lo ancho
                  ),
            )),
      )
    ]);
  }

  Flex botonAcercaDe(ButtonStyle estilo) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: TextButton(
            onPressed: () {},
            style: estilo,
            child: Text(
              'Acerca de',
              //textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: AppThemes.botonFontSize,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
      )
    ]);
  }

  Flex botonGitHub(ButtonStyle estilo) {
    return Flex(direction: Axis.horizontal, children: [
      Expanded(
        child: TextButton(
            onPressed: _launchURL,
            style: estilo,
            child: Text(
              'Ver más en GitHub',
              style: TextStyle(
                  fontSize: AppThemes.botonFontSize,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
      )
    ]);
  }

  Flex botonModificarCuenta(ButtonStyle estilo, BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'modificar_datos');
                },
                style: estilo,
                child: Text(
                  'Modificar datos de cuenta',
                  style: TextStyle(
                      fontSize: AppThemes.botonFontSize,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black),
                )))
      ],
    );
  }

  _launchURL() async {
    const url = 'https://github.com/LuzR25/app_post_me.git';
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se puede abrir el repositorio';
    }
  }
}
