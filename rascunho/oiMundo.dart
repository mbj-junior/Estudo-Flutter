main() {
  String livre = 'hello Word';
  livre = 'teste';
  print(livre);

  print(livre is int);

  var nomes = ['0', '1', '2'];
  nomes.add('valorAdd1');
  nomes.add('valorAdd2');
  nomes.add('valorAdd3');
  print(nomes.length);
  print(nomes.elementAt(5));
  print(nomes[5]);

  dynamic xis = 'variavel dinamica';
  xis = 123;
  xis = false;

  final a = 'variaveis não multaveis';
  const b = 'variavel tbm não multavel';

  Set<int> conjunto = {0,1,2,3,4,4,4,4,4};
  print(conjunto.length);
  print(conjunto is Set);

  Map<String, double> notaDosAlunos = {
    'Ana': 9.6,
    'Bia':7,
    'Calos': 6.66,
  };
  for (var chave in notaDosAlunos.values) {
    print('chave = $chave');
  }

  for (var registro in notaDosAlunos.entries) {
    print('${registro.key} = ${registro.value}');
  }


}
