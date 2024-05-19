import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Models/models.dart';
import '../Themes/app_themes.dart';
import '../Widgets/widgets.dart';

class PerfilWidget extends StatelessWidget {
  const PerfilWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Publicacion> publicaciones = [
      Publicacion(
          idPublicacion: 0,
          idUsuario: 0,
          fotoPerfil: "assets/images/vaca.png",
          nombreUsuario: "acuablast",
          fecha: "11 de mayo de 2024",
          foto: "assets/images/vaca.png",
          descripcion: "Algo hay aquí."),
      Publicacion(
          idPublicacion: 0,
          idUsuario: 0,
          fotoPerfil: "assets/images/vaca.png",
          nombreUsuario: "luzr",
          fecha: "11 de mayo de 2024",
          foto: "assets/images/vaca.png",
          descripcion: "No sé qué escribir"),
      Publicacion(
          idPublicacion: 0,
          idUsuario: 0,
          fotoPerfil: "assets/images/vaca.png",
          nombreUsuario: "anonimo",
          fecha: "11 de mayo de 2024",
          foto: "assets/images/vaca.png",
          descripcion: ""),
      Publicacion(
          idPublicacion: 0,
          idUsuario: 0,
          fotoPerfil: "assets/images/vaca.png",
          nombreUsuario: "meleatwygrey",
          fecha: "11 de mayo de 2024",
          foto: "assets/images/vaca.png",
          descripcion:
              "Deserunt magna ipsum occaecat dolore et deserunt et laboris est ad. Laborum sint consectetur occaecat eu ipsum amet fugiat tempor officia. Est sunt dolor nostrud quis qui occaecat non enim et consectetur officia. Sunt duis culpa esse in quis duis."),
      Publicacion(
          idPublicacion: 0,
          idUsuario: 0,
          fotoPerfil: "assets/images/vaca.png",
          nombreUsuario: "falso",
          fecha: "11 de mayo de 2024",
          foto: "assets/images/vaca.png",
          descripcion: ""),
    ];
    return SingleChildScrollView(
      child: Column(children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage(
                  "assets/images/vaca.png"), //!Corregir luego para que realmente aparezca una imagen
              radius: 5.h,
            ),
            Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: SizedBox(
                      child: Center(
                child: Column(children: [
                  Text("${publicaciones.length}"),
                  Text(
                    "publicaciones",
                    style: TextStyle(color: Colors.black, fontSize: 16.sp),
                  )
                ]),
              )))
            ])
          ],
        ),
        SizedBox(height: 2.h),
        Text(
          "Nombre del perfil",
          style: TextStyle(
              fontSize: AppThemes.textoSize, fontWeight: FontWeight.bold),
        ),
        Text(
          "Nombre de usuario",
          style: TextStyle(fontSize: AppThemes.textoSize),
        ),
        SizedBox(height: 2.h),
        Text(
          "Mis publicaciones",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
            itemCount: publicaciones.length,
            itemBuilder: (context, index) => TarjetaPublicacionWidget(
                nombreUsuario: publicaciones[index].nombreUsuario,
                fechaPublicacion: publicaciones[index].fecha,
                descripcion: publicaciones[index]
                    .descripcion!, // == "" ? "" : publicaciones[index].descripcion!,
                imagen: publicaciones[index].foto))
      ]),
    );
  }
}
