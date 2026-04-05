import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final ProductModel product;

  DetailScreen({required this.product});

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.image),
          Text(product.title),
          Text("${product.price}"),
          Obx(() {
            bool isAdded = cartController.cartItems.any(
              (item) => item.title == product.title,
            );
            return ElevatedButton(
              onPressed: isAdded
                  ? null
                  : () {
                      cartController.addToCart(product);
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: isAdded ? Colors.grey : Colors.blue,
              ),
              child: Text(isAdded ? "Added" : "Add to Cart"),
            );
          }),
        ],
      ),
    );
  }
}
