import 'package:flutter_test/flutter_test.dart';
import 'package:mercado_inteligente/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MercadoInteligente()); // CORRIGIDO O NOME AQUI

    // Verifica se o título do app aparece na tela
    expect(find.text('Mercado Inteligente'), findsOneWidget);
  });
}