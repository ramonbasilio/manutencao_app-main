import 'package:flutter/material.dart';
import '../../service/configuracoes.dart';
import 'package:email_validator/email_validator.dart';

class PaginaConfiguracao extends StatefulWidget {
  const PaginaConfiguracao({super.key});

  @override
  State<PaginaConfiguracao> createState() => _PaginaConfiguracaoState();
}

class _PaginaConfiguracaoState extends State<PaginaConfiguracao> {
  String email = '';
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    _leDados();
    super.initState();
  }

  _leDados() async {
    await Configuracoes().leEmail().then(
      (value) {
        setState(() {
          email = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuracoes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              email.isEmpty
                  ? const Text('E-MAIL GRAVADO: nenhum e-mail salvo',
                      style: TextStyle(color: Colors.red, fontSize: 17))
                  : Text('E-MAIL GRAVADO: $email'),
              TextFormField(
                controller: emailController,
                decoration:
                    const InputDecoration(labelText: 'atualizar e-mail'),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty) {
                      Configuracoes().gravaEmail(emailController.text.trim());
                      setState(() {
                        email = emailController.text;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Salvar e-mail'))
            ],
          ),
        ),
      ),
    );
  }
}
