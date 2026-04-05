import 'dart:convert';
import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {

  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try{
      isLoading(true);

      final response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );

      if(response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List products = data["products"];

        productList.value =
            products.map((e) => ProductModel.fromJson(e)).toList();
      }
    }finally{
      isLoading(false);
    }
  }
}