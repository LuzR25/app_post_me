import 'dart:io';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter/material.dart';

import 'Providers/providers.dart';
import 'Routes/routes.dart';
import 'Themes/app_themes.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


Future<void> main() async {
  //Para evitar error cuando se inicializan las preferencias
  WidgetsFlutterBinding.ensureInitialized(); 

  //await Preferences.init();
  HttpOverrides.global = PostHttpOverrides();
  //Preferences.estaLicenciaActivada = await VerifyLicense.fetchStatusLicencia();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistroProvider()),
      ],
      child: const MyApp(),
    ),
    
  );

  /* runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => CameraBloc()),
      BlocProvider(create: (context) => RegistersBloc()),
    ],
    child: const AppState(),
  )); */
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RegistroProvider()),
        /* ChangeNotifierProvider(create: (_) => PageControllerProvider()),
        ChangeNotifierProvider(create: (_) => LicenciasProvider()), */
      ],
      child: const MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Post Me!',
          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.getAppRoutes(),
          theme: AppThemes.lightTheme
        );
      })
    );
  }
}