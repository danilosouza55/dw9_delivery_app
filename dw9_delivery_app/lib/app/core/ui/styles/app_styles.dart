import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class AppStyles {
  static AppStyles? _instance;
  AppStyles._();

  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.instance.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        textStyle: TextStyles.i.textButtonLabel,
      );
}

extension AppStylesExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}
