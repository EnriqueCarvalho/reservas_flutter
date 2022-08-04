import 'package:reservas_flutter/app-core/model/usuario.dart';
import 'package:reservas_flutter/app-core/persistence/open_database.dart';
import 'package:sqflite/sqflite.dart';


class UsuarioPersistence{

  static const String _nomeTabela = 'usuario';
  static const String _col_id = 'id';
  static const String _col_nome = 'nome';
  static const String _col_email = 'email';
  static const String _col_fone = 'fone';
  static const String _col_tipo = 'tipo';
  static const String _col_cpf = 'cpf';
  static const String _col_login = 'login';
  static const String _col_senha = 'senha';
  static const String _col_ativo = 'ativo';
  static const String _col_token = 'token';
  static const String _col_id_quadra = 'idQuadra';


  static const String createTabelaUsuario = 'CREATE TABLE $_nomeTabela ('
      '$_col_id INTEGER PRIMARY KEY, '
      '$_col_nome TEXT, '
      '$_col_login TEXT, '
      '$_col_senha TEXT,'
      '$_col_email TEXT,'
      '$_col_fone TEXT,'
      '$_col_cpf TEXT,'
      '$_col_ativo TEXT,'
      '$_col_tipo TEXT,'
      '$_col_token TEXT,'
      '$_col_id_quadra INTEGER)';

  static salvar(Usuario u) async{
    print('salvando usuário: '+u.toString());
    final db = await getDatabase();
    await db.insert(_nomeTabela, u.toJson());
  }

  static deletar() async {
    final Database db = await getDatabase();
    await db.delete(_nomeTabela);
  }

  static Future<Usuario> getUsuario() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(_nomeTabela);
    List<Usuario> users = List.generate(maps.length, (i) {
      return Usuario.fromMap(maps[i]);
    });
    print(maps.length);
    if(users.isNotEmpty){
      return users[0];
    }else{
      return Usuario(senha: '', login: '');
    }
  }

}