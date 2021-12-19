void main() async {
  // Future, Async e Await
  String nome = "Marcio";
  Future<String> cepFuturo = getCepByName("Rua A");
  late String cep;

  // cepFuturo.then((result) => cep = result);

  cep = await cepFuturo;

  print(cep);
}

// external service
Future<String> getCepByName(String name) {
  //simulando requisição
  return Future.value("123");
}
