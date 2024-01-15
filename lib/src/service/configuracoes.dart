import 'package:shared_preferences/shared_preferences.dart';

class Configuracoes {
  gravaEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('email', email);
  }

  Future<String> leEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String leitura = prefs.getString('email') ?? '';
    print('leitura: $leitura');
    return leitura;
  }
}
