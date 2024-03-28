// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      home: PrincipalView(),
    );
  }
}

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

              SizedBox(height: 30),

              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
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
                    //Os campos foram validados com sucesso!

                    //
                    // RECUPERAR as informações dos campos de texto
                    //
                    setState(() {
                      //Retornar o conteúdo do campo Valor 1
                      double v1 = double.parse(txtValor1.text);
                      //Retornar o conteúdo do campo Valor 2
                      double v2 = double.parse(txtValor2.text);
                      double resultado = v1 + v2;

                      //Exibir o resultado
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Resultado: $resultado'),
                          duration: Duration(seconds: 3),
                        ),
                      );

                    });
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
