/*ISP - Muitas interfazer especificas são melhores que uma geral*/
abstract class Conta {
  void depositar(int valor);
  void transferir(int valor);
  void realizarEmprestimo();
}

class ContaCorrente implements Conta {
  @override
  void depositar(int valor) => print("realizando...");

  @override
  void transferir(int valor) => print("realizando...");

  @override
  void realizarEmprestimo() => print("realizando...");
}

class ContaPoupanca implements Conta {
  @override
  void depositar(int valor) => ("realizando ...");

  @override
  void transferir(int valor) => throw Exception("Conta poupança não tranfere");

  @override
  void realizarEmprestimo() =>
      throw Exception("Conta poupança não faz emprestimo");
}

void main() {
  Conta c = ContaCorrente();
  c.realizarEmprestimo();
  c = ContaPoupanca();
  c.realizarEmprestimo();
}

/*
  O Problema aqui é que estamos dependendo da Conta
  e conta dos oferece mais coisas do que realmente estamos utilizando
*/

// Solução

abstract class Conta2 {
  void depositar(int valor);
}

abstract class CestaDeServicos {
  void transferir(int valor);
  void realizarEmprestimo();
}

class ContaCorrente2 extends Conta2 implements CestaDeServicos {
  @override
  void depositar(int valor) => "Deposito de $valor";

  @override
  void realizarEmprestimo() => "Imprestimo Realizado";

  @override
  void transferir(int valor) => "$valor transferido";
}

class ContaPoupanca2 extends Conta2 {
  @override
  void depositar(int valor) => "Deposito de $valor";
}

class ContaConjunto extends Conta2 {
  @override
  void depositar(int valor) => "Deposito de $valor";
}
