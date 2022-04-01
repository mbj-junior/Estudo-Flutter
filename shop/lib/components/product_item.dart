import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return GridTile(
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
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
