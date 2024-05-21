import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AcercaDeView extends StatelessWidget {
  const AcercaDeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 15.w,
        centerTitle: true,
        titleSpacing: 0,
        //backgroundColor: AppThemes.headerBackground,
        title: Text(
          'Post Me!',
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Padding(
      padding: EdgeInsets.all(AppThemes.paddingAppGeneral),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Acerca de',
            style: TextStyle(
                fontSize: AppThemes.tituloSize, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 2.h),

          Text(
            'Post Me! es una red social que ha sido presentada como el proyecto final de'
            ' la asignatura Sistemas Distribuidos y creada por Angel David Ricalde'
            ' Ché y Luz Rocío García Peña del octavo semestre de la Licenciatura'
            ' en Ingeniería de Software.\n\n'
            'En Post Me! puedes publicar una imagen con una descripción, crearte'
            ' una cuenta, ver las cuentas de otros usuarios y sus publicaciones, y'
            ' editar la información de tu propia cuenta.',
            style: TextStyle(
                fontSize: AppThemes.textoSize),
          ),
        ],
      ),
    ),
   );
  }
}