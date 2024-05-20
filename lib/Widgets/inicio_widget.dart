
import 'package:app_post_me/Controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Models/models.dart';
import '../Themes/app_themes.dart';
import '../Widgets/widgets.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({super.key});

  @override
  State<InicioWidget> createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PublicacionesController().obtenerPublicacionesTodas(), 
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<Publicacion> publicaciones = snapshot.data!;

          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.transparent,
            ),
            padding: EdgeInsets.all(AppThemes.paddingInicio),
            itemCount: publicaciones.length,
            itemBuilder: (context, index) => TarjetaPublicacionWidget(
              nombreUsuario: publicaciones[index].nombreUsuario,
              fechaPublicacion: publicaciones[index].fecha,
              descripcion: publicaciones[index].descripcion!, // == "" ? "" : publicaciones[index].descripcion!,
              fotoPerfil: publicaciones[index].fotoPerfil,
              imagen: publicaciones[index].foto)
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
      })
    );
  }
}