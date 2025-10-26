import 'package:flutter/material.dart';
import 'package:imc_calculator/core/App_color.dart';

class ButtonStyles {
  static final ButtonStyle buttonStyles = ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              );
}
