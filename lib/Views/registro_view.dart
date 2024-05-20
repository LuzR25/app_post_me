import 'dart:convert';

import 'package:app_post_me/Providers/providers.dart';
import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Controllers/controllers.dart';
import '../Widgets/widgets.dart';

class RegistroView extends StatefulWidget {
  const RegistroView({super.key});

  @override
  State<RegistroView> createState() => _RegistroViewState();
}

class _RegistroViewState extends State<RegistroView> {
  var fotoPerfil;
  var nombrePerfilController = TextEditingController();
  var nombreUsuarioController = TextEditingController();
  var passwordController = TextEditingController();
  var repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    );
    OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10),
    );
    OutlineInputBorder errorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 192, 36, 36)),
      borderRadius: BorderRadius.circular(10),
    );
    OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 192, 36, 36)),
      borderRadius: BorderRadius.circular(10),
    );

    PublicacionProvider publicacionProvider = Provider.of<PublicacionProvider>(context);
    
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
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Foto de perfil
                      /* CircleAvatar(
                        radius: 8.h,
                        child: fotoPerfil == null 
                        ? ClipOval(child: Image.asset("assets/images/vaca.png",  fit: BoxFit.cover,))
                        
                        : ClipOval(child: Image.memory(fotoPerfil, fit: BoxFit.cover,)) /* MemoryImage(
                              fotoPerfi/* l,
                              alignment: Alignment.center,
                              fit: BoxFit.fitWidth, */
                            ) */,
        
                      ), */
        
                      ClipOval(
                        child: fotoPerfil == null 
                        ? Image.asset("assets/images/fondo_foto.png", width: 16.h, height: 16.h,  fit: BoxFit.cover,)
                        
                        : Image.memory(fotoPerfil, width: 16.h, height: 16.h,  fit: BoxFit.cover,)
                      ),
            
                      _botonSeleccionarFoto(publicacionProvider)
                    ],
                  ),
        
                  SizedBox(height: 2.h),
            
                  //Campo 'Nombre del perfil'
                  encabezadoTextField('Nombre del perfil'),
                  SizedBox(height: 1.h),
                  _nombrePerfilTextFormField(
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: focusedErrorBorder),
            
                  SizedBox(height: 2.h),
            
                  //Campo 'Nombre de usuario'
                  encabezadoTextField('Nombre de usuario'),
                  SizedBox(height: 1.h),
            
                  SizedBox(
                    child: _nombreUsuarioTextFormField(
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: focusedErrorBorder),
                  ),
                  
            
                  SizedBox(height: 2.h),
            
                  //Campo 'Contraseña'
                  encabezadoTextField('Contraseña'),
                  SizedBox(height: 1.h),
                  _passwordTextFormField(
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: focusedErrorBorder),
            
                  SizedBox(height: 2.h),
            
                  //Campo 'Confirmar contraseña'
                  encabezadoTextField('Confirmar contraseña'),
                  SizedBox(height: 2.h),
                  _repasswordTextFormField(
                      enabledBorder: enabledBorder,
                      focusedBorder: focusedBorder,
                      errorBorder: errorBorder,
                      focusedErrorBorder: focusedErrorBorder),
            
                  SizedBox(height: 4.5.h),
            
                  Center(child: _botonRegistrar(publicacionProvider))
                ],
              ),
        ),
      ),
    );
  }

  Text encabezadoTextField(String textoEncabezado) {
    return Text(
      textoEncabezado,
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.7.sp),
      textAlign: TextAlign.center,
    );
  }

  TextButton _botonSeleccionarFoto(PublicacionProvider publicacionProvider) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)))),
          backgroundColor:
              const MaterialStatePropertyAll(AppThemes.botonBackground)),
      child: Text(
        'Seleccionar foto',
        style: TextStyle(
            fontSize: AppThemes.botonFontSize, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: () async {
        ImagePicker? imagePicker = ImagePicker();
          XFile? takenPhoto = await imagePicker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 60
            );

          if (takenPhoto != null) {
            //Para pasar la foto a base64
            fotoPerfil = await takenPhoto.readAsBytes();
            //String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
            //publicacionProvider.insertTakenPhoto(base64Image, bytes);
          }

          publicacionProvider.refrescarVista();
      },
    );
  }

  TextButton _botonRegistrar(PublicacionProvider publicacionProvider) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)))),
          backgroundColor:
              const MaterialStatePropertyAll(AppThemes.botonBackground)),
      child: Text(
        'Registrar',
        style: TextStyle(
            fontSize: AppThemes.botonFontSize, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: () async {
        if (nombrePerfilController.text.isNotEmpty &&
            nombreUsuarioController.text.isNotEmpty &&
            repasswordController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            fotoPerfil != null) {
          _ponerRuedaCargando(); //Mostramos rueda de carga
          
          //* Manejo del acceso a la cuenta consumiento la API
          dynamic exito = await UsuarioController().crearUsuario(
            nombreUsuario: nombreUsuarioController.text, 
            nombrePerfil: nombrePerfilController.text, 
            fotoPerfil: base64Encode(fotoPerfil), 
            contra: passwordController.text) ;
          Navigator.of(context).pop(); //Quitamos rueda de carga

          if (exito == true) {
            publicacionProvider.mostrarToast('¡Usuario creado con éxito!');
//            setState(() {});
          }
        } else {
          PublicacionProvider().mostrarToast(
              'No puedes dejar ningún campo vacío y debes seleccionar una foto de perfil');
        }
      },
    );
  }

  _nombrePerfilTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      controller: nombrePerfilController,
      decoration: InputDecoration(
        labelText: 'Nombre del perfil',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe el nombre de tu perfil';
        } else {
          return null;
        }
      },
    );
  }

  _nombreUsuarioTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      controller: nombreUsuarioController,
      decoration: InputDecoration(
        labelText: 'Nombre de usuario',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe el nombre de usuario';
        } else {
          return null;
        }
      },
    );
  }

  _passwordTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe tu contraseña';
        } else {
          return null;
        }
      },
    );
  }

  _repasswordTextFormField(
      {required OutlineInputBorder enabledBorder,
      required OutlineInputBorder focusedBorder,
      required OutlineInputBorder errorBorder,
      required OutlineInputBorder focusedErrorBorder}) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.text,
      controller: repasswordController,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        fillColor: Colors.white,
        labelStyle: TextStyle(fontSize: 12.5.sp),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
      ),
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Escribe el nombre de tu perfil';
        } else if (value != passwordController.text) {
          //! Checar que esto funcione
          return 'Las contraseñas no coinciden';
        } else {
          return null;
        }
      },
    );
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
