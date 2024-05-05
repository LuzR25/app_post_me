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
      child: Row(
        children: [
          Column(
            children: [
              //Foto de perfil
              CircleAvatar(
                backgroundImage: const AssetImage("assets/images/vaca.png"), //!Corregir luego para que realmente aparezca una imagen
                radius: 5.h,
              ),

              //Nombre de usuario y fecha
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    nombreUsuario,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),

                  Text(
                    fechaPublicacion.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.normal
                    ),
                  ),
                ],
              )
            ],
          ),

          //Descripción
          Text(
            descripcion,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.black
            ),
          ),

          SizedBox(
            width: 80.w,
            child: Image.asset(
              imagen,
              alignment: Alignment.center,
              fit: BoxFit.contain, ),
          ) //! Luego definir bien los tamaños y demás
        ],
      ),
    );
  }
}