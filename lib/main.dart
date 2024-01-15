import 'package:flutter/material.dart';
import 'package:manutencao_app/src/pages/pagina_inicial.dart';
import 'package:manutencao_app/src/service/envio_email.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<EnvioEmail>(
      create: (context) => EnvioEmail(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    MaterialColor _colorSwatch(int hexColor) {
    return MaterialColor(
      hexColor,
      <int, Color>{
        50: Color(hexColor),
        100: Color(hexColor),
        200: Color(hexColor),
        300: Color(hexColor),
        400: Color(hexColor),
        500: Color(hexColor),
        600: Color(hexColor),
        700: Color(hexColor),
        800: Color(hexColor),
        900: Color(hexColor),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        primarySwatch: _colorSwatch(0xFFf47c44),  
        secondaryHeaderColor: Colors.white
      ),
      home: const PaginaInicial(),
    );
  }
}
