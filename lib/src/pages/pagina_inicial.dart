
import 'package:flutter/material.dart';
import 'package:manutencao_app/src/pages/pagina_abertura_chamado/pagina_abertura_chamado.dart';
import 'package:manutencao_app/src/pages/pagina_configuracao/pagina_configuracao.dart';
import 'package:manutencao_app/src/service/envio_email.dart';
import '../widget/widget_card_pagina_inicial.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Almapy - Automotive System')),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Configurações"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Logout"),
              ),
            ],
            onSelected: (value) {
              if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginaConfiguracao(),
                  ),
                );
              }
            },
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          WidgetCardPageInicial(
            nome: 'CHAMADO COMPLETO',
            rota: const PaginaAberturaChamado(),
          ),
          WidgetCardPageInicial(
            chmadoSimples: true,
            nome: 'CHAMADO SIMPLES',
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              color:const Color(0xFFfcfcfc),
              height: 200,
              child: Image.asset(
                  'assets/logo.png'),
            ),
            Container(
              color:const Color(0xFF040404),
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
