import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:reservas_flutter/app-core/model/usuario.dart';
import 'package:reservas_flutter/app-core/persistence/usuario_persistense.dart';
import 'package:reservas_flutter/app-core/service/abstract_service.dart';

class UsuarioService extends AbstractService{
  static Usuario? USUARIO_LOGADO = Usuario();




  logar(String login, String senha) {
    if (login == 'admin' && senha == 'admin') {
      return true;
    } else {
      return true;
    }
  }

  Usuario parseUsuario(String responseBody) {

    final parsed = json.decode(responseBody);
    print('parse ok ');
    print(parsed.toString());
    Usuario user = Usuario.fromMap(parsed);
    USUARIO_LOGADO = user;
    print('frommap ok ');
    return user;
  }


  Future<Usuario?> login(Usuario user) async {
    print("veio");
    try {
      USUARIO_LOGADO?.id = 0;
      final uri =
      Uri.http(URL_API, '/login');
      final response = await post(uri,
          headers: <String, String>{
            'Content-type': 'application/json',
          },
          body: jsonEncode(user)); //doc.toJson());


      if (response.statusCode == 200) {
        UsuarioPersistence.deletar();
        Usuario u = parseUsuario(response.body);
        UsuarioPersistence.salvar(u);
        return u;
      } else if (response.statusCode == 400) {
        user.token = '';
        return user;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }

  }

  Future<Usuario?> cadastro(Usuario user) async {
    print("veio");
    try {
      final uri =
      Uri.http(URL_API, '/cadastrar');
      final response = await post(uri,
          headers: <String, String>{
            'Content-type': 'application/json',
          },
          body: jsonEncode(user)); //doc.toJson());


      if (response.statusCode == 200) {
        UsuarioPersistence.deletar();
        Usuario u = parseUsuario(response.body);

        return u;
      } else if (response.statusCode == 400) {
        user.token = '';
        return user;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      return null;
    }

  }




}
