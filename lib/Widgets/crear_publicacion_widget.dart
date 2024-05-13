import 'package:app_post_me/Models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Controllers/controllers.dart';
import '../Providers/providers.dart';
import '../Themes/app_themes.dart';
import '../Widgets/widgets.dart';

class CrearPublicacionWidget extends StatefulWidget {
  const CrearPublicacionWidget({super.key});

  @override
  State<CrearPublicacionWidget> createState() => _CrearPublicacionWidgetState();
}

class _CrearPublicacionWidgetState extends State<CrearPublicacionWidget> {
  final _comentarioController = TextEditingController();
  final FocusNode _focusComentario = FocusNode();
  PublicacionesController publicacionesController = PublicacionesController();

  @override
  Widget build(BuildContext context) {
    final publicacionProvider = Provider.of<PublicacionProvider>(context);

    return ListView(
      padding: EdgeInsets.all(AppThemes.paddingAppGeneral),
      children: [
        Text(
          'Crear publicación',
          style: TextStyle(
              fontSize: AppThemes.tituloSize, fontWeight: FontWeight.bold),
        ),

        SizedBox(
          height: 2.h,
        ),

        //Campo para añadir la descripción de la publicación.
        TextFormField(
          onTapOutside: (event) {
            _focusComentario.unfocus();
          },
          cursorColor: Colors.black,
          controller: _comentarioController,
          focusNode: _focusComentario,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black, width: 0.3.w)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black, width: 0.3.w)),
              hintText: 'Añade una descripción.',
              hintStyle: TextStyle(fontSize: 13.5.sp),
              filled: true,
              fillColor: Colors.white,
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),

        SizedBox(height: 2.h),

        Text(
          'Selecciona una imagen',
          style: TextStyle(
              fontSize: AppThemes.textoSize, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 2.h),

        const BotonSeleccionarFoto(),

        /* Center(
            child: SizedBox(
              width: 100.w,
              child: Image.asset(
                'assets/images/vaca.png',
                alignment: Alignment.center,
                fit: BoxFit.fitWidth, ),
            ),
          ), */

        SizedBox(height: 2.h),

        botonPublicar(publicacionProvider),

        /* Image.memory(
          "",
          fit: BoxFit.fitWidth,

        ) */
      ],
    );
  }

  TextButton botonPublicar(PublicacionProvider publicacionProvider) {
    return TextButton(
        onPressed: () async {
          Publicacion publicacion = Publicacion(foto: publicacionProvider.fotoBase64!, idUsuario: 0);

          dynamic resultado = await publicacionesController.crearPublicacion(publicacion: publicacion);

          if (resultado == true) {
            publicacionProvider.mostrarToast("¡Lo hicimos, Victor!");
          } else {
            publicacionProvider.mostrarToast("No servimos");
          } 
        },
        style: ButtonStyle(
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w)),
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
            backgroundColor:
                const MaterialStatePropertyAll(AppThemes.botonBackground)),
        child: Text(
          'Publicar',
          //textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: AppThemes.botonFontSize,
              //fontWeight: FontWeight.bold,
              color: Colors.black),
        ));
  }
}
