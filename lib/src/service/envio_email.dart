import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'configuracoes.dart';

class EnvioEmail extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  String _email = '';
  String get email => _email;

  static Future<String> enviarEmail({
    required String nomeUsuario,
    required String nomeMaquina,
    required String dataParada,
    required String horaParada,
    required String descricao,
    required String email,
  }) async {
    String serviceId = 'service_o3s6mpa';
    String templateId = 'template_cncax9n';
    String userId = 'JyDdZUNse5YkQqfFp';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final resposta = await http.post(url,
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_email': email,
            'usuario': nomeUsuario,
            'nome_equipamento': nomeMaquina,
            'data_parada': dataParada,
            'hora_parada': horaParada,
            'descricao': descricao,
          },
        }));
    if (resposta.statusCode == 200) {
      return 'Enviado com sucesso';
    } else {
      return 'Ocorreu um erro ao salvar';
    }
  }

  Future<String> leDados() async {
    String resultado;
    resultado = await Configuracoes().leEmail();
    return resultado;
  }

  Future<String> alertaEmailSimples() async {
    _loading = true;
    print('1: $_loading');
    String serviceId = 'service_o3s6mpa';
    String templateId = 'template_dq1u74b';
    String userId = 'JyDdZUNse5YkQqfFp';
    _email = await leDados();

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final resposta = await http.post(url,
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'reply_to': _email,
            'data':
                '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
            'hora': '${DateTime.now().hour}:${DateTime.now().minute}'
          },
        }));

    _loading = false;
    print('2: $_loading');
    notifyListeners();
    if (resposta.statusCode == 200) {
      return 'Enviado com sucesso';
    } else {
      return 'Ocorreu um erro ao enviar mensagem';
    }
  }
}
