import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../service/envio_email.dart';

class PaginaAberturaChamado extends StatelessWidget {
  const PaginaAberturaChamado({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeUsuario = TextEditingController();
    final TextEditingController nomeMaquina = TextEditingController();
    final TextEditingController dataParada = TextEditingController();
    final TextEditingController horaParada = TextEditingController();
    final TextEditingController descricao = TextEditingController();
    final TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: nomeUsuario,
                decoration: const InputDecoration(labelText: 'Nome do Usuário'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: nomeMaquina,
                decoration: const InputDecoration(labelText: 'Nome da Máquina'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: dataParada,
                decoration: const InputDecoration(labelText: 'Data da Parada'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: horaParada,
                decoration: const InputDecoration(labelText: 'Hora da Parada'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: descricao,
                decoration:
                    const InputDecoration(labelText: 'Descrição da Parada'),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  final resposta = await EnvioEmail.enviarEmail(
                    email: email.text,
                    nomeUsuario: nomeUsuario.text,
                    dataParada: dataParada.text,
                    descricao: descricao.text,
                    horaParada: horaParada.text,
                    nomeMaquina: nomeMaquina.text,
                  );
                  final snackBar = SnackBar(
                    content: Text(resposta),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
