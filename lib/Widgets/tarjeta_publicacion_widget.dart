import 'dart:convert';

import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TarjetaPublicacionWidget extends StatelessWidget {
  final String nombreUsuario;
  final String fechaPublicacion;
  final String descripcion;
  final String imagen;
  final String fotoPerfil;
   
  const TarjetaPublicacionWidget({
    required this.nombreUsuario,
    required this.fechaPublicacion,
    required this.descripcion,
    required this.imagen,
    required this.fotoPerfil,
    super.key
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        boxShadow: List.generate(4, (index) => BoxShadow(
          color: const Color.fromARGB(255, 221, 221, 221),
          blurRadius: 1.w,
          blurStyle: BlurStyle.outer
        ))
        //border: 
      ),
      
      padding: EdgeInsets.all(AppThemes.paddingInicio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Foto de perfil
              TextButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)
                ),
                onPressed: () {}, 
                child: ClipOval(
                        child: Image.memory(base64Decode(fotoPerfil), width: 8.h, height: 8.h,  fit: BoxFit.cover,)
                      ),
              ),

              SizedBox(width: 3.w),

              //Nombre de usuario y fecha
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    nombreUsuario,
                    style: TextStyle(
                      color: AppThemes.bottomNavigationBar,
                      fontSize: AppThemes.textoSize,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    fechaPublicacion,
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
              child: Image.memory(
                base64Decode(imagen),
                alignment: Alignment.center,
                fit: BoxFit.fitWidth, ),
            ),
          ) //! Luego definir bien los tamaños y demás
        ],
      ),
    );
  }
}