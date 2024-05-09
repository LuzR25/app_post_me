import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TarjetaPublicacionWidget extends StatelessWidget {
  final String nombreUsuario;
  final DateTime fechaPublicacion;
  final String descripcion;
  final String imagen;
   
  const TarjetaPublicacionWidget({
    required this.nombreUsuario,
    required this.fechaPublicacion,
    required this.descripcion,
    required this.imagen,
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(2.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Foto de perfil
              CircleAvatar(
                backgroundImage: const AssetImage("assets/images/vaca.png"), //!Corregir luego para que realmente aparezca una imagen
                radius: 5.h,
              ),

              SizedBox(width: 4.w),

              //Nombre de usuario y fecha
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    nombreUsuario,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppThemes.textoSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    "${fechaPublicacion.day} ${fechaPublicacion.month} ${fechaPublicacion.year}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppThemes.fechaTarjetaSize,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              )
            ],
          ),

          SizedBox(height: 1.h,),

          //Descripción
          Text(
            descripcion,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: AppThemes.textoSize,
              color: Colors.black
            ),
          ),

          SizedBox(height: 1.h,),

          //Imagen
          Center(
            child: SizedBox(
              width: 100.w,
              child: Image.asset(
                imagen,
                alignment: Alignment.center,
                fit: BoxFit.fitWidth, ),
            ),
          ) //! Luego definir bien los tamaños y demás
        ],
      ),
    );
  }
}