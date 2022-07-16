import 'package:flutter/material.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de Produto"),
      ),
      body: Form(
          child: ListView(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "nome"),
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "preço"),
            textInputAction: TextInputAction.next,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
          )
        ],
      )),
    );
  }
}
