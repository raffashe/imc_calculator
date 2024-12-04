# IMC Calculator - Flutter

Este projeto é a criação de uma calculadora de IMC (Índice de Massa Corporal) desenvolvida em Flutter, com o objetivo de aplicar os conceitos aprendidos no módulo 2 do curso de especialização em Flutter. O projeto foca na implementação de uma interface de usuário simples, no cálculo de IMC e na organização do código em boas práticas, além de incluir testes para garantir a funcionalidade correta.

## O que foi feito

1. **Criação da Classe Pessoa**:
   - A classe `Pessoa` foi criada para representar os dados do usuário. Ela contém três propriedades: `nome`, `peso` e `altura`, que são utilizadas para calcular o IMC. A classe está bem documentada, explicando o papel de cada atributo e como os dados são manipulados.

2. **Leitura de Dados do Usuário**:
   - Utilizamos campos de entrada para o nome, peso e altura do usuário. Esses dados são lidos a partir da interface de usuário e depois utilizados para realizar o cálculo do IMC. O código está bem documentado para facilitar a compreensão do fluxo de dados.

3. **Tratamento de Exceções**:
   - Foram implementadas verificações para garantir que os valores inseridos pelo usuário são válidos. Caso o usuário insira valores inválidos (como texto no lugar de números), o sistema exibe uma mensagem de erro. O tratamento de exceções está claro e bem explicado no código.

4. **Cálculo do IMC**:
   - O cálculo do IMC é realizado utilizando a fórmula padrão: IMC = peso / altura². Após o cálculo, o valor é formatado para exibir apenas duas casas decimais. O código responsável por essa lógica é simples e está bem documentado para garantir que qualquer pessoa consiga entender o processo de cálculo.

5. **Exibição do Resultado**:
   - O resultado do cálculo é exibido na tela com a classificação do IMC (Magreza grave, Magreza moderada, Saudável, Sobrepeso, etc.). O resultado também inclui o nome do usuário e o valor calculado do IMC, proporcionando uma interação clara e informativa para o usuário final.

6. **Testes**:
   - Foram implementados testes para verificar a funcionalidade do aplicativo, incluindo o cálculo correto do IMC e a renderização do resultado. Os testes são importantes para garantir que o aplicativo funcione corretamente mesmo após alterações no código.

## Organização do Projeto

A estrutura do projeto segue boas práticas de organização:

- **`models/`**: Contém a classe `Pessoa`, que representa os dados do usuário.
- **`utils/`**: Contém a função que calcula o IMC, separando a lógica de cálculo da interface do usuário.
- **`view/`**: Contém a tela principal (`home_screen.dart`), onde o usuário insere seus dados e visualiza o resultado.
- **`test/`**: Contém os testes unitários para garantir a funcionalidade do aplicativo.

## Conclusão

Este projeto foi desenvolvido para praticar os conceitos aprendidos no módulo de Dart do curso de especialização em Flutter, aplicando as melhores práticas de desenvolvimento e organização de código. Todos os códigos estão bem documentados, facilitando o entendimento e a manutenção do projeto. 
