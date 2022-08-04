

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reservas_flutter/app-core/model/usuario.dart';
import 'package:reservas_flutter/app-core/service/usuario_service.dart';


class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController cpfController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController foneController = TextEditingController();
    TextEditingController loginController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

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
                    'Cadastro ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),

              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nomeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'NOME',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: cpfController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CPF',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'EMAIL',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: foneController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'FONE',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: loginController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'LOGIN',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: senhaController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'SENHA',
                  ),
                ),
              ),

              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Cadastrar'),
                    onPressed: () async{

                      Usuario login = Usuario();

                      login.nome =  nomeController.text;
                      login.cpf =  cpfController.text;
                      login.email =  emailController.text;
                      login.fone =  foneController.text;
                      login.login =  loginController.text;
                      login.senha =  senhaController.text;

                      Usuario? user = await UsuarioService().cadastro(login);
                      print(user);

                      if(user != null){
                        Modular.to.navigate('/');
                      }else{
                        showDialog(context: context,
                          builder: (context){
                            return AlertDialog(
                                title:const Text("Erro"),
                                content: const Text("Erro ao fazer cadastro, tente novamente"),
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
                       ],
          )

      ),
    );
  }
}

