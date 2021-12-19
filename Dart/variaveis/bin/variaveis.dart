void main() {
  // 1 - Introdução a Variaveis

  String variavelNome = "Marcio";
  print(variavelNome);

  int valorVariavel = 10;
  print(valorVariavel);

  bool ehVerdadeiro = true;
  print(ehVerdadeiro);

  List<String> listaDePalavras = ["Marcio", "Botelho", "Junior"];
  print('${listaDePalavras[0]} ${listaDePalavras[1]} ${listaDePalavras[2]}');

  // 2 - introdução null-safety

  //com ? a variável pode aceitar null
  String? nome;
  nome = "ABC";
  // com ! não aceita que seja null
  print(nome!);

  // late aceita null na criação
  late String sobrenome;
  sobrenome = "não é null";
  print(sobrenome);

  // 3 - IF e SWITCH
  bool seguirEmFrente = false;

  if (seguirEmFrente) {
    print("andar");
  } else {
    print("parar");
  }

  int valorInt = 5;
  switch (valorInt) {
    case 0:
      print("ZERO");
      break;
    case 1:
      print("UM");
      break;
    case 2:
      print("DOIS");
      break;
    default:
      print("PADRÃO");
  }

  // 4 - Estruturas de repetições
  print("for");
  for (var i = 0; i <= 10; i++) {
    print(i);
  }
  print("while");
  int contador = 10;
  while (contador != -10) {
    contador--;
    print(contador);
  }

  // 5 - Métodos e classes
  Celular celularDoMarcio = Celular("Azul", 5, 0.8, 5.7);
  Celular celularDaAdila = Celular("Preto", 10, 0.100, 3.7);

  print(celularDoMarcio.toString());
  print(celularDaAdila.toString());
  double resultado = celularDoMarcio.valorDoCelular(50);
  print(resultado);

  // 6 - Ortientação a objeto
  Carro mercedes = Carro("Mercedes");
  Carro gol = Carro("Gol");

  print(mercedes.valorDoCarro);
}

// 5 - Métodos e classes
class Celular {
  final String cor;
  final int qtdPros;
  final double tamanho;
  final double peso;

  Celular(this.cor, this.qtdPros, this.peso, this.tamanho);

  String toString() {
    return "Cor $cor, qtdPros $qtdPros, tamanho $tamanho, peso $peso";
  }

  double valorDoCelular(double valor) {
    return valor * qtdPros;
  }
}

// 6 - Ortientação a objeto
class Carro {
  final String modelo;
  String _segredo = "Muito dinheiro";
  int _valor = 1000;

  int get valorDoCarro => _valor;

  void setValue(int valor) => _valor = valor;

  Carro(this.modelo);
}
