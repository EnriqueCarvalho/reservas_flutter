import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/scream/funcionario/menu_funcionario.dart';
import 'package:reservas_flutter/scream/funcionario/visualizar_espacos.dart';
import 'package:reservas_flutter/scream/funcionario/visualizar_funcionarios.dart';
import 'package:reservas_flutter/scream/funcionario/visualizar_reservas_funcionario.dart';

class AppModuleFuncionario extends Module{

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context,args) => MenuFuncionario()),
    ChildRoute('/reservas', child: (context,args) => VisualizarReservasFuncionario()),
    ChildRoute('/funcionarios', child: (context,args) => VisualizarFuncionarios()),
    ChildRoute('/espacos', child: (context,args) => VisualizarEspacos()),


  ];

}