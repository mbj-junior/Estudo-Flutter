import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 20),
                  Chip(
                      backgroundColor: Colors.purple,
                      label: Text(
                        "R\$${cart.totalAmount}",
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline5
                                ?.color),
                      )),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text("COMPRAR"),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
