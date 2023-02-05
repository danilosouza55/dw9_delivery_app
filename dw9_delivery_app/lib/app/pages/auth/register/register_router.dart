import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:dw9_delivery_app/app/repositories/auth/auth_repository.dart';

import 'register_controller.dart';
import 'register_page.dart';

class RegisterRouter {
  RegisterRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => RegisterController(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
        ],
        child: const RegisterPage(),
      );
}
