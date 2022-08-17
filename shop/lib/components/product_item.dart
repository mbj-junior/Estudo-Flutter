import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(
    this.product, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(product.imageUrl)),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.productForm,
                arguments: product,
              );
            },
            icon: const Icon(Icons.edit),
            color: Colors.purple,
          ),
          IconButton(
            onPressed: () {
              Provider.of<ProductList>(
                context,
                listen: false,
              ).removeProduct(product);
            },
            icon: const Icon(Icons.delete),
            color: Colors.red,
          )
        ]),
      ),
    );
  }
}
