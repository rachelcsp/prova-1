// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
   //
  // Atributos
  //

  //Identificador do formulário
  var formKey = GlobalKey<FormState>();

  //Controladores dos campos de texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  var txtValor3 = TextEditingController();
  var txtValor4 = TextEditingController();
  var txtValor5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Cadastro'),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 90, 50, 90),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //
              // CAMPO DE TEXTO 'Primeiro Nome'
              //
              TextFormField(
                controller: txtValor1,
                style: TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  labelText: 'Primeiro Nome',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe seu Primeiro Nome';
                  } else if (value.isEmpty) {
                    return 'Informe seu Primeiro Nome';
                  }
                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 15),
              //
              // CAMPO DE TEXTO 'Sobrenome'
              //
              TextFormField(
                controller: txtValor2,
                style: TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  labelText: 'Sobrenome',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe seu sobrenome';
                  } else if (value.isEmpty) {
                    return 'Informe seu sobrenome';
                  }
                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 15),
              //
              // CAMPO DE TEXTO 'email'
              //
              TextFormField(
                controller: txtValor3,
                style: TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe um novo email para cadastro';
                  } else if (value.isEmpty) {
                    return 'Informe um novo email para cadastro';
                  }
                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 15),
              //
              // CAMPO DE TEXTO 'senha'
              //
              TextFormField(
                controller: txtValor4,
                style: TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Defina uma senha';
                  } else if (value.isEmpty) {
                    return 'Defina uma senha';
                  }
                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 15),
              //
              // CAMPO DE TEXTO ' repita a senha'
              //
              TextFormField(
                controller: txtValor5,
                style: TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  labelText: 'Repita a senha',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Repita a senha';
                  } else if (value.isEmpty) {
                    return 'Repita a senha';
                  }
                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
              SizedBox(
                height: 50,
              ),
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
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}