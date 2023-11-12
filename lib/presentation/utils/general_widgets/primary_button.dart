import 'package:devtools_test/presentation/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryElevationButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String title;
  const PrimaryElevationButton({super.key, required this.onPressed, required this.title});


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
class SecondaryElevationButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String title;
  final Color? bgColor;
  const SecondaryElevationButton({super.key, required this.onPressed, required this.title, this.bgColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
            side: const BorderSide(width: 2, color: AppColors.orange)),
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: AppColors.orange),
        ),
      ),
    );
  }

}

