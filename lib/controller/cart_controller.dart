import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  void addToCart(ProductModel product) {
    int index = cartItems.indexWhere((item) => item.title == product.title);

    if (index != -1) {
      if (cartItems[index].quantity < 10) {
        cartItems[index].quantity++;
      }
    } else {
      cartItems.add(product);
    }
    cartItems.refresh();
  }

  void increaseQty(ProductModel product) {
    if (product.quantity < 10) {
      product.quantity++;
      cartItems.refresh();
    }
  }

  void decreaseQty(ProductModel product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      cartItems.remove(product);
    }
    cartItems.refresh();
  }

  void removeItem(ProductModel product) {
    cartItems.remove(product);
    cartItems.refresh();
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
