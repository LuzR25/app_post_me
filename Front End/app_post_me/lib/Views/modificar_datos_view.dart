import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Controllers/controllers.dart';
import '../Models/models.dart';
import '../Providers/providers.dart';
import '../Themes/app_themes.dart';
import '../Widgets/widgets.dart';
import '../blocs/blocs.dart';

class ModificarDatosView extends StatefulWidget {
  //Usuario usuario;
  const ModificarDatosView({/* required this.usuario, */ super.key});

  @override
  State<ModificarDatosView> createState() => _ModificarDatosViewState();
}

class _ModificarDatosViewState extends State<ModificarDatosView> {
  var nombrePerfilController = TextEditingController();
  var nombreUsuarioController = TextEditingController();
  var passwordController = TextEditingController();
  late ActualizacionBloc _actualizacionBloc;

  @override
  void initState() {
    super.initState();

    _actualizacionBloc = BlocProvider.of<ActualizacionBloc>(context);
  }

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

    final PublicacionProvider publicacionProvider = Provider.of<PublicacionProvider>(context);

    nombrePerfilController.text = publicacionProvider.usuario!.nombrePerfil;
    nombreUsuarioController.text = publicacionProvider.usuario!.nombreUsuario;
    passwordController.text = publicacionProvider.usuario!.password;
    //fotoPerfil = publicacionProvider.usuario!.fotoPerfil;

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
                      ClipOval(
                          child: publicacionProvider.fotoCambiar == null 
                          ? Image.memory(base64Decode(publicacionProvider.usuario!.fotoPerfil), width: 16.h, height: 16.h,  fit: BoxFit.cover,)
                          
                          : Image.memory(publicacionProvider.fotoCambiar!, width: 16.h, height: 16.h,  fit: BoxFit.cover,)
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
            
                  SizedBox(height: 4.5.h),
            
                  Center(child: _botonModificar(publicacionProvider))
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
        'Cambiar foto',
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
            publicacionProvider.fotoCambiar = await takenPhoto.readAsBytes();
            //String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
            //publicacionProvider.insertTakenPhoto(base64Image, bytes);
          }

          publicacionProvider.refrescarVista();
      },
    );
  }

  TextButton _botonModificar(PublicacionProvider publicacionProvider) {
    return TextButton(
      style: ButtonStyle(
          padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)))),
          backgroundColor:
              const MaterialStatePropertyAll(AppThemes.botonBackground)),
      child: Text(
        'Guardar cambios',
        style: TextStyle(
            fontSize: AppThemes.botonFontSize, fontWeight: FontWeight.bold, color: Colors.black),
      ),
      onPressed: () async {
        if (nombrePerfilController.text.isNotEmpty &&
            passwordController.text.isNotEmpty &&
            nombreUsuarioController.text.isNotEmpty) {
          _ponerRuedaCargando(); //Mostramos rueda de carga

          Usuario usuario = Usuario(idUsuario: publicacionProvider.usuario!.idUsuario, nombreUsuario: nombreUsuarioController.text, nombrePerfil: nombrePerfilController.text, fotoPerfil: publicacionProvider.fotoCambiar == null ? publicacionProvider.usuario!.fotoPerfil : base64Encode(publicacionProvider.fotoCambiar!), password: passwordController.text);
          
          //dynamic iniciaSesion = true;
          
          //* Manejo del acceso a la cuenta consumiento la API
          dynamic exito = await UsuarioController().actualizarDatos(
            usuario: usuario, 
            publicacionProvider: publicacionProvider);
          Navigator.of(context).pop(); //Quitamos rueda de carga

          if (exito == true) {
            //Navigator.pushReplacementNamed(context, 'navegacion_app');
            publicacionProvider.mostrarToast('¡Datos modificados con éxito!');
            publicacionProvider.fotoCambiar = null;
            _actualizacionBloc.seModificoUsuario(true);
            publicacionProvider.refrescarVista();
          } else if (exito == false) {
            publicacionProvider.mostrarToast('Revisa tu conexión a internet');
          }
          setState(() {});
        } else {
          publicacionProvider.mostrarToast('No puedes dejar ningún campo vacío');
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
      keyboardType: TextInputType.name,
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
      keyboardType: TextInputType.name,
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
