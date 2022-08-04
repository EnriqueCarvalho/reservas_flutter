import 'package:path/path.dart';
import 'package:reservas_flutter/app-core/persistence/usuario_persistense.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async{
  print('abrindo conexao com o banco');

  return openDatabase( join(await getDatabasesPath(), 'bancoUm.db'),
      onCreate: (db, version) async{

        print('sql: '+UsuarioPersistence.createTabelaUsuario);
        await db.execute(UsuarioPersistence.createTabelaUsuario);


        List<String> queryes = [
          UsuarioPersistence.createTabelaUsuario,

        ];

        // print('getDatabasesPath(): '+ getDatabasesPath().toString());
        for(String sql in queryes){

          print('sql: '+sql);

          db.execute(sql);
        }

      },version: 6);
}