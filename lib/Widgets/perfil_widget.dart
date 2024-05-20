import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Controllers/controllers.dart';
import '../Providers/providers.dart';
import '../Themes/app_themes.dart';
import '../Widgets/widgets.dart';

class PerfilWidget extends StatefulWidget {
  final bool soyUsuarioLogeado;
  const PerfilWidget({Key? key, required this.soyUsuarioLogeado}) : super(key: key);

  @override
  State<PerfilWidget> createState() => _PerfilWidgetState();
}

class _PerfilWidgetState extends State<PerfilWidget> {
  @override
  Widget build(BuildContext context) {
    final publicacionProvider = Provider.of<PublicacionProvider>(context);

    if(publicacionProvider.usuario == null) {
      return FutureBuilder(
        future: _obtenerDatosYPublicaciones(publicacionProvider), 
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
        padding: EdgeInsets.all(AppThemes.paddingInicio),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(
            children: [
              ClipOval(
                child: Image.memory(
                  base64Decode(publicacionProvider.usuario!.fotoPerfil), 
                  width: 16.h, 
                  height: 16.h,  
                  fit: BoxFit.cover,)
              ),

              SizedBox(width: 12.w),

              Center(
                child: Column(
                  children: [
                    Text("${publicacionProvider.listaPublicacionesUsuario.length}",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text(
                      "publicaciones",
                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    )
                  ]
                ),
              )
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            publicacionProvider.usuario!.nombrePerfil,
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            publicacionProvider.usuario!.nombreUsuario,
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 2.h),
          Text(
            widget.soyUsuarioLogeado ? "Mis publicaciones" : "Publicaciones",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1.h),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.transparent,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: publicacionProvider.listaPublicacionesUsuario.length,
            itemBuilder: (context, index) => TarjetaPublicacionWidget(
              idUsuario: publicacionProvider.listaPublicacionesUsuario[index].idUsuario,
                nombreUsuario: publicacionProvider.listaPublicacionesUsuario[index].nombreUsuario,
                fechaPublicacion: publicacionProvider.listaPublicacionesUsuario[index].fecha,
                descripcion: publicacionProvider.listaPublicacionesUsuario[index]
                    .descripcion!, // == "" ? "" : publicaciones[index].descripcion!,
                fotoPerfil: publicacionProvider.listaPublicacionesUsuario[index].fotoPerfil,
                imagen: publicacionProvider.listaPublicacionesUsuario[index].foto))
        ]),
      );
          } else {
            return Center(
              child: SizedBox(
                width: 20.w,
                height: 20.w,
                child: const FittedBox(
                  fit: BoxFit.contain,
                  child: CircularProgressIndicator(),
                ),
              )
            );
          }
        },
      );
    } else {
      return SingleChildScrollView(
        padding: EdgeInsets.all(AppThemes.paddingInicio),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Row(
            children: [
              ClipOval(
                child: Image.memory(
                  base64Decode(publicacionProvider.usuario!.fotoPerfil), 
                  width: 16.h, 
                  height: 16.h,  
                  fit: BoxFit.cover,)
              ),

              SizedBox(width: 12.w),

              Center(
                child: Column(
                  children: [
                    Text("${publicacionProvider.listaPublicacionesUsuario.length}",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Text(
                      "publicaciones",
                      style: TextStyle(color: Colors.black, fontSize: 16.sp),
                    )
                  ]
                ),
              )
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            publicacionProvider.usuario!.nombrePerfil,
            style: TextStyle(
                fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            publicacionProvider.usuario!.nombreUsuario,
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(height: 2.h),
          Text(
            widget.soyUsuarioLogeado ? "Mis publicaciones" : "Publicaciones",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 1.h),
          ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.transparent,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: publicacionProvider.listaPublicacionesUsuario.length,
            itemBuilder: (context, index) => TarjetaPublicacionWidget(
              idUsuario: publicacionProvider.listaPublicacionesUsuario[index].idUsuario,
                nombreUsuario: publicacionProvider.listaPublicacionesUsuario[index].nombreUsuario,
                fechaPublicacion: publicacionProvider.listaPublicacionesUsuario[index].fecha,
                descripcion: publicacionProvider.listaPublicacionesUsuario[index]
                    .descripcion!, // == "" ? "" : publicaciones[index].descripcion!,
                fotoPerfil: publicacionProvider.listaPublicacionesUsuario[index].fotoPerfil,
                imagen: publicacionProvider.listaPublicacionesUsuario[index].foto))
        ]),
      ); 
    }

  }

  Future<bool> _obtenerDatosYPublicaciones(PublicacionProvider publicacionProvider) async {
    //Usuario usuario;

    publicacionProvider.usuario = await UsuarioDatabaseController.obtainData();
    publicacionProvider.listaPublicacionesUsuario = await PublicacionesDatabaseController.obtenerPublicaciones();

    return true;
  }
}
