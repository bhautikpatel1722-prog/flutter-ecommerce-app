import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/screen/cart_screen.dart';
import 'package:ecommerce/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final pController = Get.put(ProductController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-commerce App"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Obx(() {
        if (pController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: pController.productList.length,
            itemBuilder: (context, index) {
              var product = pController.productList[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Get.to(() => DetailScreen(product: product));
                  },
                  contentPadding: EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("${product.price}"),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
