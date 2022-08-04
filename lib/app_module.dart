

import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/cadastro.dart';
import 'package:reservas_flutter/login.dart';
import 'package:reservas_flutter/scream/cliente/app_module_cliente.dart';
import 'package:reservas_flutter/scream/funcionario/app_module_funcionario.dart';


class AppModule extends Module{

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context,args) => Iniciar()),
    ChildRoute('/cadastro', child: (context,args) => Cadastro()),
    ModuleRoute('/cliente', module: AppModuleCliente()),
    ModuleRoute('/funcionario',module: AppModuleFuncionario())
  ];

}