import 'package:flutter/material.dart';
import 'package:shop/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(cartItem.name);
  }
}
