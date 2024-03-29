// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  //
  // Atributos
  //

  //Identificador do formulário
  var formKey = GlobalKey<FormState>();

  //Controladores dos campos de texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //
              // CAMPO DE TEXTO
              //
              TextFormField(
                controller: txtValor1,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'login',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe o email cadastrado';
                  } else if (value.isEmpty) {
                    return 'Informe o email cadastrado';
                  } 
                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: txtValor2,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'senha',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe a senha';
                  } else if (value.isEmpty) {
                    return 'Informe a senha';
                  }

                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              //
              //Caixa de Texto "Esqueci a senha"
              //

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                    title: const Text('Esqueci a senha'),
                    content: const Text('Informe o email cadastrado:'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                      ),
                    ],
                    ),
                    ),
                    child: const Text('Esqueci a senha'),
                  ),
                ],
              ),

              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
              SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 25, 5, 241),
                  foregroundColor: Color.fromARGB(255, 248, 248, 250),
                  minimumSize: Size(200, 40),
                ),
                onPressed: () {
                  //
                  // Chamar os VALIDADORES
                  //
                  if (formKey.currentState!.validate()) {
                      //
                      // Navegar para Tela Inicial
                      //
                     Navigator.pushNamed(context, 't1');

                    }
                  },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 28),

                
                ),
                
                
              ),

              //
              //Caixa de Texto "Esqueci a senha"
              //
              SizedBox(height: 290,),
              TextButton(
                onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                title: const Text('Sobre nós'),
                content: const Text('Nós....'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Sair'),
                      child: const Text('Sair'),
                  ),
                  
                ],
                ),
                ),
                child: const Text('Sobre nós'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
