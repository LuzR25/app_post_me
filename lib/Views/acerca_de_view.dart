import 'package:app_post_me/Themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AcercaDeView extends StatelessWidget {
  const AcercaDeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemes.paddingAppGeneral),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Acerca de',
            style: TextStyle(
                fontSize: AppThemes.tituloSize, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 2.h),

          Text(
            'Fugiat aliquip sint proident dolor consectetur dolor est consequat'
            ' elit qui commodo duis. Et dolore cillum ex do labore. Velit dolore'
            ' velit adipisicing deserunt consequat id in non ea pariatur non id.'
            ' Elit aliqua quis ea proident pariatur magna nostrud laboris commodo'
            ' enim sunt. Eu aute excepteur consequat fugiat ipsum tempor ea et '
            'labore sint. Nostrud occaecat deserunt est dolore sint fugiat est '
            'pariatur sint ipsum cupidatat enim.',
            style: TextStyle(
                fontSize: AppThemes.textoSize),
          ),
        ],
      ),
    );
  }
}