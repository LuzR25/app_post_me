import 'package:app_post_me/blocs/actualizacion/actualizacion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final _descripcionController = TextEditingController();
  final FocusNode _focusComentario = FocusNode();
  PublicacionesController publicacionesController = PublicacionesController();
  late ActualizacionBloc _actualizacionBloc;

  @override
  void initState() {
    super.initState();

    _actualizacionBloc = BlocProvider.of<ActualizacionBloc>(context);
  }

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

        SizedBox(height: 2.h),

        //Campo para añadir la descripción de la publicación.
        TextFormField(
          onTapOutside: (event) {
            _focusComentario.unfocus();
          },
          cursorColor: Colors.black,
          controller: _descripcionController,
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

        //El botón de la foto
        const BotonSeleccionarFoto(),

        SizedBox(height: 2.h),

        botonPublicar(publicacionProvider),
      ],
    );
  }

  TextButton botonPublicar(PublicacionProvider publicacionProvider) {
    return TextButton(
        onPressed: () async {
          if(publicacionProvider.fotoBase64 != null){
            _ponerRuedaCargando();

            dynamic resultado = await publicacionesController.crearPublicacion(
                fotoPerfil: publicacionProvider.usuario!.fotoPerfil,
                idUsuario: publicacionProvider.usuario!.idUsuario,
                nombreUsuario: publicacionProvider.usuario!.nombreUsuario,
                foto: publicacionProvider.fotoBase64!,
                descripcion: _descripcionController.text,
                publicacionProvider: publicacionProvider);

            Navigator.of(context).pop(); //Quitamos rueda de carga

            if (resultado == true) {
              publicacionProvider.mostrarToast("Publicación creada");

              //* Limpiamos campos después del éxito
              _descripcionController.text = "";
              publicacionProvider.fotoBase64 = null;
              publicacionProvider.bytesFoto = null;
              
              _actualizacionBloc.seCreoPublicacion(true);
              
              publicacionProvider.refrescarVista();

              //setState(() {});
            } else {
              publicacionProvider
                  .mostrarToast("Ha ocurrido un error, inténtelo de nuevo");
            }
          } else {
            publicacionProvider
                  .mostrarToast("Tienes que elegir una foto para realizar una publicación");

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
          style:
              TextStyle(fontSize: AppThemes.botonFontSize, color: Colors.black),
        ));
  }

  void _ponerRuedaCargando() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const RuedaCargaWidget();
      },
    );
  }
}
