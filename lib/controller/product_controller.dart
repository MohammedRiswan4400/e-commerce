import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:trogon_e_coomerce/model/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await http.get(
          Uri.parse('https://fake-store-api.mock.beeceptor.com/api/products'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        productList.value =
            data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch products');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
