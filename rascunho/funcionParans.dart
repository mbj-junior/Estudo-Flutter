class Produto {
  late String nome;
  late double preco;

  Produto({required this.nome, this.preco = 9.99});
}

int exec(int fa, int fb, int Function(int, int) fn) {
  return fn(fa, fb);
}

main() {
  final r = exec(2, 3, (a, b) => a - b);

  print('o resultado é $r');

  var p1 = new Produto(nome: 'Caneta');
  var p2 = new Produto(preco: 9.99, nome: 'Caneta');


  p1.nome = 'Lapis';
  p1.preco = 4.23;

  print('o Produto ${p1.nome} tem preço de R\$: ${p1.preco}');
  print('o Produto ${p2.nome} tem preço de R\$: ${p2.preco}');

}
