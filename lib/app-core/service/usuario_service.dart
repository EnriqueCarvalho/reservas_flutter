import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';

class UsuarioService {
  logar(String login, String senha) {
    if (login == 'admin' && senha == 'admin') {
      return true;
    } else {
      return true;
    }
  }
}
