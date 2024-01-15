// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:manutencao_app/src/pages/pagina_abertura_chamado_simples/pagina_abertura_chamado_simples.dart';

// ignore: must_be_immutable
class WidgetCardPageInicial extends StatelessWidget {
  bool? chmadoSimples;
  Widget? rota;
  String nome;
  WidgetCardPageInicial({
    Key? key,
    this.chmadoSimples,
    this.rota,
    required this.nome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (rota != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => rota!,
            ),
          );
        } else if (chmadoSimples != null) {
          ConfirmacaoChamadoSimples().mostraAlerta(context);
        }
      },
      child: Card(
        margin: const EdgeInsets.all(15),
        color: const Color(0xFFf47c44),
        child: SizedBox(
          height: 50,
          child: Center(
              child: Text(
            nome,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
