import 'dart:convert';

import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Providers/providers.dart';

class CrearPublicacionWidget extends StatefulWidget {
  const CrearPublicacionWidget({super.key});

  @override
  State<CrearPublicacionWidget> createState() => _CrearPublicacionWidgetState();
}

class _CrearPublicacionWidgetState extends State<CrearPublicacionWidget> {
  final _comentarioController = TextEditingController();
  final FocusNode _focusComentario = FocusNode();

  @override
  Widget build(BuildContext context) {
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
          
        TextButton(
            onPressed: () {},
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
            )),

        /* Image.memory(
          "",
          fit: BoxFit.fitWidth,

        ) */
      ],
    );
  }
}

class BotonSeleccionarFoto extends StatelessWidget {
  const BotonSeleccionarFoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final publicacionProvider = Provider.of<PublicacionProvider>(context);

    if(publicacionProvider.fotoBase64 != null) {//Ya tomó la foto
      return 
      Container(
        width: 100.w,
        decoration: const ShapeDecoration(
          color: AppThemes.headerBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
            child: Image.memory(publicacionProvider.bytesFoto!,
                alignment: Alignment.center,
                fit: BoxFit.fitWidth, ),
          );
    
    } else {//No ha tomado la foto
      return IconButton.filled(
        style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(Colors.blueGrey[100]),
            backgroundColor:
                const MaterialStatePropertyAll(AppThemes.botonBackground),
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))))),
        icon: Icon(
          Icons.add_photo_alternate_rounded,
          color: Colors.black,
          size: 58.w,
        ),
        onPressed: () async {
          ImagePicker? imagePicker = ImagePicker();
              XFile? takenPhoto = await imagePicker.pickImage(
                source: ImageSource.gallery,
                imageQuality: 40,
                maxHeight: 500,
                maxWidth: 500
              );

              if (takenPhoto != null) {
                //Para pasar la foto a base64
                final bytes = await takenPhoto.readAsBytes();
                String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
                publicacionProvider.insertTakenPhoto(base64Image, bytes);
                
/*                 File(takenPhoto.path).delete();

                // Tu imagen en formato Base64
                String base64Image2 = base64Image; // Reemplaza esto con tu propia imagen en Base64

                // Decodificar la imagen Base64 a una cadena
                String decodedImage = base64.decode(base64Image2.split(',')[1]).toString();

                print(decodedImage); */
              }

              publicacionProvider.refrescarVista();
        },
      );
    }
  }
}