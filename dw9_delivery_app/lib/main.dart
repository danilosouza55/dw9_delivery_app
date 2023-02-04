import 'package:dw9_delivery_app/app/dw9_delivery_app.dart';
import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';

void main() async {
  await Env.instance.load();

  runApp(const Dw9DeliveryApp());
}
