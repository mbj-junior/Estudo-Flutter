//DIP - Depender de abstrações e não de classes concretas

class PagamentoRepository {
  void save() => print("Salvando pagamento");
}

class ContaConrrente {
  PagamentoRepository _repository;
  ContaConrrente(this._repository) {
    _repository = PagamentoRepository();
  }

  void execultarAlgumaLogica() {
    _repository.save();
  }
}

// void main(List<String> args) {
//   ContaConrrente c = ContaConrrente(_repository);
//   c.execultarAlgumaLogica();
// }

/*
  A violação aconte na linha 10 estanis deoebdebdi de uma classe concreta
  se quisermos fazer o mock por exemplo do Repository não é possivel
 */

// Solução
// Vamos inverter a resonsabilidade, e deixar que quem chamar a ContaCorrente resolva a dependencia do repository

abstract class IPagamentRepository {
  void save();
}

class PagamentoRepositoryImp implements IPagamentRepository {
  @override
  void save() => print("implementação");
}

class PagamentoRepositoryMock implements IPagamentRepository {
  @override
  void save() => print("mock");
}

class ContaCorrente2 {
  IPagamentRepository _repository;
  ContaCorrente2(IPagamentRepository repository) {
    _repository = repository;
  }

  void execultarAlgumaCoisa() {
    _repository.save();
  }
}

void main(List<String> args) {
  ContaCorrente2 c = ContaCorrente2(PagamentoRepositoryImp());
  c.execultarAlgumaCoisa();
  c = ContaCorrente2(PagamentoRepositoryMock());
}
