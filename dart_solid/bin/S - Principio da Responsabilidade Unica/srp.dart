// "Uma classe deve ter apenas um motivo para mudar"
// Sua responsabilidade é sempre em cima de um e apenas um ator.

//Modo errado
class ContaCorrente {
  validarContaExiste() {
    // logica crucial de negocio
  }

  salvarModificacoes() {
    print("salvando no db....");
  }
}

/*

Solução: Devemos separa cada resposnsabilidade para sua regra de negocio crucial,
um objeto não pode e deve fazer mais do que é o dominio dele.

Lembre-se: sua funcionalidade não importa a granularidade(pacote/modulo/classe/metodo/função)
não deve fazer o quie não é o proposto, normalmente um Funcionário não deve ser capaz de adicionar um produto em seu dominio
um Produto não deve ser capaz de exercer controle sobreo banco de dados, um pacote que diz que faz A não deve fazer B

*/

class ContaCorrenteRepository {
  void save() => print("salvando no db....");
}

class Contacorrente2 {
  ContaCorrenteRepository repository = ContaCorrenteRepository();

  validaContaExiste() {
    // logica crucial de negocio
  }

  void salvarModificacoes() {
    repository.save();
  }
}
