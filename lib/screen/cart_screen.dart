import 'package:ecommerce/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return Center(child: Text("Cart is empty"));
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    var item = cartController.cartItems[index];

                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text("${item.price} * ${item.quantity}"),
                      trailing: Row(
                        mainAxisSize: .min,
                        children: [
                          // ➖ decrease
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              cartController.decreaseQty(item);
                            },
                          ),

                          Text(item.quantity.toString()),

                          // ➕ increase
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: item.quantity >= 10
                                ? null
                                : () {
                                    cartController.increaseQty(item);
                                  },
                          ),

                          // 🗑 delete button
                          IconButton(
                            onPressed: () {
                              cartController.removeItem(item);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Obx(
                () => Text(
                  "Total: ${cartController.totalPrice}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
            ],
          );
        }
      }),
    );
  }
}
