// LSP - Os subtipos devem ser substituíveis pelo seus tipos base

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
  O exemplo fere o principio de LSP uma vez que as classes derivam de uma mesma conta.
*/