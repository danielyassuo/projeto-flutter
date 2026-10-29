import 'package:flutter/material.dart';
import 'package:untitled/PaginaInicial.dart';


class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Projeto bolinha',
      debugShowCheckedModeBanner: false,
      home: PaginaInicial(),
    );
  }
}