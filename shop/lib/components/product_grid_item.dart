import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return GridTile(
      footer: GridTileBar(
        leading: Consumer<Product>(
          builder: (context, product, child) => IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Colors.red,
          ),
        ),
        backgroundColor: Colors.black54,
        title: Text(
          product.name,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text("Produto adiciona com sucesso!"),
                duration: const Duration(seconds: 2),
                action: SnackBarAction(
                  label: "DESFAZER",
                  onPressed: () {
                    cart.removeSingleItem(product.id);
                  },
                )));
            cart.addItem(product);
          },
          icon: const Icon(Icons.shopping_cart),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      child: GestureDetector(
        child: Image.network(
          product.imageUrl,
          fit: BoxFit.cover,
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.productDetail, arguments: product);
        },
      ),
    );
  }
}
