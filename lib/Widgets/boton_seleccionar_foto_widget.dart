import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Providers/providers.dart';
import '../Themes/app_themes.dart';

class BotonSeleccionarFoto extends StatelessWidget {
  const BotonSeleccionarFoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final publicacionProvider = Provider.of<PublicacionProvider>(context);

    if (publicacionProvider.fotoBase64 != null) {
      //Ya tomó la foto
      return FilledButton(
        style:const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: () async {
          seleccionarFoto(publicacionProvider);
        }, 
        child: Container(
        width: 100.w,
        decoration: const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
        child: Image.memory(
          publicacionProvider.bytesFoto!,
          alignment: Alignment.center,
          fit: BoxFit.fitWidth,
        ),
      ));
    } else {
      //No ha tomado la foto
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
          seleccionarFoto(publicacionProvider);
        }
      );
    }
  }

  seleccionarFoto(PublicacionProvider publicacionProvider) async {
    ImagePicker? imagePicker = ImagePicker();
          XFile? takenPhoto = await imagePicker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 60
            );

          if (takenPhoto != null) {
            //Para pasar la foto a base64
            final bytes = await takenPhoto.readAsBytes();
            String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
            publicacionProvider.insertTakenPhoto(base64Image, bytes);
          }

          publicacionProvider.refrescarVista();
  }
}
