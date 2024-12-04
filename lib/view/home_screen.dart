import 'package:flutter/material.dart';
import 'package:imc_calculator/models/pessoa.dart';
import 'package:imc_calculator/utils/imc_calculator.dart';

/// Tela principal do aplicativo.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nomeController = TextEditingController();

  /// Controlador do campo nome
  final TextEditingController _alturacontroller = TextEditingController();

  /// Controlador da altura
  final TextEditingController _pesoController = TextEditingController();

  /// Controlador do peso

  String _resultado = '';

  /// Resultado do cálculo do IMC

  /// Função para calcular o IMC
  void _calcularIMC() {
    String nome = _nomeController.text;

    /// Obtém o nome da pessoa

    /// Converte peso e altura para double ou usa 0 se for inválido
    double peso = double.tryParse(_alturacontroller.text) ?? 0;
    double altura = double.tryParse(_pesoController.text) ?? 0;

    if (peso > 0 && altura > 0) {
      /// Verifica se os valores são válidos
      Pessoa pessoa = Pessoa(nome: nome, altura: altura, peso: peso);

      /// Cria a instância da pessoa

      /// Calcula o IMC
      double imc = ImcCalculator.calculadoraImc(pessoa.altura, pessoa.peso);

      /// Formata o IMC com 2 casas decimais
      String imcStr = imc.toStringAsFixed(2);

      /// Classifica o IMC
      String classificacao;
      if (imc < 16) {
        classificacao = 'Magreza grave';
      } else if (imc >= 16 && imc < 17) {
        classificacao = 'Magreza moderada';
      } else if (imc >= 17 && imc < 18.5) {
        classificacao = 'Magreza leve';
      } else if (imc >= 18.5 && imc < 25) {
        classificacao = 'Saudável';
      } else if (imc >= 30 && imc < 35) {
        classificacao = 'Obesidade grau I';
      } else if (imc >= 35 && imc < 40) {
        classificacao = 'Obesidade grau II (severa)';
      } else {
        classificacao = 'Obesidade grau III (mórbida)';
      }

      setState(() {
        /// Atualiza a interface com o resultado
        _resultado =
            'Nome: ${pessoa.nome}\nIMC: $imcStr\nClassificação: $classificacao';
      });
    } else {
      setState(() {
        /// Exibe erro se valores forem inválidos
        _resultado = 'Por favor, insira valores válidos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Campo para o nome
            TextField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome')),

            /// Campo para a altura
            TextField(
              controller: _alturacontroller,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),

            /// Campo para o peso
            TextField(
              controller: _pesoController,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),

            const SizedBox(height: 20),

            /// Botão para calcular IMC
            ElevatedButton(
                onPressed: _calcularIMC, child: const Text('Calcular')),

            const SizedBox(height: 20),

            /// Exibe o resultado
            Text(_resultado,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24))
          ],
        ),
      ),
    );
  }
}
