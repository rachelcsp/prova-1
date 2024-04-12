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
  var txtValor3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 90, 50, 90),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
            
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Esqueci a senha'),
                          content: SizedBox(
                            height: 50,
                            child: Column(
                              children: [
                                //
                                // CAMPO DE TEXTO
                                //
                                TextFormField(
                                  controller: txtValor3,
                                  style: TextStyle(fontSize: 10),
                                  decoration: InputDecoration(
                                    labelText: 'informe o email',
                                    border: OutlineInputBorder(),
                                  ),
                     
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
            
                                final snackBar = SnackBar(
                                  content: Text('link para redefinir senha enviado'),
                                  duration: Duration(seconds: 3),
                                );
                                // Exibe o Snackbar na tela
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
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
                      Navigator.pushNamed(context, 't1');
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
            
                              //
                //Botão "Novo Cadastro"
                //
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    //
                    // Navegar para Tela Inicial
                    //
                    Navigator.pushNamed(context, 't2');
                  }, child: const Text('Novo Cadastro'),
                    ),       
            
                //
                //Caixa de Texto "Sobre nós"
                //
                SizedBox(
                  height: 150,
                ),
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Sobre nós'),
                      content: const Text('Nós tentamos e demos nosso melhor, não é perfeito mas é honesto!'),
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
      ),
    );
  }
}
