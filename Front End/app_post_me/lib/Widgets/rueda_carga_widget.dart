import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RuedaCargaWidget extends StatelessWidget {
  const RuedaCargaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: SizedBox(
        width: 15.w,
        height: 15.w,
        child: const FittedBox(
          fit: BoxFit.contain,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
