import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }
}

Widget _construirDetalhes() {
  return Scaffold(
    body: Column(
      children: <Widget>[
        _construirImagemDetalhe('assets/images/yakisoba.jpg'),
        _construirTituloDetalhes('yakisoba'),
        _construirLinhaIconeDetalhes('2-3 porções', '50 min'),
        _construirSubtituloDetalhes('Igrediente'),
        _construirTextoDetalhes('Igredietes'),
        _construirSubtituloDetalhes('Modo de preparo'),
        _construirTextoDetalhes('Modo de preparo'),
      ],
    ),
    appBar: _construirAppBar(),
  );
}

Widget _construirImagemDetalhe(imagem) {
  return Image.asset(imagem);
}

Widget _construirTituloDetalhes(titulo) {
  return Text(
    titulo,
    style: TextStyle(
      color: Colors.deepOrange,
      fontSize: 25,
    ),
  );
}

Widget _construirLinhaIconeDetalhes(rendimento, tempoPreparo) {
  return Row(
    children: <Widget>[
      _construirColunaIconeDetalhes(Icons.restaurant, rendimento),
      _construirColunaIconeDetalhes(Icons.timer, tempoPreparo),
    ],
  );
}

Widget _construirColunaIconeDetalhes(icone, texto) {
  return Expanded(
    child: Column(
      children: <Widget>[
        Icon(
          icone,
          color: Colors.deepOrange,
        ),
        Text(
          texto,
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _construirSubtituloDetalhes(subtitulo) {
  return Text(
    subtitulo,
    style: TextStyle(
      fontSize: 20,
    ),
  );
}

Widget _construirTextoDetalhes(texto) {
  return Text(texto);
}

Widget _construirAppBar() {
  return AppBar(title: Text('Cozinando em Casa'));
}
