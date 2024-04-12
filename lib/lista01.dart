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
  List<Item> lista1 = [];
  List<Item> lista2 = [];

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  var txtPesquisar = TextEditingController();

  @override
  void initState() {
    lista1.add(Item('Refrigerante', '1 fardo', false));
    lista1.add(Item('Água com Gás', '1 fardo', false));
    lista1.add(Item('Suco de Uva', '1 garrafa', false));
    lista1.add(Item('Sabonete', '1 pacote', false));
    lista1.add(Item('Shampoo', '3 unidades', false));
    lista2.addAll(lista1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mercado'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          //Quantidade de itens
          itemCount: lista1.length,

          //Aparência de cada item
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(lista1[index].nome),
                subtitle: Text(lista1[index].quantidade),
                trailing: Switch(
                  value: lista1[index].marcado,
                  onChanged: (value) {
                    setState(() {
                      lista1[index].marcado = value;
                      lista2[index].marcado = value;
                    });
                  },
                ),
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                        title: const Text('Editar item'),
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
                                      lista1[index] = Item(
                                        txtValor1.text,
                                        txtValor2.text,
                                        lista1[index].marcado,
                                      );
                                      lista2[index] = Item(
                                        txtValor1.text,
                                        txtValor2.text,
                                        lista1[index].marcado,
                                      );
                                    });
                                    Navigator.pop(context, 'Sair');
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            )))),
                onLongPress: () {
                  setState(() {
                    lista1.removeAt(index);
                    lista2.removeAt(index);
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
                        lista1.add(
                          Item(txtValor1.text, txtValor2.text, false),
                        );
                        lista2.add(
                          Item(txtValor1.text, txtValor2.text, false),
                        );
                      });
                      Navigator.pop(context, 'Sair');
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: Icon(Icons.add),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: TextFormField(
            controller: txtPesquisar,
            style: TextStyle(fontSize: 10),
            decoration: InputDecoration(
              labelText: 'Pesquisar',
            ),
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) {
                  lista1.clear();
                  for (Item item in lista2) {
                    if (item.nome.toLowerCase().contains(value.toLowerCase())) {
                      lista1.add(item);
                    }
                  }
                } else {
                  lista1.clear();
                  lista1.addAll(lista2);
                }
                print(value);
              });
            },
          ),
        ),
      ],
    );
  }
}

class Item {
  //atributos
  final String nome;
  final String quantidade;
  bool marcado;

  //construtor
  Item(this.nome, this.quantidade, this.marcado);
}
