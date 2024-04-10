// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  //
  // Lista Dinâmica de objetos da classe TelaInicial
  //
  List<TelaInicial> dados = [];

  var txtValor1 = TextEditingController();

  @override
  void initState() {
    dados.add(TelaInicial('Mercado'));
    dados.add(TelaInicial('Farmácia'));
    dados.add(TelaInicial('Pet Shop'));
    dados.add(TelaInicial('Outros'));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Listas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(

          //Quantidade de itens
          itemCount: dados.length,

          //Aparência de cada item
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(dados[index].nome),
                subtitle: null,
    
                onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Alterar Nome'),
                        content: SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              //
                              // CAMPO DE TEXTO
                              //
                              TextFormField(
                                controller: txtValor1,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                  labelText: 'digite novo nome',
                                  border: OutlineInputBorder(),
                                ),
                              ),

                              SizedBox(height: 10),

                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    dados[index]=TelaInicial(txtValor1.text);
                                    
                                  });
                                  Navigator.pop(context, 'Sair');
                                },
                              child: Text('OK'),
                              ),
                            ],
                          )
                        )
                      )  
                  ),
                onLongPress: (){
                  setState(() {
                    dados.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Adicionar Lista'),
                        content: SizedBox(
                          height: 150,
                          child: Column(
                            children: [
                              //
                              // CAMPO DE TEXTO
                              //
                              TextFormField(
                                controller: txtValor1,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                  labelText: 'digite o nome',
                                  border: OutlineInputBorder(),
                                ),
                              ),

                              SizedBox(height: 10),

                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    dados.add(TelaInicial(txtValor1.text));
                                  });
                                  Navigator.pop(context, 'Sair');
                                },
                              child: Text('OK'),
                              ),
                            ],
                          )
                        )
                      )  
                  ),
          child: Icon(Icons.add),
        ),
    );
  }
}

class TelaInicial{
  //atributos
  final String nome;

  //construtor
  TelaInicial(this.nome);
}
