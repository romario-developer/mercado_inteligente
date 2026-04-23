import 'package:flutter/material.dart';
import 'database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Isar
  await DatabaseService().init();
  
  runApp(const MercadoInteligente());
}

class MercadoInteligente extends StatelessWidget {
  const MercadoInteligente({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercado Inteligente',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(child: Text('Banco de Dados Pronto!')),
      ),
    );
  }
}