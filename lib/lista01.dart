// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TelaListaExistente extends StatefulWidget {
  const TelaListaExistente({super.key});

  @override
  State<TelaListaExistente> createState() => _TelaListaExistenteState();
}

class _TelaListaExistenteState extends State<TelaListaExistente> {
  //
  // Lista Dinâmica de objetos da classe ListaExistente
  //
  List<ListaExistente> dados = [];

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  @override
  void initState() {
    dados.add(ListaExistente('Refrigerante', '1 fardo'));
    dados.add(ListaExistente('Água com Gás', '1 fardo'));
    dados.add(ListaExistente('Suco de Uva', '1 garrafa'));
    dados.add(ListaExistente('Sabonete', '1 pacote'));
    dados.add(ListaExistente('Shampoo', '3 unidades'));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Mercado'),
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
                title: Text(dados[index].item),
                subtitle: Text(dados[index].quantidade),
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
                        title: const Text('Adicionar item'),
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
                                  labelText: 'digite o item',
                                  border: OutlineInputBorder(),
                                ),
                              ),

                              SizedBox(height: 10),

                              TextFormField(
                                controller: txtValor2,
                                style: TextStyle(fontSize: 10),
                                decoration: InputDecoration(
                                  labelText: 'digite a quantidade',
                                  border: OutlineInputBorder(),
                                ),
                              ),

                              SizedBox(height: 10),

                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    dados.add(ListaExistente(txtValor1.text, txtValor2.text));
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

class ListaExistente{
  //atributos
  final String item;
  final String quantidade;

  //construtor
  ListaExistente(this.item,this.quantidade);
}
