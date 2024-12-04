import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:imc_calculator/view/home_screen.dart';

void main() {
  group('HomeScreen Test', () {
    testWidgets('Verificar se o botão de calcular está presente',
        (WidgetTester tester) async {
      /// Carrega a tela principal
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      /// Verifica se o botão de calcular está presente
      expect(find.text('Calcular'), findsOneWidget);
    });

    testWidgets('Verificar cálculo do IMC', (WidgetTester tester) async {
      /// Carrega a tela principal
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      /// Insere valores para o nome, altura e peso
      await tester.enterText(find.byType(TextField).at(0), 'João');
      await tester.enterText(
          find.byType(TextField).at(1), '1.75'); // Altura em metros
      await tester.enterText(find.byType(TextField).at(2), '70'); // Peso em kg

      /// Clica no botão para calcular
      await tester.tap(find.text('Calcular'));
      await tester.pump(); // Atualiza a tela

      /// Verifica se o resultado é exibido com o nome e o IMC
      expect(find.textContaining('Nome: João'), findsOneWidget);
      expect(find.textContaining('IMC:'), findsOneWidget);
    });

    testWidgets('Verificar resultado do IMC saudável',
        (WidgetTester tester) async {
      /// Carrega a tela principal
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      /// Insere valores válidos para cálculo do IMC (por exemplo, peso e altura para IMC saudável)
      await tester.enterText(find.byType(TextField).at(0), 'Maria');
      await tester.enterText(
          find.byType(TextField).at(1), '1.70'); // Altura em metros
      await tester.enterText(find.byType(TextField).at(2), '60'); // Peso em kg

      /// Clica no botão para calcular
      await tester.tap(find.text('Calcular'));
      await tester.pump(); // Atualiza a tela

      /// Verifica se a classificação foi calculada corretamente
      expect(find.textContaining('Classificação: Saudável'), findsOneWidget);
    });

    testWidgets('Verificar exibição de mensagem de erro com valores inválidos',
        (WidgetTester tester) async {
      /// Carrega a tela principal
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      /// Insere valores inválidos (por exemplo, altura negativa)
      await tester.enterText(find.byType(TextField).at(0), 'Pedro');
      await tester.enterText(find.byType(TextField).at(1), '-1.80');
      await tester.enterText(find.byType(TextField).at(2), '70');

      /// Clica no botão para calcular
      await tester.tap(find.text('Calcular'));
      await tester.pump(); // Atualiza a tela

      /// Verifica se a mensagem de erro é exibida
      expect(find.text('Por favor, insira valores válidos'), findsOneWidget);
    });
  });
}
