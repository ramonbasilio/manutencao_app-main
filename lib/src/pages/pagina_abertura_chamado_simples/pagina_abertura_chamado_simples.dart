import 'package:flutter/material.dart';
import 'package:manutencao_app/src/service/envio_email.dart';
import 'package:provider/provider.dart';

class ConfirmacaoChamadoSimples {
  Future<void> mostraAlerta(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        final provider = Provider.of<EnvioEmail>(context, listen: false);
        return AlertDialog(
          title: const Text('Confirmação de chamado'),
          content: const Text(
              'Deseja enviar um alerta sobre a parada de uma máquina?'),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await EnvioEmail().alertaEmailSimples().then((value) {
                  final snackBar = SnackBar(
                    content: Text(value),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }).then((_) => Navigator.pop(context));
              },
              child: const Text('Confirmar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
