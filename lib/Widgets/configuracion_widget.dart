import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConfiguracionWidget extends StatelessWidget {
  const ConfiguracionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.h), //! Luego checar y ponerme de acuerdo en la medida del padding
      child: Column(
        children: [
          const Text('Configuración'),
          TextButton(onPressed: () {}, child: const Text('Modificar datos de cuenta')),
          TextButton(onPressed: () {}, child: const Text('')),
          TextButton(onPressed: () {}, child: const Text('')),
          TextButton(onPressed: () {}, child: const Text(''))
        ],
      ),
    );
  }
}