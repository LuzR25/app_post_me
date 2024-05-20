import 'dart:convert';

import 'package:app_post_me/Models/models.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Controllers/controllers.dart';
import '../Themes/app_themes.dart';
import '../Widgets/widgets.dart';

class PerfilView extends StatefulWidget {
  int idUsuario;
  PerfilView({Key? key, required this.idUsuario}) : super(key: key);

  @override
  State<PerfilView> createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  List<Publicacion> listaPublicacionesUsuario = [];
  Usuario? usuario;

  @override
  Widget build(BuildContext context) {
    //final publicacionProvider = Provider.of<PublicacionProvider>(context);

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
      body: FutureBuilder(
        future: _obtenerDatosYPublicaciones(),
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
                          base64Decode(usuario!.fotoPerfil),
                          width: 16.h,
                          height: 16.h,
                          fit: BoxFit.cover,
                        )),
                        SizedBox(width: 12.w),
                        Center(
                          child: Column(children: [
                            Text(
                                "${listaPublicacionesUsuario.length}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              "publicaciones",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 16.sp),
                            )
                          ]),
                        )
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      usuario!.nombrePerfil,
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      usuario!.nombreUsuario,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      "Publicaciones",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.h),
                    ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                              color: Colors.transparent,
                            ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listaPublicacionesUsuario.length,
                        itemBuilder: (context, index) =>
                            TarjetaPublicacionWidget(
                                idUsuario: listaPublicacionesUsuario[index].idUsuario,
                                nombreUsuario: listaPublicacionesUsuario[index]
                                    .nombreUsuario,
                                fechaPublicacion: listaPublicacionesUsuario[index].fecha,
                                descripcion: listaPublicacionesUsuario[index]
                                    .descripcion!, // == "" ? "" : publicaciones[index].descripcion!,
                                fotoPerfil: listaPublicacionesUsuario[index]
                                    .fotoPerfil,
                                imagen: listaPublicacionesUsuario[index].foto))
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
            ));
          }
        },
      ),
    );
  }

  Future<bool> _obtenerDatosYPublicaciones() async {
    //Usuario usuario;

    usuario = await UsuarioController().obtenerDatosUsuario(widget.idUsuario);
    listaPublicacionesUsuario = await PublicacionesController()
        .obtenerPublicacionesUsuario(widget.idUsuario);

    return true;
  }
}
