

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/app-core/model/usuario.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';


class Compra extends StatelessWidget {
  const Compra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'My Smart App',
        theme: ThemeData(primarySwatch: Colors.blue),

        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate
    );
  }
}

class Iniciar extends StatelessWidget {
  const Iniciar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return  Scaffold(
      appBar: AppBar(
        title:const  Text("Reservas.com.er"),



      ),
      body: Container(
          padding: const  EdgeInsets.symmetric(vertical: 50.0),

          width: double.infinity,
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Jogo da galera ',
                    style: TextStyle(

                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usuário',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                ),


              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async{
                       Usuario login = Usuario();

                       login.login = nameController.text;
                       login.senha = passwordController.text;

                      Usuario? user = await UsuarioService().login(login);
                      print(user);

                      if(user != null && user.token.isNotEmpty){
                        if(user.tipo == '[C]'){
                          Modular.to.navigate('cliente');
                        }else{
                          Modular.to.navigate('funcionario');
                        }

                      }else{
                        showDialog(context: context,
                          builder: (context){
                            return AlertDialog(
                                title:const Text("Erro"),
                                content: const Text("Login e/ou Senha inválido(s)"),
                                actions : <Widget>[
                                  TextButton(
                                      child: const Text("OK"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      }
                                  )
                                ]
                            );
                          },
                        );

                      };
                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Você não possui conta?'),
                  TextButton(
                    child: const Text(
                      'Cadastrar',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      Modular.to.pushNamed('/cadastro');
                    },
                  )
                ],
              ),
            ],
          )

      ),
    );
  }
}

