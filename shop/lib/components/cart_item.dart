import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text("${cartItem.price}"),
              ),
            )),
        title: Text(cartItem.name),
        subtitle: Text("Total: R\$ ${cartItem.price * cartItem.price}"),
        trailing: Text("${cartItem.quantity}x"),
      ),
    );
  }
}
