// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela02.dart';

import 'Login.dart';
import 'tela01.dart';

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
      initialRoute: 'principal',
      routes: {
        'principal' : (context)  => PrincipalView(),
        't1' : (context)  => TelaInicial(),
        't2' : (context)  => TelaLista(),
      },
    );
  }
}

