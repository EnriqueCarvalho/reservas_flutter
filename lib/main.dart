import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/login.dart';
import 'package:reservas_flutter/app_module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: Compra()));
}

