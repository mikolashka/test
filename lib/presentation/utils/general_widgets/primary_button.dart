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
        backgroundColor: AppColors.blue,
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
            color: AppColors.dirtyWhite
          ),
        ),
      ),
    );
  }
}
class SecondaryElevationButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String title;
  const SecondaryElevationButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor:  AppColors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28.0),
            side: const BorderSide(width: 2, color: AppColors.blue)),
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: AppColors.blue),
        ),
      ),
    );
  }

}

