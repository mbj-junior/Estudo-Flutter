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
}
