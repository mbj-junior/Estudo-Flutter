import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Theme.of(context).errorColor),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      ),
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Tem Certeza"),
            content: const Text("Quer remover o item do carrinho"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Não")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Sim")),
            ],
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      child: Card(
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
          subtitle: Text("Total: R\$ ${cartItem.price * cartItem.quantity}"),
          trailing: Text("${cartItem.quantity}x"),
        ),
      ),
    );
  }
}
