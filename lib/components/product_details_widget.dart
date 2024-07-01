import 'package:flutter/material.dart';
import 'package:food_tracking_app/utils/constants.dart';
import 'package:food_tracking_app/utils/models/product.dart';

class ProductDetailsWidget extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: primaryColor,
        child: ListTile(
          title:
              Text(product.name, style: const TextStyle(color: Colors.white)),
          subtitle: Text(
            product.merchantName,
            style: const TextStyle(color: Colors.white54),
          ),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(product.image))),
            ),
          ),
          trailing: Text("${product.currency}${product.amount}", style: const TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }
}
